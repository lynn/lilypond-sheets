\version "2.18.2"

\header {
  title = "Naufrages"
  composer = "Yann ‘Nurykabe’ van der Cruyssen (@Morusque)"
  arranger = "arr. Lynn (@chordbug)"
}

global = {
  \key a \minor
  \numericTimeSignature \time 4/4
  \partial 4
  \tempo 4 = 105
}

myslur = {
  \phrasingSlurUp
  \shape #'((0.7 . 1.4) (0.5 . 1.9) (2.3 . 4) (3 . -2.5)) PhrasingSlur
}

right = {
  \global
  <<
    \new Voice = "soprano" \relative a {
      \oneVoice r4
      \mark \markup { \italic mysterieux }
      \repeat volta 2 {
        \repeat unfold 2 {
          \oneVoice r4 <b c e>8-. <b c e>8-. <b c e>4-- a16 b c d
          \voiceOne es8 d16 es d8 c d c d es
        }
        e?4.\( c8 a'4. e8
        <e! a es'>2\) <d a'~ d>4 <c a' c> \break
        \grace {b'16 c} b8 a b a b-5 a-4 e-3 c-2
        g'4 ges f g
        <e c>1
        es4 d c as
      }
    }
    \new Voice = "alto" \relative a {
      \voiceTwo
      s4
      \repeat volta 2 {
        \repeat unfold 2 {
          s1
          <a b>4. a8 b a b4
        }
        s1
        s1
        e2. s4
        <as, c>2 <as d>2
        \myslur b8\( a b a b a \change Staff = "left" \voiceOne \stemNeutral e c\)
        \change Staff = "right" \voiceTwo
        a'2 ges4 f
      }
    }
  >>
}

left = \relative a, {
  \global
  e16( fis g gis a4) r r a16( as g ges f1)
  a4 r r a16( as g ges f1)
  \set tieWaitForNote = ##t
  a8~ e'~ <a, e' a>4 e'8~ a~ <e a c>4
  f1
  << {c'2 s} \\ {b8 a b a b a^1 e^2 c^3} >>
  f,2  e
  a1
  <f es'>2 e
}

\score {
  \new PianoStaff <<
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } \right
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \clef bass \left }
  >>
  \layout { }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 105 4)
    }
  }
}
