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
  title = "Christ Is Made Sure Our Foundation"
  composer = "Bellville, Urbs Beata Jerusalem"
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
musicVerseSoprano = \relative c'' {
  %{	01	%} b2 d4 |
  %{	02	%} b2 g4 |
  %{	03	%} c2 a4 |
  %{	04	%} fis2 d4 |
  %{	05	%} g2 a4 |
  %{	06	%} b4. (a8) g4 |
  %{	07	%} fis e2 |
  %{	08	%} d2. |
  %{	09	%} fis2 a4 |
  %{	10	%} fis2 d4 |
  %{	11	%} g2 a4 |
  %{	12	%} b2 g4 |
  %{	13	%} c2 b4 |
  %{	14	%} a4. (b8) g4 |
  %{	15	%} g8 (fis) fis2 |
  %{	16	%} e2. |
  %{	17	%} gis2 gis4 |
  %{	18	%} a2 a4 |
  %{	19	%} fis2 fis4 |
  %{	20	%} g2 g4 |
  %{	21	%} e2 e4 |
  %{	22	%} fis2 g4 |
  %{	23	%} g2 fis4 |
  %{	24	%} g2. \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Christ is made our sure foun -- da -- tion,
  Christ is head and cor -- ner -- stones;
  Cho -- sen of the Lord and pre -- cious,
  Bind -- ing all the Church in one,
  Ho -- ly Si -- on's help for -- e -- ver,
  And her con -- fi -- dence a -- lone.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  To this tem -- ple, we im -- plore you,
  Come, great Lord of hosts, to -- day;
  Come with all your lov -- ing kind -- ness,
  Hear your ser -- vants as they pray.
  And your ful -- lest be -- ne -- dic -- tion
  Shed in all its bright -- est ray.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Grant we pray, to all your peo -- ple,
  All the grace they  ask to gain;
  What they gain from You for -- ev -- er
  With the bless -- ed to re -- tain,
  And here -- af -- ter in your glo -- ry
  E -- ver -- more with you to reign.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Praise and ho -- nour to the Fa -- ther,
  Praise and ho -- nour to the Son,
  Praise and ho -- nour to the Spi -- rit,
  Ev -- er Three and ev -- er One;
  Con -- sub -- stan -- tial, con -- e -- ter -- nal,
  While un -- end -- ing ag -- es run.
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
      \new Lyrics \with \printItalic \lyricsto sopranos \verseFour
    >>
}
