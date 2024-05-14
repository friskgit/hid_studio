\score {
  \new Staff \with {
    \omit BarLine
    \omit TimeSignature
  }
  \music
  \layout{}
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
