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
  title = "Firmly I believe And Truly"
  composer = "Halton Holgate, Cardinal J.H. Newman"
  tagline = ##f
}

global= {
  \key d \major
  \time 4/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \override Lyrics.LyricSpace.minimum-distance = #3.0
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = #'(1 1 1 1)
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
  %{	01	%} fis4 d a' d, |
  %{	02	%} e8 (fis) g4 g fis |
  %{	03	%} b a cis d |
  %{	04	%} g, fis fis (e) |
  %{	05	%} g8 (fis) e (d) a'4 cis |
  %{	06	%} b8 (cis) d4 d cis |
  %{	07	%} d b g fis |
  %{	08	%} g8 (fis) e4 d2 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Firm -- ly I be -- lieve and tru -- ly
  God is Three, and God is One;
  And I next ack -- now -- ledge dul -- y
  Man -- hood tak -- en by the Son.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  And I trust and hope most ful -- ly
  In that Man -- hood cru -- ci -- fied;
  And each thought and deed un -- ru -- ly
  Do to death, as He has died.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Simp -- ly to his grace and whol -- y
  Light and life and strength be -- long,
  And I love sup -- rem -- ly sole -- ly,
  Him the ho -- ly, him the strong.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  And I hold in ven -- er -- a -- tion,
  For the love of him a -- lone,
  Ho -- ly Church as his cre -- a -- tion,
  And her teach -- ings are his own.
}

verseFive = \lyricmode {
  \set stanza = #"5."
  And I take with joy what -- ev -- er
  Now be -- sets be, pain or fear,
  And with a strong will I sev -- er
  All the ties which bind me here.
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
    >>
}
