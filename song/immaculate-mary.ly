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
  title = "Immaculate Mary"
  composer = "Lourdes Pilgrim's Tune"
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

printBold = {
  \override Lyrics.LyricText.font-series = #'bold
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseSoprano = \relative c' {
  \partial 4 d4 |
  %{	01	%} g g b |
  %{	02	%} g g b |
  %{	03	%} a a b8 (a) |
  %{	04	%} g2 d4 |
  %{	05	%} g g b |
  %{	06	%} g g b |
  %{	07	%} a a b8 (a) |
  %{	08	%} g2. \bar "" \break
  
  %{	09	%} c2 c4 |
  %{	10	%} b2 b4 |
  %{	11	%} a a a |
  %{	12	%} d2 g,4 |
  %{	13	%} c2 c4 |
  %{	14	%} b b b |
  %{	15	%} a2 (b8 a) |
  %{	16	%} g2. \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Im -- ma -- cu -- late Ma -- ru! Our hearts are on fire;
  That ti -- tle so won -- drous
  Fills all our de -- sire!
  
  \printBold
  
  A -- ve, A -- ve, A -- ve, Ma -- ri -- a!
  A -- ve, A -- ve, Ma -- ri -- a!
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  We pray for God's glo -- ry,
  May his king -- dom come;
  We pray for his vi -- car, our fa -- ther in Rome.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  We pray for our moth -- er, the Church up -- on earth,
  And bless, sweet -- est La -- dy, the ladn of our birth.
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
    \layout {
      \override LyricHyphen.minimum-distance = #2
    }
}
