%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONTENTS OF THIS DOCUMENT
% 1. Common settings
% 2. Verse music
% 3. Chorus music
% 4. Verse lyrics
% 5. Chorus lyrics
% 6. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Common settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\version "2.22.1"

\header {
  title = "Bring Flowers Of The Rarest"
  composer = "Mary E. Walsh"
  tagline = ##f
}

globalSettings = {
  \set Score.barNumberVisibility = #all-bar-numbers-visible
  \key bes \major
  \time 3/4
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = #'(1 1 1)
}

verseSettings = {
  \phrasingSlurDashed
}

\paper {
  #(set-paper-size "a5")
  top-margin = 1.1\mm
  bottom-marign = 10\mm
  left-margin = 10\mm
  right-margin = 10\mm
  indent = #0
  #(define fonts
	 (make-pango-font-tree "Liberation Serif"
	 		       "Liberation Serif"
			       "Liberation Serif"
			       (/ 20 20)))

  page-count = #1
}

printItalic = {
  \override LyricText.font-shape = #'italic
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Verse music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicVerseSoprano = \relative c' {
                    \partial 8 f8 |
  %{	01	%} bes a bes d bes d, |
  %{	02	%} c ees f a g g |
  %{	03	%} g f c g' f c |
  %{	04	%} g' f ees d4 f8 |
  %{	05	%} bes a bes d bes d, |
  %{	06	%} c ees f a g8. g16 |
  %{	07	%} f8 e! f g fis g |
  %{	08	%} a d8. c16 bes4 \bar "||"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Chorus music
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
musicChorusSoprano = \relative c' {
  \set Score.currentBarNumber = #9
                    \partial 8 f8 |
  %{	09	%} f e! f g f f |
  %{	10	%} f bes8. c16 d4. |
  %{	11	%} d8 c a ees4 c'8 |
  %{	12	%} c bes d, f4 f8 |
  %{	13	%} f g a bes c d |
  %{	14	%} ees d8. cis16 d4. |
  %{	15	%} bes4 bes16 bes16 d8 bes4 |
  %{	16	%} f4 d'8. c16 bes4 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricVerseOne = \lyricmode {
  \set stanza = #"1."
  Bring flowers of the ra -- rest, bring flowers of the fair -- est,
  From gar -- den and wood -- land and hill side and vale;
  Our full harts are swell -- ing, our glad voic -- es tell -- ing
  The praise of the love -- li -- est Rose of the dale.
}

lyricVerseTwo = \lyricmode {
  \set stanza = #"2."
  Our voic -- es as -- cend -- ing, in har -- mo -- ny blend -- ing,
  Oh! thus may our hearts turn, dear Mo -- ther, to thee;
  Oh! thus shall we prove thee how tru -- ly I love thee,
  How dark with -- out Ma -- ry, life's jour -- ney would be.
}

lyricVerseThree = \lyricmode {
  \set stanza = #"3."
  O Vir -- gin mist ten -- der, our hom -- age we ren -- der,
  Thy love and pro -- tec -- tion, sweet Mo -- ther, to win;
  In dan -- ger de -- fend us, in sor -- row be -- friend us,
  As pure as the lil -- ies we lay at your feet.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Chorus lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lyricChorus = \lyricmode {
  O Ma -- ry! We crown thee with blos -- soms to -- day,
  Queen of the an -- gels, Queen of the May,
  O Ma -- ry we crown thee with blos -- soms to -- day,
  Queen of the an -- gels, Queen of the May.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "soprano" {
          \voiceOne \globalSettings \verseSettings   \musicVerseSoprano
        }
      >>
      \new Lyrics \lyricsto soprano \lyricVerseOne
      \new Lyrics \with \printItalic \lyricsto soprano \lyricVerseTwo
      \new Lyrics \lyricsto soprano \lyricVerseThree
    >>
}

\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \override Staff.TimeSignature #'stencil = ##f
        \new Voice = "soprano" {
          \globalSettings \musicChorusSoprano
        }
      >>
      \new Lyrics \lyricsto soprano \lyricChorus
    >>
}
