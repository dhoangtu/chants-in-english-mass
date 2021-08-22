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
  title = "O Christ The King, The Banners Rise"
  composer = "Noel Jones, Vincent Uher"
  tagline = ##f
  copyright = \markup { \abs-fontsize #8 { \char ##x00A9 "Creative Commons 3.0 License, for non-commercial use" } }
}

globalSettings = {
  \set Score.barNumberVisibility = #all-bar-numbers-visible
  \key d \major
  \time 4/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override Lyrics.LyricSpace.minimum-distance = #3.0
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
musicVerseSoprano = \relative c' {
  %{	01	%} fis2 e4. d8 |
  %{	02	%} cis2. cis4 |
  %{	03	%} d g fis e |
  %{	04	%} a2. a4 |
  %{	05	%} b2. a4 |
  %{	06	%} g2 fis4. fis8 |
  %{	07	%} gis2 ais4 b |
  %{	08	%} cis2. cis4 |
  %{	09	%} d2 cis |
  %{	10	%} b (a4) a |
  %{	11	%} g4. fis8 e4 d |
  %{	12	%} a'1 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Chorus music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicChorusSoprano = \relative c'' {
  \set Score.currentBarNumber = #13
  %{	13	%} b4 (a8 g a4) d, |
  %{	14	%} g2 fis4 fis |
  %{	15	%} g4. fis8 e2 |
  %{	16	%} d1 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  O Christ the King, the roy -- al ban -- ners rise.
  Thy cross, thy stan -- dard we raise to the skies,
  And hail Thee, ''Lord!'' and bow be -- fore thine eyes.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  Trans -- fig -- ured thou u -- pon the moun -- tain's height
  Re -- vealed the glo -- ry of the bride -- groom's face
  And showed to them thy pur -- pose and thy light.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  The cross, thy throne where thou wast lift -- ed high
  Em -- brac -- ing, bro -- ken and dark, the world's heart
  Till blood and wa -- ter gushed when pierced was thine.
}

lyricVerseFour = \lyricmode {
  \set stanza = #"4."
  Beath could not hold thee, nor a tomb con -- tain,
  O love and life, who from heav'n now dost reign,
  The King of kings, the Lord who heal -- pain.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Chorus lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricChorus = \lyricmode {
  Praise to Je -- sus! All praise and glo -- ry!
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
      \new Lyrics \with \printItalic \lyricsto soprano \lyricVerseFour
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
