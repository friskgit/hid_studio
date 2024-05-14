\version "2.24"
\include "ekme-heji.ily"

#(define-markup-command (mysans layout props m) (markup?)
  (interpret-markup layout props
   #{ \markup \box \sans #m #}))

one-to-six = {
  \relative c'' {
    \override Score.NonMusicalPaperColumn.padding = #3
    \override TupletNumber.text = #tuplet-number::calc-fraction-text
    \tuplet 6/8 {
      \override NoteHead.style = #'triangle
      a,16^\markup \mysans "32/25 against 5/4" a a a a a
      }
      \tuplet 6/8 {
	\override NoteHead.style = #'triangle
	a a a a a a
      }
    }
  }
two-to-fifteen = {
  \relative c'' {
    \override Score.NonMusicalPaperColumn.padding = #3
    \override TupletNumber.text = #tuplet-number::calc-fraction-text
    \tuplet 7/8 {
      \override NoteHead.style = #'triangle
      \transpose a c {
	a16^\markup \mysans "8/5 against 25/16" a a a a a a

	\tuplet 7/8 {
	  \override NoteHead.style = #'triangle
	  a16 a a a a a a
	}
      }
    }
  }
}  
one-to-eleven = {
  \relative c'' {
    \override Score.NonMusicalPaperColumn.padding = #3
    \override TupletNumber.text = #tuplet-number::calc-fraction-text
    \tuplet 11/16 {
      \override NoteHead.style = #'triangle
      \transpose a c { 
	a16^\markup \mysans "64/49 against 5/4" a a a
	a a a a
	a a a
      }
    }
  }
}
four-to-twentyf = {
  \relative c'' {
    \override Score.NonMusicalPaperColumn.padding = #3
    \override TupletNumber.text = #tuplet-number::calc-fraction-text
    \tuplet 25/16 {
      \override NoteHead.style = #'triangle
      \transpose a c {
	a4^\markup \mysans "25/16 against 49/32" a a a a a a16~
      }
    }
  }
}
three-to-sixteen = {
  \relative c'' {
    \override Score.NonMusicalPaperColumn.padding = #3
    \override TupletNumber.text = #tuplet-number::calc-fraction-text
    \override NoteHead.style = #'triangle
    \transpose a c {
      a8.^\markup \mysans "64/49 against 32/25" a8. a8. a8. a8. a16~
    }
  }
}
one-to-ten = {
  \relative c'' {
    \override Score.NonMusicalPaperColumn.padding = #3
    \override TupletNumber.text = #tuplet-number::calc-fraction-text
    \override NoteHead.style = #'triangle
    \tuplet 10/16 {
      a16^\markup \mysans "8/7 against 35/32" a a a a a a a a a }
  }
}


\score {
  <<
    \new Staff \with {
				% \remove Bar_engraver
      drumStyleTable = #percussion-style
      \override StaffSymbol.line-count = #1
    }  {
      \clef percussion
      \one-to-six
    }
    \new Staff \with {
				% \remove Bar_engraver
      drumStyleTable = #percussion-style
      \override StaffSymbol.line-count = #1
    }  {
      \clef percussion 
      \two-to-fifteen
    }
    \new Staff \with {
				% \remove Bar_engraver
      drumStyleTable = #percussion-style
      \override StaffSymbol.line-count = #1
    }  {
      \clef percussion 
      \one-to-eleven
    }
    \new Staff \with {
				% \remove Bar_engraver
      drumStyleTable = #percussion-style
      \override StaffSymbol.line-count = #1
    }  {
      \clef percussion 
      \four-to-twentyf
    }
    \new Staff \with {
				% \remove Bar_engraver
      drumStyleTable = #percussion-style
      \override StaffSymbol.line-count = #1
    } \drummode {
      \clef percussion 
      \three-to-sixteen
    }
    \new Staff \with {
				% \remove Bar_engraver
      drumStyleTable = #percussion-style
      \override StaffSymbol.line-count = #1
    } {
      \clef percussion 
      \one-to-ten
    }
  >>
  \layout{}
  \midi{}
}
