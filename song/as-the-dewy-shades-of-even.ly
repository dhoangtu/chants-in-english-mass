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
  title = "As The Dewy Shades Of Even"
  composer = "German Melody"
  tagline = ##f
}

global= {
  \key g \major
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
  %{	01	%} d4 d g g |
  %{	02	%} a a b g |
  %{	03	%} d' d e c |
  %{	04	%} g d' b2 |
  %{	05	%} b4 b a b |
  %{	06	%} g a g fis |
  %{	07	%} g e d g |
  %{	08	%} g fis g2 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  As the dew -- y shades of e -- ven gath -- er o'er the balm -- y air,
  lis -- ten, gen -- tle Queen of hea -- ven, lis -- ten to my ves -- per pray'r
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Ho -- ly Mo -- ther, near me ho -- ver, free my thoughts from aught de -- filed,
  with thy wings of mer -- cy co -- ver, keep from sin thy help -- less child
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Thine own sin -- less heart was bro -- ken, Sor -- row's sword had pierced its core;
  Ho -- ly Mo -- ther, by that to -- ken, now thy pi -- ty I im -- plore.
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
