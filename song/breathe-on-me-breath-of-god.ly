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
  title = "Breathe On Me, Breath Of God"
  composer = "John Chetham, Edwin Hatch"
  tagline = ##f
}

global= {
  \key g \major
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
  %{	01	%} e2 b'4 a |
  %{	02	%} g2 fis |
  %{	03	%} e1 |
  %{	04	%} b'2 d4 c |
  %{	05	%} b2 a |
  %{	06	%} b1 |
  %{	07	%} e,2 fis4 e |
  %{	08	%} b'2 g |
  %{	09	%} a4 g fis2 |
  %{	10	%} fis2 b4 a |
  %{	11	%} g2 fis |
  %{	12	%} e1 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Breathe on me, breath of God, fill me with life a -- new,
  that I may love what Thou dost love, and do what Thou wouldst do.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Breathe on me, breath of God, un -- til my heart is pure,
  un -- til with Thee I wil one will, to do and to en -- dure.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Breathe on me, breath of God, till I am whol -- y thine,
  till all this earth -- ly part of me glows with thy fire di -- vine.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Breathe on me, breath of God, so shall I nev -- er die,
  but live with Thee the per -- fect life of tine e -- ter -- ni -- ty.
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
