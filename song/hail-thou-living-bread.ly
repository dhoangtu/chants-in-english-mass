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
  title = "Hail! Thou Living Bread"
  composer = "Old German Chorale"
  tagline = ##f
}

global= {
  \key g \major
  \time 2/4
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
  %{	01	%} d4 d |
  %{	02	%} g g |
  %{	03	%} a a |
  %{	04	%} b b |
  %{	05	%} g4. g8 |
  %{	06	%} c4 b8 (a) |
  %{	07	%} g4 b |
  %{	08	%} a2 |
  %{	09	%} d4. d8 |
  %{	10	%} b4 b |
  %{	11	%} c4. c8 |
  %{	12	%} a4 a |
  %{	13	%} b b8 (c) |
  %{	14	%} d4. c8 |
  %{	15	%} b4 a |
  %{	16	%} g2 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Hail! Thou liv -- ing bread from heav -- en
  Sa -- cra -- ment of awe -- some might!
  I a -- dore Thee, I a -- dore Thee;
  Ev -- 'ry mo -- ment day and night.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Ho -- liest Je -- su! Heart of Je -- su!
  O'er me shed your gift di -- vine,
  Ho -- liest Je -- su! My Re -- deem -- er!
  All my heart and soul are thine.
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
