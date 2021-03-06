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
  title = "Break Forth, O Beauteous Heavenly Light"
  composer = "Johann Rist"
  tagline = ##f
}

global= {
  \key ees \major
  \time 4/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override Lyrics.LyricSpace.minimum-distance = #2.0
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
                    \partial 4 ees4 |
  %{	01	%} ees f g8 a! bes4 |
  %{	02	%} bes a! bes g |
  %{	03	%} aes g f f |
  %{	04	%} f2 ees4 ees |
  %{	05	%} ees f g8 a! bes4 |
  %{	06	%} bes a! bes g |
  %{	07	%} aes g f g |
  %{	08	%} f2 ees4 f |
  %{	09	%} f4 g aes aes |
  %{	10	%} g8 f g4 f g |
  %{	11	%} g g aes8 bes c4 |
  %{	12	%} c b! c d |
  %{	13	%} ees g, aes g |
  %{	14	%} f2 f4 bes |
  %{	15	%} c bes aes g8 aes |
  %{	16	%} f2 ees \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  Break forth, O beaut - eous beaven -- ly light, and ush -- er in the morn -- ing;
  O she -- pherds, shrink _ not with aff -- right, but hear the an -- gel's warn -- ing.
  This child, now weak in in - fan -- cy, our con -- fi -- dence _ and joy shall be,
  the pow'r of Sat -- an break -- ing, our peace e -- ter -- nal _ mak -- ing.
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
    >>
}
