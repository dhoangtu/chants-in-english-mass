#!/bin/bash
set -x

LYFILES="/home/dhtu/Desktop/CATH/chants-in-english-mass/song"
DELIMITER="@"

GEN=./pdf-generated
mkdir ${GEN}

CONTENT=./content-table.csv
rm -rf ${CONTENT}

# scan .ly files
pagecounter=1
filelist=()
for fullname in ${LYFILES}/*.ly
do
    echo "=== Generating $fullname "
    name=`basename -- "$fullname"`
    shortname="${name%.*}"
    
    # get title
    title=`cat ${fullname} | grep " title" | grep "=" | sed 's/^[^"]*"//g' | sed -e 's/[[:space:]]*$//'`
    # remove last character
    title=${title%?}
    #echo "title: ${title}"
    
    # get composer
    composer=`cat ${fullname} | grep "composer" | grep "=" | sed 's/^[^"]*"//g' | sed -e 's/[[:space:]]*$//'`
    # remove last character
    composer=${composer%?}
    #echo "composer: ${composer}"
    
    # generate pdf files
    lilypond --output="${GEN}/${shortname}" -dno-point-and-click --pdf "$fullname"
    
    #page counter
    echo "${title};${pagecounter}" >> ${CONTENT}
    # starting page of next song
    #pageno=`pdfinfo "${GEN}/${title}${DELIMITER}${composer}.pdf" | grep "Pages" | grep -Eo '[0-9]+'`
    echo "${title}${DELIMITER}${composer}.pdf : ${pageno} pages"
    #pagecounter=$(( $pageno + $pagecounter ))
    
    filelist+=( "${GEN}/${shortname}.pdf" )
    
    echo "" 
done

# combine songs
pdftk "${filelist[@]}" cat output songs.pdf

# add page numbers, adjust inner/outer margins of odd/even pages, scale pages
pdflatex song-odd-even.tex

# add covers
pdftk cover-front.pdf cover-inner.pdf blank-a5.pdf preface-vn.pdf preface-en.pdf song-odd-even.pdf \
  contents.pdf blank-a5.pdf cover-back.pdf cat output chants-in-english-mass.pdf

# remove temporary files
#rm -rf ${GEN} ${RESIZED} songs.pdf song-odd-even.pdf song-book.pdf book-adjusted.pdf

