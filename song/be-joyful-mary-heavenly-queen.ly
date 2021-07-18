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
  title = "Be Joyful, Mary, Heavenly Queen"
  composer = "Latin: Regina Ceali Jubila, Anon"
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
  system-system-spacing = #'((basic-distance . 3) (padding . 5))
}

printItalic = {
  \override LyricText.font-shape = #'italic
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseSoprano = \relative c' {
                    \partial 4 f4 |
  %{	01	%} f c' a f |
  %{	02	%} g g a c |
  %{	03	%} bes a g2 |
  %{	04	%} f2. bes4 |
  %{	05	%} bes bes a g |
  %{	06	%} a b! c2 |
  %{	07	%} bes4 a g2 |
  %{	08	%} f r4 c' |
  %{	09	%} d c bes a |
                    g2 f4 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Be joy -- ful, Mar -- y heav'n -- ly Queen, be joy -- ful, Mar -- y!
  Your grief is changed to joy se -- rene,
  Al -- le -- lu -- ia! Re -- joice, re -- joice, O Mar -- y!
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  The Son you bore by hea -- ven's grace, be joy -- ful, Mar -- y!
  Did by his death our guilt e -- rase,
  Al -- le -- lu -- ia! Re -- joice, re -- joice, O Mar -- y!
}

verseThree = \lyricmode {
  \set stanza = #"3."
  The Lord has ris -- en from the dead, be joy -- ful, Mar -- y!
  He rose in glo -- ry as He said,
  Al -- le -- lu -- ia! Re -- joice, re -- joice, O Mar -- y!
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Then pray to God, O Vir -- gin fair, be joy -- ful, Mar -- y!
  That He our souls to beav -- en bear,
  Al -- le -- lu -- ia! Re -- joice, re -- joice, O Mar -- y!
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
      \new Lyrics \with \printItalic \lyricsto sopranos \verseFour
    >>
}
