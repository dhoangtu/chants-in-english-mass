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
  title = "Virgin-Born, We Kneel Before Thee"
  composer = "Harriet, Medieval Melody"
  tagline = ##f
}

global= {
  \key f \major
  \time 3/4
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
  %{	01	%} f2 a4 |
  %{	02	%} c2 a4 |
  %{	03	%} bes (c) d |
  %{	04	%} c2 g4 |
  %{	05	%} a (bes) c |
  %{	06	%} bes (a) g |
  %{	07	%} f2 d4 |
  %{	08	%} e2 c4 |
  %{	09	%} a'2 bes4 |
  %{	10	%} c2 d4 |
  %{	11	%} c2 g4 |
  %{	12	%} a2. |
  %{	13	%} bes2 bes4 |
  %{	14	%} g (g) f |
  %{	15	%} f (d) e |
  %{	16	%} f2. \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Vir -- gin -- born, we kneel be -- fore thee;
  Bless -- ed was the womb that bore thee;
  Ma -- ry, Moth -- er meek and mild,
  Bless -- ed was she in her Child.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Bless -- ed was the breast that fed thee;
  Bless -- ed was the hand that led thee;
  Bless -- ed was the watch she kept
  As the Ho -- ly Christ Child slept.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Bless -- ed she by all cre -- a -- tion,
  who brought forth the world's sal -- va -- tion,
  Bless -- ed they, for ev -- er blest,
  Who love most and serve thee best.
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
