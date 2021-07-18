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
  title = "Come Holy Ghost, Who Ever One"
  composer = "St. Ambrose of Milan"
  tagline = ##f
}

global= {
  \key f \major
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
                    \partial 4 a'4 |
  %{	01	%} f d a' d |
  %{	02	%} c4. b!8 a4 f |
  %{	03	%} g a bes a |
  %{	04	%} g4. f8 f4 c' |
  %{	05	%} a b! c d |
  %{	06	%} b!4. a8 a4 e |
  %{	07	%} f g a f |
  %{	08	%} e4. d8 d4 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Come, Ho -- ly Ghost, who ev -- er one
  Are with the Fa -- ther and the Son;
  Come, Ho -- ly Ghost, our souls pos -- sess
  With your full flood of ho -- li -- ness.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  In will and deed, by heart and tongue,
  With all our pow'rs, your praise be sung;
  And love light up our mor -- tal frame,
  Till oth -- ers catch the liv -- ing flame.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Al -- might -- y Fa -- ther, bear our cry
  Through Je -- sus Christ our Lord most high,
  Whom with the Spi -- rit we a -- dore
  And sing your praise for -- ev -- er -- more.
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
