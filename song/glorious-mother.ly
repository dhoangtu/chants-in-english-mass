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
  title = "Glorious Mother"
  composer = "Queen of heaven, Le jeune"
  tagline = ##f
}

globalSettings = {
  \key f \major
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
musicVerseSoprano = \relative c' {
  %{	01	%} f4 g a a |
  %{	02	%} bes a a g |
  %{	03	%} g a c bes |
  %{	04	%} g a f2 |
  %{	05	%} f4 g a a |
  %{	06	%} bes a a g |
  %{	07	%} g a c b! |
  %{	08	%} a b! c2 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Chorus music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicChorusSoprano = \relative c'' {
  \set Score.currentBarNumber = #9
  %{	09	%} c4 c d d |
  %{	10	%} e d d c |
  %{	11	%} c d bes a |
  %{	12	%} bes c a2 |
  %{	13	%} f4 g a a |
  %{	14	%} bes a a g |
  %{	15	%} g a c bes |
  %{	16	%} g a f2 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Glo -- rious Moth -- er! From high hea -- ven
  Down up -- on thy chil -- dren gaze,
  Gath -- ered in thy own loved sea -- son
  Thee to bless and thee to praise.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  Raise thy voice for us to Je -- sus,
  In this bless -- ed month of thine;
  Raise thy pure hands up to bless us,
  As we lin -- ger 'round thy shrine.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Chorus lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricChorus = \lyricmode {
  See, sweet Ma -- ry, on thine al -- tars
  Bloom the fair -- est buds of May;
  O may we, earth's sons and daugh -- ters,
  Grow, by grace, as pure as they.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "soprano" {
          \voiceOne \globalSettings   \musicVerseSoprano
        }
      >>
      \new Lyrics \lyricsto soprano \lyricVerseOne
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
