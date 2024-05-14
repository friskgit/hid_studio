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

  one-to-six = {
    \relative c {
      \override Score.NonMusicalPaperColumn.padding = #3
      \override TupletNumber.text = #tuplet-number::calc-fraction-text
      \tuplet 6/8 {
        \override NoteHead.style = #'triangle
        a16^\markup \mysans "32/25 against 5/4" a a a a a
      }
      \tuplet 6/8 {
        \override NoteHead.style = #'triangle
        a a a a a a | 
      }
    }
  }
  two-to-fifteen = {
    \relative c {
      \override Score.NonMusicalPaperColumn.padding = #3
      \override TupletNumber.text = #tuplet-number::calc-fraction-text
      \tuplet 7/8 {
        \override NoteHead.style = #'triangle
        a16^\markup \mysans "8/5 against 25/16" a a a a a a
      }
      \tuplet 7/8 {
        \override NoteHead.style = #'triangle
        a16 a a a a a a
      }
    }
  }  
   one-to-eleven = {
     \relative c {
       \override Score.NonMusicalPaperColumn.padding = #3
       \override TupletNumber.text = #tuplet-number::calc-fraction-text
       \tuplet 11/16 {
         \override NoteHead.style = #'triangle
         a16^\markup \mysans "64/49 against 5/4" a a a
         a a a a
         a a a
       }
     }
   }
    four-to-twentyf = {
      \relative c {
        \override Score.NonMusicalPaperColumn.padding = #3
        \override TupletNumber.text = #tuplet-number::calc-fraction-text
        \tuplet 25/16 {
          \override NoteHead.style = #'triangle
          a4^\markup \mysans "25/16 against 49/32" a a a a a a16~
        }
      }
    }
    three-to-sixteen = {
      \relative c {
        \override Score.NonMusicalPaperColumn.padding = #3
        \override TupletNumber.text = #tuplet-number::calc-fraction-text
        \override NoteHead.style = #'triangle
        a8.^\markup \mysans "64/49 against 32/25" a8. a8. a8. a8. a16~
      }
    }
     one-to-ten = {
       \relative c {
         \override Score.NonMusicalPaperColumn.padding = #3
         \override TupletNumber.text = #tuplet-number::calc-fraction-text
         \override NoteHead.style = #'triangle
         \tuplet 10/16 {
           a16^\markup \mysans "8/7 against 35/32" a a a a a a a a a }
       }
     }
         
      
      \score {
	<<
	  \new DrumStaff \with {
				% \remove Bar_engraver
	    drumStyleTable = #percussion-style
	    \override StaffSymbol.line-count = #1
	  } \drummode {
	    \tempo 4 = 78
	    \clef percussion 
	    \one-to-six
	  }
	  \new DrumStaff \with {
				% \remove Bar_engraver
	    drumStyleTable = #percussion-style
	    \override StaffSymbol.line-count = #1
	  } \drummode {
	    \clef percussion 
	    \two-to-fifteen
	  }
	  \new DrumStaff \with {
				% \remove Bar_engraver
	    drumStyleTable = #percussion-style
	    \override StaffSymbol.line-count = #1
	  } \drummode {
	    \clef percussion 
	    \one-to-eleven
	  }
	  \new DrumStaff \with {
				% \remove Bar_engraver
	    drumStyleTable = #percussion-style
	    \override StaffSymbol.line-count = #1
	  } \drummode {
	    \clef percussion 
	    \four-to-twentyf
	  }
	  \new DrumStaff \with {
				% \remove Bar_engraver
	    drumStyleTable = #percussion-style
	    \override StaffSymbol.line-count = #1
	  } \drummode {
	    \clef percussion 
	    \three-to-sixteen
	  }
	  \new DrumStaff \with {
				% \remove Bar_engraver
	    drumStyleTable = #percussion-style
	    \override StaffSymbol.line-count = #1
	  } \drummode {
	    \clef percussion 
	    \one-to-ten
	  }
	>>
      }
      \layout{}
