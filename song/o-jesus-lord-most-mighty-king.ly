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
  title = "O Jesus, Lord, Most Mighty King"
  composer = "St. Bernard, S. Webbe, JR. Tr. J.D. Aylward, O.P."
  tagline = ##f
}

global= {
  \key g \major
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
                    \partial 4 d4 |
  %{	01	%} b'2 a4 |
  %{	02	%} g2 fis4 |
  %{	03	%} fis (e) g |
  %{	04	%} d2 d'4 |
  %{	05	%} d (c) b |
  %{	06	%} b (a) g |
  %{	07	%} g2. ( |
  %{	08	%} fis2) d4 |
  %{	09	%} b'2 a4 |
  %{	10	%} g2 fis4 |
  %{	11	%} fis (e) g |
  %{	12	%} d2 d'4 |
  %{	13	%} d (c) a |
  %{	14	%} g (b) a |
  %{	15	%} g2. \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  O Je -- sus, Lord, most might -- y king,
  And Con -- que -- ror di -- vine,
  O sweet -- ness in -- fi -- nite, for whom
  Our souls un -- ceas -- ing pine.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  O Je -- sus, sweet -- ness of the heart,
  Thou liv -- ing spring of light,
  So far ex -- ceed -- ing all de -- sire,
  All joys of sense or sight.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  O Je -- sus, bright -- er than the sun,
  O balm with heal -- ing blest,
  Of all things sweet, of all things fair,
  Thou sweet -- est, fair -- est, best.
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
