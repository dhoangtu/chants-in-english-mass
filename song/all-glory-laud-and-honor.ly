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
  title = "All Glory, Laud and Honor"
  composer = "Theodulph of Orleans, Melchior Teschner"
  tagline = ##f
}

global= {
  \key bes \major
  \time 4/4
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
musicVerseSoprano = \relative c' {
                   \partial 4 bes4 |
  %{ 01 %} f' f g a |
  %{ 02 %} bes2 bes4 d |
  %{ 03 %} c bes bes a |
  %{ 04 %} bes2. bes,4 |
  %{ 05 %} f' f g a |
  %{ 06 %} bes2 bes4 d |
  %{ 07 %} c bes bes a |
  %{ 08 %} bes2. bes4 |
  %{ 09 %} d d c bes |
  %{ 10 %} a (g) f a |
  %{ 11 %} bes a g g |
  %{ 12 %} f2. f4 |
  %{ 13 %} d f g f |
  %{ 14 %} f (ees) d f |
  %{ 15 %} ees d c c |
                    bes2. \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  All glo -- ry, laud, and hon -- or
  To thee, Re -- deem -- er, King
  To whom the lips of chil -- dren
  Made sweet ho -- san -- nas ring
  Thou art the King of Is -- rael
  Thou Da -- vid's roy -- al Son
  Who in the Lord's name com -- est
  The King and Bless -- ed One.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  The com -- pa -- ny of an -- gels
  Are prai -- sing thee on high
  And mor -- tal men and all things
  Cre -- at -- ed make re -- ply
  The peo -- ple of the He -- brews
  With palms be -- fore thee went;
  Our praise and love and an -- thems
  Be -- fore thee we pre -- sent.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  To thee, be -- fore thy pas -- sion
  They sang their hymns of praise;
  To thee, now high ex -- alt -- ed
  Our me -- lo -- dy we raise
  Thou didst ac -- cept their prais -- es;
  Ac -- cept the love we bring
  Who in all good de -- light -- est
  Thou good and gra -- cious King.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
    \new ChoirStaff <<
      \new Staff <<
        \clef "treble"
        \new Voice = "sopranos" { \voiceOne \global   \musicVerseSoprano }
      >>
      \new Lyrics \lyricsto sopranos \verseOne
      \new Lyrics \with \printItalic \lyricsto sopranos \verseTwo
      \new Lyrics \lyricsto sopranos \verseThree
    >>
}

