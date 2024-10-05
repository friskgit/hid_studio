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
      \mark \markup \sans "[8.79'']"
      <
  	fubb\laissezVibrer
  	euaa\laissezVibrer
      >1
      ^\markup \mysans "64/49"
      ^\markup \nobox "(-38)"
      _\markup \mysans "32/25"
      _\markup \nobox "(27)"
      \> s4 s8. s16\!
    }
  }
  perc-music = {
    \relative c {
      \override Score.NonMusicalPaperColumn.padding = #3
      \override TupletNumber.text = #tuplet-number::calc-fraction-text
      \override NoteHead.style = #'triangle
      \time 6/4 \bar ".|:" a8.\ppp\< a8. a8. a8. a8. a8. a8. a8. \bar ":|."
      \time 6/4 a4\!\fff 
    }
  }
    \score {
      <<
        \new Staff \with {
          \omit BarLine
          \omit TimeSignature
        }
        \music
        \new DrumStaff \with {
  %        \remove Bar_engraver
          drumStyleTable = #percussion-style
          \override StaffSymbol.line-count = #1
        } \drummode {
    				%      \tempo 4 = 78
          \clef percussion 
          \perc-music
        }
      >>
      \layout{}
    }
