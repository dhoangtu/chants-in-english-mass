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
  title = "Behold! The Mountain Of The Lord"
  composer = "GLASGOW, Sottish Translations and Paraphrases"
  tagline = ##f
}

global= {
  \key f \major
  \time 3/4
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
                    \partial 4 c4 |
  %{	01	%} f2 g4 |
  %{	02	%} a8. (g16 f4) a |
  %{	03	%} c8. (d16 c4) bes |
  %{	04	%} a2 a4 |
  %{	05	%} g2 bes4 |
  %{	06	%} a8. (g16 f4) e |
  %{	07	%} f2 c'4 |
  %{	08	%} c2 a4 |
  %{	09	%} bes2 d4 |
  %{	10	%} c4 (bes) a |
  %{	11	%} g2 c4 |
  %{	12	%} f, (g) a |
  %{	13	%} bes a g |
                    f2 \bar "|."
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Verse lyrics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verseOne = \lyricmode {
  \set stanza = #"1."
  Be -- hold! The moun -- tain of the Lord
  in latt -- er days shall rise
  on moun -- tain tops a -- bove the hills, 
  and draw the _ won -- d'ring eyes.
}

verseTwo = \lyricmode {
  \set stanza = #"2."
  To this the joy -- ful na -- tions round,
  all tribes and tongues shall flow;
  Up to the hill of God, they'll say,
  and to his house _ we'll go.
}

verseThree = \lyricmode {
  \set stanza = #"3."
  The beam that sines from Si -- on hill
  shall light -- en ev' -- ry land;
  The King who reigns in Sa -- lem's tow'rs
  shall all the world _ com -- mand.
}

verseFour = \lyricmode {
  \set stanza = #"4."
  A -- mong the na -- tions he shall judge;
  his judgh -- ments truth shall guide;
  His scep -- tre shall pro -- tect the just,
  and quell the _ sin -- ners's pride.
}

verseFive = \lyricmode {
  \set stanza = #"5."
  No strife shall rage, nor hos -- tile feuds
  dis -- turb those peace -- ful years;
  To plough -- shares men shall beat their swords,
  to prun -- ing -- hooks _ their spears.
}

verseSix = \lyricmode {
  \set stanza = #"6."
  No long -- er hosts en -- coun -- t'ring hosts
  shall crowds of slain de -- plore:
  they hang the trum -- pet in the hall,
  and stud -- y war _ no more.
}

verseSeven = \lyricmode {
  \set stanza = #"7."
  Come then, O house of Ja -- cob! come
  to wor -- ship at his shrine;
  And, walk -- ing in the light of God,
  with ho -- ly beau - ties shine.
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
      \new Lyrics \lyricsto sopranos \verseFour
      \new Lyrics \with \printItalic \lyricsto sopranos \verseFive
      \new Lyrics \lyricsto sopranos \verseSix
      \new Lyrics \with \printItalic \lyricsto sopranos \verseSeven
    >>
}
