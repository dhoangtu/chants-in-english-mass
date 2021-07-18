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
  title = "Faith Of Our Fathers"
  composer = "Henri F. Hemy, Frederick Faber"
  tagline = ##f
}

global= {
  \key g \major
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

printBold = {
  \override Lyrics.LyricText.font-series = #'bold
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseSoprano = \relative c'' {
  %{	01	%} b4 a g |
  %{	02	%} g fis (g) |
  %{	03	%} a (e) fis |
  %{	04	%} g2. |
  %{	05	%} g4 fis e |
  %{	06	%} d2 g4 |
  %{	07	%} g (fis) g |
  %{	08	%} a2. |
  %{	09	%} b4 a g |
  %{	10	%} g (fis) g |
  %{	11	%} a (e) fis |
  %{	12	%} g2. |
  %{	13	%} g4 fis e |
  %{	14	%} d2 b'4 |
  %{	15	%} a (b) a |
  %{	16	%} g2. \bar "||" \break
  %{	17	%} c4 c c |
  %{	18	%} b2 b4 |
  %{	19	%} a2 a4 |
  %{	20	%} b2. |
  %{	21	%} b4 a g |
  %{	22	%} e2 g4 |
  %{	23	%} a2 a4 |
  %{	24	%} g2. \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Faith of our fa -- thers, liv -- ing still,
  In spite of dun -- geon, fire and sword;
  O how our hearts beat high with joy
  When -- ever we hear that glo -- rious word!
  
  \printBold
  
  Faith of our fa -- thers, ho -- ly faith!
  We will be true to thee till death.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Faith of our fa -- thers, we will strive
  To win all na -- tions un -- to thee;
  And through the truth that comes from God,
  We all shall then be tru -- ly free.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Faith of our fa -- thers, we will love
  Both friend and foe in all our strife;
  And preach thee, too, as love knows how
  By kind -- ly words and vir -- tuous life.
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
