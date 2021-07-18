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
\version "2.18.2"

\header {
  title = "Wondrous Gift!"
  composer = "Coblenz, Hoste Dum Victo Triumphans"
  tagline = ##f
}

global= {
  \key a \minor
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

printItalic = \with {
  \override LyricText.font-shape = #'italic
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseSoprano = \relative c'' {
  %{	01	%} a4 gis a b |
  %{	02	%} c c b e, |
  %{	03	%} a g f e |
  %{	04	%} d d c2 |
  %{	05	%} a'4 gis a b |
  %{	06	%} c c b e, |
  %{	07	%} a g f e |
  %{	08	%} d d c2 |
  %{	09	%} c'4 c b b |
  %{	10	%} a a gis2 |
  %{	11	%} e4 fis gis a |
  %{	12	%} a gis a2 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Won -- drous gift! The Word who fash -- ioned
  All things by his might di -- vine,
  Bread in -- to his bo -- dy chang -- es,
  In -- to his own blood the wine;
  What though sense no change per -- ceives,
  Faith ad -- mires, a -- dores, be -- lieves.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  He who once to die a vic -- time
  On the cross did not re -- fuse,
  Day by day up -- on our al -- tars,
  That same sac -- ri -- fice re -- news;
  Through his ho -- ly priest -- hood's hands,
  Faith -- ful to his last com -- mands.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  While the peo -- ple all u -- nit -- ing,
  In the sac -- ri -- fice sub -- lime
  Of -- fer Christ to his high Fath -- er,
  Of -- fer up them -- selves with him;
  Then to -- ge -- ther with the priest
  On the liv -- ing Vic -- tim feast.
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
      \new Lyrics \printItalic \lyricsto sopranos \verseTwo
      \new Lyrics \lyricsto sopranos \verseThree
    >>
}
