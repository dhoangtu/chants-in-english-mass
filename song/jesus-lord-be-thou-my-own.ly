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
  title = "Jesus, Lord, Be Thou My Own"
  composer = "Chardwich 77.77"
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
  system-system-spacing = #'((basic-distance . 3) (padding . 5))
}

printItalic = {
  \override LyricText.font-shape = #'italic
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseSoprano = \relative c' {
  %{	01	%} d4 e f a |
  %{	02	%} c bes a2 |
  %{	03	%} a4 a c f |
  %{	04	%} bes, a g2 |
  %{	05	%} e4 f g bes |
  %{	06	%} a g f2 |
  %{	07	%} d4 e f g |
  %{	08	%} e e d2 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Je -- sus, Lord, be Thou my own;
  Thee I long for, Thee a -- lone;
  All my -- self I give to Thee;
  Do what -- e'er Thou wilt with me.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Je -- sus, Thou my heart in -- flame,
  Give that love which Thou dost claim;
  Rec -- om -- pense I'll ask for none;
  Love is all when love is won.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  God of mer -- cy, Lord of light,
  Thy good will is my de -- light;
  Now hence -- forth thy will di -- vine
  Ev -- er shall in all be mine.
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
