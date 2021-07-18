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
  title = "Song Of The Angelicals"
  composer = "Arthur Somerwell, Cardinal Newman"
  tagline = ##f
}

global= {
  \key ees \major
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
  %{	01	%} ees4 f g |
  %{	02	%} aes2 g4 |
  %{	03	%} c2 bes4 |
  %{	04	%} ees2 (d4) |
  %{	05	%} c d ees |
  %{	06	%} bes (aes8 g) aes4 |
  %{	07	%} g2. ( |
  %{	08	%} f2) bes4 |
  %{	09	%} c2 d4 |
  %{	10	%} bes2 ees,4 |
  %{	11	%} aes (g8 f) g4 |
  %{	12	%} f2 f4 |
  %{	13	%} bes (ees,) f |
  %{	14	%} g (aes8 g) f4 |
  %{	15	%} ees2. \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Praise to the Ho -- liest in the height...
  And in the depth be praise:
  In all his words most won -- der -- ful;
  Most sure in all his ways.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  O lov -- ing wis -- dom of our God!
  When all was sin and shame,
  A sec -- ond A -- dam to the fight
  And to the res -- cue came.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  O wis -- est love! That flesh and blood
  Which did in A -- dam fail,
  Should strive a -- fresh a -- gaints their foe,
  Should strive and should pre -- vail.
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
