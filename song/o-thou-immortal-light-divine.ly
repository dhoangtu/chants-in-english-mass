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
  title = "O Thou Immortal Light Divine"
  composer = " "
  tagline = ##f
}

global= {
  \key c \major
  \time 3/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override Lyrics.LyricSpace.minimum-distance = #4.0
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
                    \partial 4 g4 |
  %{	01	%} f (e) f |
  %{	02	%} d (e) f |
  %{	03	%} g (a4.) a8 |
  %{	04	%} g2 g4 |
  %{	05	%} f (e) f |
  %{	06	%} d (e) f |
  %{	07	%} g (a4.) a8 |
  %{	08	%} g2 a4 |
  %{	09	%} c (b) c |
  %{	10	%} a (g) f |
  %{	11	%} g (f4.) e8 |
  %{	12	%} d2 g4 |
  %{	13	%} f (e) f |
  %{	14	%} d (e) f |
  %{	15	%} g (a4.) a8 |
                    g2 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  O Thou im -- mor -- tal light di -- vine!
  Dread Tri -- ni -- ty in U -- ni try!
  Al -- might -- y One! Al -- might -- y Trine!
  Give ear to thy cre -- a -- tion's cry.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Three Per -- sons, one im -- men -- si -- ty
  En cir -- cling ut -- most space and time
  One great -- ness, glo -- ry, sanc -- ti -- ty,
  One ev -- er -- last -- ing truth sub -- lime.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  To Fa -- ther, Son, and Ho -- ly Ghost,
  Tri -- u -- nal Lord of earth and heav'n:
  From earth and from the heav'n -- ly host
  Be sem -- pi -- ter -- nal glo -- ry given!
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
