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
  title = "O Trinity Of Blessed Light"
  composer = "Jeremiah Clarke, Ambrose of Milan, John Neale"
  tagline = ##f
}

global= {
  \key f \major
  \time 3/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override Lyrics.LyricSpace.minimum-distance = #3.0
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = #'(1 1 1)
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
                    \partial 4 f4 |
  %{	01	%} a2 bes8 (a) |
  %{	02	%} f4 (a) c |
  %{	03	%} c4. (d8) c (bes) |
  %{	04	%} bes4 (a) f |
  %{	05	%} bes2 a4 |
  %{	06	%} d2 c4 |
  %{	07	%} c (bes) a |
  %{	08	%} g2 g4 |
  %{	09	%} aes2 aes4 |
  %{	10	%} des2 c4 |
  %{	11	%} b!2 b4 |
  %{	12	%} c2 d4 |
  %{	13	%} g,2 c4 |
  %{	14	%} f, (bes) a |
  %{	15	%} a8 (g f4) e4 |
                    f2 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  O Tri -- ni -- ty of bles -- sed light,
  O U -- ni -- ty of price -- ly might,
  the fie -- ry sun now goes his way;
  shed thou with -- in our hearts thy ray.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  To Thee our morn -- ing song of praise,
  to Thee our even -- ing prayer we raise;
  O grant us with thy saints on high
  to praise Thee through e -- ter -- ni -- ty.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  All laud to God the Fa -- ther be;
  All praise, e -- ter -- nal Son, to Thee;
  All glo -- ry, as is ev -- er meet,
  to God the Ho -- ly Ad -- vo -- cate.
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
