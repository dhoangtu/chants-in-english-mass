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
  title = "Sweet Sacrament Divine"
  composer = "Fr. E. Stanfield"
  tagline = ##f
}

global= {
  \key ees \major
  \time 6/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
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
  \partial 2 g2 |
  %{	01	%} bes2. aes4 f g |
  %{	02	%} ees1 g2 |
  %{	03	%} c,2. d4 ees f |
  %{	04	%} g2 (f) g |
  %{	05	%} bes2. aes4 f g |
  %{	06	%} ees1 g2 |
  %{	07	%} aes2. aes4 g f |
  %{	08	%} ees1 ees2 |
  %{	09	%} ees'2. ees4 d c |
  %{	10	%} bes4. aes8 g2. g4 |
  %{	11	%} c2. c4 bes g |
  %{	12	%} f ees f2 g |
  %{	13	%} bes2. aes4 f g |
  %{	14	%} ees1 g2 |
  %{	15	%} aes2. aes4 g f |
  %{	16	%} ees1. \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Sweet sa -- cre -- ment di -- vine!
  Hid in thine earth -- ly home,
  Lo! 'round thy low -- ly shrine,
  With sup -- pliant hearts we come.
  Dear Lord, to Thee our voice we raise,
  in songs of love and heart -- felt praise,
  Sweet sa -- cra -- ment di -- vine!
  Sweet sa -- cra -- ment di -- vine!
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  Sweet sa -- cra -- ment of peace!
  Dear home of ev -- 'ry heart,
  Where rest -- less yearn -- ings cease,
  And sor -- rows all de -- part.
  There in thine ear, all trust -- ful -- ly,
  We tell our tale of mis -- er -- y,
  Sweet sa -- cra -- ment of peace!
  Sweet sa -- cra -- ment of peace!
}

verseThree = \lyricmode {
  \set stanza = #"3."
  Sweet sa -- cra -- ment of rest! Ark from the o -- cean's roar,
  With -- in thy shel -- ter blest,
  Soon may we reach the shore.
  Save us, for still the tem -- pest races;
  Save lest we sink be -- neath the waves.
  Sweet sa -- cra -- ment of rest!
  Sweet sa -- cra -- ment of rest!
}

verseFour = \lyricmode {
  \set stanza = #"4."
  Sweet sa -- cra -- ment di -- vine!
  Earth's light and Ju -- bi -- lee,
  In thy far depths doth shine
  Thy God -- head's ma -- jes -- ty.
  Sweet light, so shine on us, we pray,
  That earth -- ly joys may fade a -- way,
  Sweet sa -- cra -- ment di -- vine!
  Sweet sa -- cra -- ment di -- vine!
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
