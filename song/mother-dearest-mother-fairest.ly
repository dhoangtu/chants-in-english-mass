%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONTENTS OF THIS DOCUMENT
% 1. Common settings
% 2. Verse music
% 3. Chorus music
% 4. Verse lyrics
% 5. Chorus lyrics
% 6. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Common settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\version "2.22.1"

\header {
  title = "Mother Dearest, Mother Fairest"
  composer = "Fr. Frederick Faber"
  tagline = ##f
}

globalSettings = {
  \key c \major
  \time 3/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override Lyrics.LyricSpace.minimum-distance = #3.0
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = #'(1 1 1)
}

verseSettings = {
  \phrasingSlurDashed
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
                    \partial 4 g8 e |
  %{	01	%} c'4. c8 b a |
  %{	02	%} a g4 r8 e8 c |
  %{	03	%} g'4. g8 f g |
  %{	04	%} e4. r8 g e |
  %{	05	%} c'4. c8 b a |
  %{	06	%} a g4 r8 e c |
  %{	07	%} g'4. g8 f d |
                    c4 r \bar "|"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Chorus music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicChorusSoprano = \relative c' {
  \set Score.currentBarNumber = #8
                    \partial 4 d8 e |
  %{	08	%} d4. e8 f g |
  %{	09	%} e4 r d8 e |
  %{	10	%} d4. e8 f g |
  %{	11	%} e4 r g8 e |
  %{	12	%} c'4. c8 b a |
  %{	13	%} a g4 r8 e c |
  %{	14	%} g'4. g8 f d |
                    c2 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Moth -- er dear -- est, Moth -- er fair -- est,
  Help of all who call on thee,
  Vir -- gin pur -- est, bright -- est, rar -- est,
  Help us, help, we cry to thee.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  La -- dy, help in pain and sor -- row,
  Soothe those rack'd on beds of pain,
  May the gold -- en light of mor -- row,
  Bring them health and joy a -- gain.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  Help our priests, our vir -- gins ho -- ly,
  Help our Pope, long may be reign;
  Pray that we who sing thy prais -- es,
  May in heav'n all meet a -- gain.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Chorus lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricChorus = \lyricmode {
  Ma -- ry, help us, help we pray,
  Ma -- ry, help us, help we pray,
  Help us in all care and sor -- row;
  Ma -- ry, help us, help we pray.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "soprano" {
          \globalSettings \verseSettings   \musicVerseSoprano
        }
      >>
      \new Lyrics \lyricsto soprano \lyricVerseOne
      \new Lyrics \with \printItalic \lyricsto soprano \lyricVerseTwo
      \new Lyrics \lyricsto soprano \lyricVerseThree
    >>
}

\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \override Staff.TimeSignature #'stencil = ##f
        \new Voice = "soprano" {
          \globalSettings   \musicChorusSoprano
        }
      >>
      \new Lyrics \lyricsto soprano \lyricChorus
    >>
}
