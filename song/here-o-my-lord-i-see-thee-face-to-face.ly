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
  title = "Here, O My Lord, I See Thee Face To Face"
  composer = "PENITENTIA, HORATIUS BONAR"
  tagline = ##f
}

global= {
  \key ees \major
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
  %{	01	%} g2 g4 aes |
  %{	02	%} bes2 ees, |
  %{	03	%} f4. f8 g4 aes |
  %{	04	%} g1 |
  %{	05	%} g2 f4 ees |
  %{	06	%} c'2 bes |
  %{	07	%} bes4. bes8 aes4 g |
  %{	08	%} f1 |
  %{	09	%} g2 g4 aes |
  %{	10	%} bes2 ees, |
  %{	11	%} c'4. c8 c4 g |
  %{	12	%} aes1 |
  %{	13	%} aes2 g4 f |
  %{	14	%} bes ees, ees aes |
  %{	15	%} g2 f |
  %{	16	%} ees1 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Here, O my Lord, I see Thee face to face;
  Here would I touch and han -- dle things un -- seen,
  Here grasp with firm -- er hand e -- ter -- nal grace,
  And all my wea -- ri -- ness up -- on Thee lean.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Here would I feed up -- on the bread of God,
  Here drink with Thee the roy -- al wine of heav'n.
  There would I lay a -- side each earth -- ly load,
  Here taste a -- fresh the calm of sin for -- giv'n.
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
    >>
}
