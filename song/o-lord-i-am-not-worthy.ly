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
  title = "O Lord, I Am Not Worthy"
  composer = "NON DIGNUS 76.76"
  tagline = ##f
}

global= {
  \key bes \major
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
  \partial 4 d8 (ees) |
  %{	01	%} f4 g f bes |
  %{	02	%} bes a2 a8 (bes) |
  %{	03	%} c4 ees, g f |
  %{	04	%} d2. d8 (ees) |
  %{	05	%} f4 f bes a |
  %{	06	%} a g2 g4 |
  %{	07	%} f bes a c |
  %{	08	%} bes1 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  O Lord, I am not wor -- thy
  That Thou shouldst come to me,
  But speak the words of com -- fort,
  My spir -- it healed shall be.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  And hum -- ble I'll re -- ceive Thee,
  The Bride -- groom of my soul,
  No more by sin to grieve Thee,
  Or fly thy sweet con -- trol.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  O sac -- ra -- ment most ho -- ly!
  O sac -- ra -- ment di -- vine!
  All praise and all thanks -- giv -- ing
  Be ev' -- ry mo -- ment thine!
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
