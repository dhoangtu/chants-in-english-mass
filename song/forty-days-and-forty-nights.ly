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
  title = "Forty Days And Forty Nights"
  composer = "Martin Herbst, George Hunt Smyttan"
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
musicVerseSoprano = \relative c'' {
  %{	01	%} a4 a d, e |
  %{	02	%} f g a2 |
  %{	03	%} a4 a8 (b!) c4 c |
  %{	04	%} b! b a2 |
  %{	05	%} a4 a bes bes |
  %{	06	%} g g a2 |
  %{	07	%} a4 a g f |
  %{	08	%} e e d2 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  For -- ty days and for -- ty nights
  Thou wast fast -- ing in the wild;
  For -- ty days and for -- ty nights
  Tempt -- ed, and yet un -- de -- filed.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Shall not we thy sor -- row share,
  And from earth -- ly joys ab -- stain,
  Fast -- ing with un -- ceas -- ing prayer,
  Glad with Thee to suf -- fer pain?
}

verseThree = \lyricmode {
  \set stanza = #"3."
  And if Sa -- tan, vex -- ing sore,
  Flesh or spi -- rit should as -- sail,
  Thou, his van -- quish -- er be -- fore,
  Grant we may not faint nor fail.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  So shall we have peace di -- vine,
  Ho -- lier glad -- ness ours shall be;
  Round us, too, shall an -- gels shine,
  Such as min -- is -- tered to Thee.
}

verseFive = \lyricmode {
  \set stanza = #"5."
  Keep, o keep us, Sav -- ior dear,
  Ev -- er con -- stant by thy side;
  That with thee we may ap -- pear
  At "the_e" -- ter -- nal East -- er -- tide.
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
      \new Lyrics \lyricsto sopranos \verseFive
    >>
}
