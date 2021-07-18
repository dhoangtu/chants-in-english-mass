%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONTENTS OF THIS DOCUMENT
% 1. Common settings
% 2. Verse music
% 3. Verse lyrics
% 4. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Common settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\version "2.22.1"

\header {
  title = "O Holy Spirit, Lord Of Grace"
  composer = "Thomas Tallis, Charles Coffin"
  tagline = ##f
}

global= {
  \key d \major
  \time 4/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override Lyrics.LyricSpace.minimum-distance = #3.0
}

\paper {
  #(set-paper-size "a5")
  top-margin = 3.2\mm
  bottom-marign = 10\mm
  left-margin = 10\mm
  right-margin = 10\mm
  indent = #0
  #(define fonts
	 (make-pango-font-tree "Liberation Serif"
	 		       "Liberation Serif"
			       "Liberation Serif"
			       (/ 20 20)))
  system-system-spacing = #'((basic-distance . 3) (padding . 3))
}

printItalic = {
  \override LyricText.font-shape = #'italic
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseSoprano = \relative c' {
                    \partial 4 d4 |
  %{	01	%} fis g a a |
  %{	02	%} b b a a |
  %{	03	%} d cis b b |
  %{	04	%} a2 r4 d, |
  %{	05	%} fis g a a |
  %{	06	%} b b a d, |
  %{	07	%} g fis e e |
  %{	08	%} d1 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  O Ho -- ly Spi -- rit, Lord of grace,
  E -- ter -- nal fount of love,
  In -- flame, we pray, our in -- most hearts
  With fire from heav'n a -- bove.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  As Thou in bond of love dost join
  The Fath -- er and the Son,
  So fill us all with mut -- ual love,
  And knit our hearts in one.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  All glo -- ry to the Fath -- er be,
  All glo -- ry to the Son,
  All glo -- ry, Ho -- ly Ghost, to Thee,
  While end -- less ag -- es run.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "sopranos" { \global   \musicVerseSoprano }
      >>
      \new Lyrics \lyricsto sopranos \verseOne
      \new Lyrics \with \printItalic \lyricsto sopranos \verseTwo
      \new Lyrics \lyricsto sopranos \verseThree
    >>
}
