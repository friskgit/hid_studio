\version "2.24"
\include "ekme-heji.ily"

#(define-markup-command (mysans layout props m) (markup?)
  (interpret-markup layout props
   #{ \markup \box \sans \small #m #}))

#(define-markup-command (nobox layout props m) (markup?)
  (interpret-markup layout props
   #{ \markup \sans \tiny #m #}))

\header {
  title = ""
  tagline = ##f
}

  
  music = {
    \relative c' {
      \override Staff.Clef.transparent = ##t
      r1
    }
  }
  \score {
    \new Staff \with {
      \omit BarLine
      \omit TimeSignature
    }
    \music
    \layout{}
  }
