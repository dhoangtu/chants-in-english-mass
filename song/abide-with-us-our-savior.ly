\version "2.22.1"

\header {
  title = "Abide With Us, Our Savior"
  composer = "Christus der is mein leben"
  tagline = ##f
}

global= {
  \key d \major
  \time 4/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override Lyrics.LyricSpace.minimum-distance = #3.0
}

\paper {
  #(set-paper-size "a5")
  top-margin = 10\mm
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
                    \partial 4 d4 |
  %{	01	%} fis e fis g |
  %{	02	%} a2 fis4 b |
  %{	03	%} a g fis e |
  %{	04	%} fis2. a4 |
  %{	05	%} b cis d cis |
  %{	06	%} b2 a4 fis |
  %{	07	%} g fis e e |
                    d2. \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  A -- bide with us, our Sav -- ior, let not your merc -- y cease;
  from Sat -- an's might de -- fend us, and give our hearts your peace.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  A -- bide with us, our Help -- er, sus -- tain us by your Word;
  let us and all your peo -- ple to liv -- ing faith be stirred.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  A -- bide with us, Re -- deem -- er, O Light, e -- ter -- nal Light;
  your truth di -- rect and guide us to flee from err -- or's night.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  To Fath -- er, Son, and Spi -- rit all praise and glo -- ry be,
  who were and are for -- ev -- er the_e -- ter -- nal One in Three.
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
