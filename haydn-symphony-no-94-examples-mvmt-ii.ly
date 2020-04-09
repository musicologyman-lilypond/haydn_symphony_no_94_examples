\version "2.20.0"

\include "./../lilypond-page-sizes/paper-sizes.ily"

\header {
  tagline = ##f
}

\layout {
  \context {
    \Score
    \remove Bar_number_engraver
  }
  \context {
     \Staff
     \remove Time_signature_engraver
  }
}
 

global = {
  \key c \major
  \time 2/4
}

tenuto = \markup \italic "ten."

theme = \relative c' {
  \global
  c8-.^\markup \italic semplice \p c-. e-. e-. g-. g-. e4^\tenuto |
  f8-. f-. d-. d-. b-. b-. g4^\tenuto
  c8-. c-. e-. e-. g-. g-. e4^\tenuto
  c'8-. c-. fis,-. fis-. g4 (g,8) r |
  c8-. \pp c-. e-. e-. g-. g-. e4^\tenuto |
  f8-. f-. d-. d-. b-. b-. g4^\tenuto
  c8-. c-. e-. e-. g-. g-. e4^\tenuto
  c'8-. c-. fis,-. fis-. g4 (g,8) r |
  g8 r g''4 \ff  \break |
  f,!8 \p (g,16) r e'8 (g,16) r |
  d'8-. d-. d16 (e f g) |
  a (g,) g' (g,) f' (g,) e' (g,) |
  d'8-. d d8. (dis16) |
  e8-. e-. g-. g-. c-. c-. e4^\tenuto 
  d8-. d c16 (b a b) |
  c8-. c-. c-. r |
  f,8 (g,16) r e'8 (g,16) r |
  d'8-. d-. d16 (e f g) |
  a (g,) g' (g,) f' (g,) e' (g,) |
  d'8-. d d8. (dis16) |
  e8-. e-. g-. g-. c-. c-. e4^\tenuto 
  d8-. d c16 (b a b) |
  c8-. c-. c-. r |
}

\book {
  \paper {
    #(set-paper-size "size 8-1.25")
    print-page-number = ##f
    indent = 0 \in
  }
  \score {
    \new Staff \with { \consists Time_signature_engraver } \theme
    \layout {}
    \midi {}
  }
}

varITop = \relative c' { 
  \global
  <c c'>4 ^\markup \italic "full orchestra" r |
  r r16 g''-. \p c-.^\markup \italic "first violins" b-. |
  b \fz (a) a-. g-. g \fz (f) f-. e-. |
  e \fz (d) d-. c-. c-. a' (g f) \break |
  e8 r r4 |
  r4 r16 g-. \p ^\markup \italic "flute (and violins one octave below)" c-. d-. |
  e (d) d-. c-. c (b) b-. a-. |
  c (b) d-. b-. g8-. r
}

varIBottom = \relative c' {
  c8-.\f ^\markup \italic "second violins" c-.\p e-. e-. g-. g-. e4^\tenuto |
  f8-. f-. d-. d-. b-. b-. g4^\tenuto
  c8-. c-. e-. e-. g-. g-. e4^\tenuto
  c'8-. c-. fis,-. fis-. g4 (g,8) r |
}

\book {
  \paper {
    #(set-paper-size "size 7-2")
    indent = 0 \in
    print-page-number = ##f
  }
  \score {
    <<
    \new Staff \varITop
    \new Staff \varIBottom
    >>
    \layout {}
    \midi {}
  }
}