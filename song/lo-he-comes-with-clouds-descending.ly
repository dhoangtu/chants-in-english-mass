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
  title = "Lo! He Comes, With Cloud Descending"
  composer = "Charles Wesley"
  tagline = ##f
}

global= {
  \key g \major
  \time 4/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
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
}

printItalic = {
  \override LyricText.font-shape = #'italic
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseSoprano = \relative c'' {
  %{	01	%} g4 b8 (d) g, (fis) e (d) |
  %{	02	%} e8. (fis16 g8) fis16 (e) d8. (c16) b4 |
  %{	03	%} d4. d8 g4 a |
  %{	04	%} b8 (d) c (b) b4 (a) |
  %{	05	%} g b8 (d) g, (fis) e (d) |
  %{	06	%} e8. (fis16 g8) fis16 (e) d8. (c16) b4 |
  %{	07	%} d4. d8 g4 a |
  %{	08	%} b8 (d) c (b) b4 (a) |
  %{	09	%} a8. (b16 a8) b c4 b |
  %{	10	%} g8. (a16 g8) c b (a) g4 |
  %{	11	%} b8. (c16 b8) d c (b) a4 |
  %{	12	%} g a8 (b) d4 c |
  %{	13	%} b a g2 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Lo! He comes with clouds de -- scend -- ing,
  Once for our sal -- va -- tion slain;
  Thou -- sand thou -- sand saints at -- tend -- ing
  Swell the tri -- umph of his train:
  Al -- le -- lu -- ia, al -- le -- lu -- ia,
  al -- le -- lu -- ia! Christ the Lord re -- turns to reign.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Ev' -- ry eye shall now be -- hold him,
  Robed in dread -- ful ma -- jes -- ty;
  Those who set at naught and sold him,
  Pierced and nailed him to the tree,
  Deep -- ly wail -- ing, deep -- ly wail -- ing,
  deep -- ly wail -- ing,
  Shall the true Mes -- si -- ah see.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Those dear to -- kens of his pas -- sion
  Still his dazz -- ling bod -- y bears,
  Cause of end -- less ex -- ul -- ta -- tion
  To his ran -- somed wor -- ship -- pers:
  With what rap -- ture, with what rap -- ture,
  with what rap -- ture
  Gaze we on those glo -- rious scars!
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Yea, A -- men! Let all a -- dore Thee,
  High on thine e -- ter -- nal throne;
  Sav -- iour, take the power and glo -- ry;
  Claim the king -- dom for hine own:
  Al -- le -- lu -- ia, al -- le -- lu -- ia, al -- le -- lu -- ia!
  Thou shalt reign, and Thou a -- lone.
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
