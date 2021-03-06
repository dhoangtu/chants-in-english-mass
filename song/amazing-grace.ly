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
  title = "Amazing Grace"
  composer = "W.Walker, John Newton"
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
}

printItalic = {
  \override LyricText.font-shape = #'italic
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseSoprano = \relative c' {
                    \partial 4 c4 |
  %{	01	%} f2 a8 (f) |
  %{	02	%} a2 g4 |
  %{	03	%} f2 d4 |
  %{	04	%} c2 c4 |
  %{	05	%} f2 a8 (f) |
  %{	06	%} a2 g8 (a) |
  %{	07	%} c2. ( |
  %{	08	%} c2) a4 |
  %{	09	%} c4. (a8) c8 (a) |
  %{	10	%} f2 c4 |
  %{	11	%} d4. (f8) f (d) |
  %{	12	%} c2 c4 |
  %{	13	%} f2 a8 (f) |
  %{	14	%} a2 g4 |
  %{	15	%} f2. ( |
                    f2) \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  A -- maz -- ing grace! How sweet the sound that saved a wretch like me!
  I once was lost, but now am found;
  Was blind, but now I see.
  
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  ''T'was grace that taught my heart to fear, and grace my fears re -- lieved;
  How prec -- ious did that grace ap -- pear the hour I first be -- lieved.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Through man -- y dan -- gers, toils and snares I have al -- read -- y come;
  ''T'is grace hath brought me safe thus far, and grace will lead me home.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Yea, when this flesh and heart shall fail, and mor -- tal life shall cease, I shall pos -- sess, with -- in the veil,
  a life of joy and peace.
}

verseFive = \lyricmode {
  \set stanza = #"5."
  The earth shall soon dis -- solve like snow, the sun for -- bear to shine;
  But God, who called me here be -- low, shall be for -- ev -- er mine.
}

verseSix = \lyricmode {
  \set stanza = #"6."
  When we've been there ten thou -- sand years, bright shi -- ning as the sun,
  we've no less days to sing God's praise than when we'd first be -- gun.
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
      \new Lyrics \lyricsto sopranos \verseFive
      \new Lyrics \with \printItalic \lyricsto sopranos \verseSix
    >>
}
