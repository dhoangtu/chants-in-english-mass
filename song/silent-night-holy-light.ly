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
  title = "Silent Night, Holy Night"
  composer = "Franz Grubber, Joseph Mohr"
  tagline = ##f
}

global= {
  \key c \major
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
  %{	01	%} g8. (a16) g8 e4. |
  %{	02	%} g8. (a16) g8 e4. |
  %{	03	%} d'4 d8 b4. |
  %{	04	%} c4 c8 g4. |
  \autoBeamOff
  %{	05	%} a4 a8 c8. (b16) a8 |
  \autoBeamOn
  %{	06	%} g8. a16 g8 e4. |
  %{	07	%} a4 a8 c8. b16 a8 |
  %{	08	%} g8. a16 g8 e4. |
  d'4 d8 f8. d16 b8 |
  c4. (e4.) |
  c8 (g) e g8. f16 d8 |
  c2. \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Si -- lent night, ho -- ly night,
  All is calm, all is bright
  Round yon Vir -- gin Moth -- er and Child,
  Ho -- ly In -- fant so ten -- der and mild,
  Sleep in heav -- en -- ly peace,
  Sleep in heav -- en -- ly peace.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Si -- lent night, ho -- ly night, shep -- herds quake at the sight;
  Glo -- ries stream from heav -- en a -- far,
  Heav'n -- ly hosts _ sing al -- le -- lu -- ia;
  Christ, the Sav -- iour, is born!
  Christ, the Sav -- iour, is born!
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Si -- lent night, ho -- ly night, Son of God, love's pure light
  Ra -- diant means from thy ho -- ly face,
  With the dawn of re -- deem - ing grace,
  Je -- sus, Lord, at thy birth,
  Je sus, Lord, at thy birth.
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
