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
  title = "If Ye Love Me"
  subtitle = "(unison arr.)"
  composer = "Thomas Tallis"
  tagline = ##f
}

global= {
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
  %{	01	%} f2. f4 |
  %{	02	%} g2 a ( |
  %{	03	%} a4) a g f |
  %{	04	%} bes2 a ( |
  %{	05	%} a4) a a a |
  %{	06	%} c2 bes4 a ( |
  %{	07	%} a8) bes g4 a2 ( |
  %{	08	%}
  %{	09	%} a4) g f f |
  %{	10	%} bes2. a4 ( |
  %{	11	%} a) f a g ( |
  %{	12	%} g) f2 e4 |
  %{	13	%} f2
  
  \repeat volta 1 {
    %{	14	%}
    %{	15	%}
    %{	16	%} f4 c'4 ( |
    %{	17	%} c4) bes a g |
    %{	18	%} f a g2 |
    %{	19	%} g
    %{	20	%}
    %{	21	%} c4 f,4 |
    %{	22	%} c'4 bes a2 |
  }
  %{	23	%} g4 f e d |
  %{	24	%} c f2 c4 |
  %{	25	%} d bes (c2) |
  c1 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  If ye love me, keep my com -- mand -- ments,
  and I will pray the Fa _ _ ther,
  and He shall give you a -- no -- ther com -- fort -- er,
  that He may bide with you for -- ev -- er, ev'n the spirit of truth,
  
  ev'n the spirit of truth, ev'n the spirit of truth.
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
    %{
    \midi {
    \tempo 4 = 100
    }
    %}
}
