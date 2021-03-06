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
  title = "You Are The Way"
  composer = "Thomas Ravenscroft, Scottish Psalter, George Washington Doane"
  tagline = ##f
}

global= {
  \key ees \major
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
  %{	01	%} ees2 g4 aes |
  %{	02	%} bes ees, f g |
  %{	03	%} aes2 g |
  %{	04	%} f4 ees ees d |
  %{	05	%} ees2 bes' |
  %{	06	%} ees4 d c bes |
  %{	07	%} bes a! bes2 |
  %{	08	%} g f4 ees |
  %{	09	%} ees d ees2 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  You are the way; to you a -- lone
  From sin and death we flee;
  And he who would the Fath -- er seek
  Your fol -- low -- er must be.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  You are the truth, your word a -- lone
  True wis -- dom can im -- part;
  You on -- ly can in -- form the mind
  And pur -- i -- fy the heart.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  You are the life, the rend -- ing tomb
  Pro -- claims your con -- quering arm;
  And those who put their trust in You
  Not death nor hell shall harm.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  You are the way, the truth, the life;
  Grant us that way to know,
  That truth to keep, that life to win,
  Whose joys e -- ter -- nal flow.
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
