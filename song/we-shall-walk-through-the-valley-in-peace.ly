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
  title = "We Shall Walk Through The Valley In Peace"
  composer = "Peaceful Valley Arr. Noel Jones, A.L. Hatter"
  tagline = ##f
  copyright = \markup { \abs-fontsize #8 { \char ##x00A9 "Creative Commons Attribution 3.0 Liecense by Noel Jones, for non-commercial use" } }
}

globalSettings = {
  \set Score.barNumberVisibility = #all-bar-numbers-visible
  \key aes \major
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
                    \partial 4. ees4 g8 |
  %{	01	%} aes4. aes4 aes8 |
  %{	02	%} aes4 (ees8) g4 aes8 |
  %{	03	%} bes2. ( |
  %{	04	%} bes4.) r8 ees des |
  %{	05	%} c4. c4 c8 |
  %{	06	%} c4 (bes8) aes4 c8 |
  %{	07	%} bes2. ( |
  %{	08	%} bes4.) r8 \bar "" \break
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Chorus music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicChorusSoprano = \relative c'' {
  \set Score.currentBarNumber = #9
                    \partial 4 ees8 (des) |
  %{	09	%} c4. c4 c8 |
  %{	10	%} c4 bes8 aes4 c8 |
  %{	11	%} bes8 (aes bes c bes c) |
  %{	12	%} des4. r8 \bar "" \break
                    c bes |
  %{	13	%} aes4. aes4 aes8 |
  %{	14	%} g4 aes8 bes4. |
  %{	15	%} aes2. \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  We shall walk through the va -- ley in peace;
  We shall walk through the val -- ley in peace;
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  There will be no _ sor -- row _ there,
  There will be no _ sor -- row _ there.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  There will be no _ dy -- ing _ there,
  There will be no _ dy -- ing _ there.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Chorus lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricChorus = \lyricmode {
  \set stanza = #"Refrain."
  If Je -- sus him -- self shall be our lead -- er,
  We shall walk through the val -- ley in peace.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "soprano" {
          \globalSettings   \musicVerseSoprano
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
