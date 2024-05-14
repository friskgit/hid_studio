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
      \mark \markup \sans "[7.35'']"
      <
        eoaa
        euaa
      >1\fermata
      _\markup \mysans "5/4"
      _\markup \nobox "(-14)"
      ^\markup \mysans "32/25"
      ^\markup \nobox "(27)"      
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
