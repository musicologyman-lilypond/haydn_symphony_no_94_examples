\version "2.24.0"

\include "../lilypond_paper_sizes/paper_sizes.ily"

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
  c'8-. c-. fis,-. fis-.  g8 r g'4 \ff  \break |
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
  e \fz (d) d-. c-. b-. a' (g f) \break |
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

varIITop = \relative c' {
  \key c \minor
  \time 2/4
  \repeat volta 2 {
    \bar ".|:-|"
    c-. \f ^\markup \italic "full orchestra" c-. es-. es-. g-. g-. es4^\tenuto |
    f8-. f-. d-. d-. b-. b-. g4 ^\tenuto | \break
    <<
      {
        \once \override DynamicText.X-offset = #'-2
        aes'8-. ^\p ^\markup \italic "first violins" aes-.
        c-. c-. es-. es-. aes4^\tenuto
      }
      \\
      {
        \once \override DynamicText.X-offset = #'-2
        c,,16-. \p _\markup \italic "second violins" es-. \repeat unfold  7 { c16-. es-. }
      }
    >>
    d'8-. d-. d16 (es f d) |
    es8-. es-. es-. r8
  } \break
  \set baseMoment = #(ly:make-moment 1/8)
  \set beatStructure = #'(1 1 1 1)
  es16 \f (d32 c bes! aes! g f) es16 es'32 f g16 es |
  bes'16 (a32 g f es d c) bes16 bes32 c des16 bes |
  f'16 (es!32 des c bes aes g) f16 f'32 g aes16 f | \break
  c'16 (bes!32 aes! g f e d)  c16 g'32 aes bes16 g |
  \stopStaff
  \once \override TextScript.Y-offset = #0
  s32 ^\markup \italic "etc."
}

varIIBottom = \relative es {
  \clef bass
  \key c \minor
  \time 2/4
  \repeat volta 2 { s2 * 8 }
  \once \override DynamicText.X-offset = #-2.0
  es8-. \f _\markup \italic "lower strings" es-. <g bes>-. <g bes>-. |
  bes-. bes-. d-. d-.
  f,-. f-. a-. a-. |
  c-. c-. e-. e-. |
  \stopStaff
  \once \override TextScript.Y-offset = #0
  s32 ^\markup \italic "etc."
}


\book {
  \paper {
    #(set-paper-size "size 8-1.75")
    print-page-number = ##f
    indent = 0 \in
    ragged-last = ##t
  }
  \score {
    <<
      \new Staff  \varIITop
      \new Staff \varIIBottom
    >>
    \layout {
      \context {
        \Staff
        \RemoveEmptyStaves
        \override VerticalAxisGroup.remove-first = ##t
      }
    }
    \midi {}
  }
}

varIIITop = \relative c' {
  \time 2/4
  \transpose c c'
  c16-. \p ^\markup \italic {oboe (an octave higher)} c-. c-. c-.  e-. e-. e-. e-.  |
  g-. g-. g-. g-.  e4^\tenuto |
  f16-. f-. f-. f-.  d-. d-. d-. d-.  |
  b-. b-. b-. b-. g4^\tenuto \break |
  c16-. c-. c-. c-.  e-. e-. e-. e-.  |
  g-. g-. g-. g-. e4^\tenuto |
  c'16-. c-. c-. c-.  fis,-. fis-. fis-. fis-. |
  g4 (g,8) r |
}

varIIIBottom = \relative c' {
  \time 2/4
  \override Staff.Clef.color = #grey
  \override Stem.color = #grey
  \override Beam.color = #grey
  \override NoteHead.color = #grey
  \override TextScript.color = #grey
  c8-. c-. e-. e-. g-. g-. e4^\tenuto |
  f8-. f-. d-. d-. b-. b-. g4^\tenuto
  c8-. c-. e-. e-. g-. g-. e4^\tenuto
  c'8-. c-. fis,-. fis-. g4 (g,8) r |
}



\book {
  \paper {
    #(set-paper-size "size 6-1.75")
    print-page-number = ##f
    indent = 0 \in
    ragged-last = ##t
  }
  \score {
    <<
      \new Staff  \varIIITop
      \new Staff \varIIIBottom
    >>
    \layout {
      \context {
        \Staff
        \RemoveEmptyStaves
        \override VerticalAxisGroup.remove-first = ##t
      }
    }
    \midi {}
  }
}

varIVTop = \relative c' {
  \time 2/4
  \tuplet 6/4 4 {
    c16-. \ff e-.  g-.  c (b c) e,-.  g-.  c-.  e (d  e)
    g,-.  c-.  e-.  g ( fis  g) c,-.  e-.  g-.  c (g  e)
    f-.  g-.  a-.  g  (f  e) d-.  e-.  f-.  e (d  c)
    b-.  c-.  d-.  c  (b  a) g-.  a-.  g-.  f (e  d)
    c16-. e-.  g-.  c (b c) e,-.  g-.  c-.  e (d  e)
    g,-.  c-.  e-.  g ( fis  g) c,-.  e-.  g-.  c (g  e)
    e-.  e'-.  e-.  e-.  e-. e-. d-.  c-.  b-.  a-. g-.  fis-.
    g-.  e-.  d-.  c-.  b-.  a-.
  }
    g8 r
}

varIVBottom = \relative c' {
  c8-. \ff c-. e-.  e-. |
  g-.  g-.  e-.  e-. |
  f-.  f-.  d-.  d-. |
  b-.  b-. g-.  g-. |
  c-.  c-.  e-.  e-. |
  g-.  g-.  e-.  e-. |
  \stopStaff
}


\book {
  \paper {
    #(set-paper-size "size 5-2")
    print-page-number = ##f
    indent = 0 \in
    ragged-last = ##t
  }
  \score {
    <<
      \new Staff  \varIVTop
      \new Staff \varIVBottom
    >>
    \layout {
      \context {
        \Staff
        \RemoveEmptyStaves
        \override VerticalAxisGroup.remove-first = ##t
      }
    }
    \midi {}
  }
}

varIVB = \relative c' {
    \time 2/4
    c8. \p ^\markup \italic "pianissimo e dolce" (g16) e'8. (c16) |
    g'8. (e16) c'8. (b16) |
    b16 (a) a (g) g (f) f (e) |
    e (d) d (c) c (b) a (g)
}

varIVBBottom = \relative c' {
  \time 2/4
  \override Staff.Clef.color = #grey
  \override Stem.color = #grey
  \override Beam.color = #grey
  \override NoteHead.color = #grey
  \override TextScript.color = #grey
  c8-. c-. e-. e-. g-. g-. e4^\tenuto |
  f8-. f-. d-. d-. b-. b-. g4^\tenuto
}

\book {
  \paper {
    #(set-paper-size "size 3.5-1.75")
    print-page-number = ##f
    indent = 0 \in
  }
  \score {
    <<
      \new Staff  \varIVB
      \new Staff \varIVBBottom
    >>
    \layout {}
    \midi {}
  }
}

varIVC = \relative d''' {
  \time 2/4
  d16-. \f f,-. d'-. f,-. c'-. e,-. c'-. e,-. |
  \once \override Beam.positions = #'( -5 . -5 )
  b' [g,32 g] g16 g g g g g
}


\book {
  \paper {
    #(set-paper-size "size 5.25-1")
    print-page-number = ##f
    indent = 0 \in
  }
  \score {
    <<
      \new Staff  \varIVC
    >>
    \layout {}
    \midi {}
  }
}
