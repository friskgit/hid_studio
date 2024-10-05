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
        a16\ff
        ^\markup \mysans "32/25 against 5/4"
        a a a a a
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
        a16\ff^\markup \mysans "8/5 against 25/16" a a a a a a
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
       \override TextSpanner.style = #'line
       \override TextSpanner.Y-offset = #4
       \tuplet 11/16 {
         \override NoteHead.style = #'triangle
         a16\ff
         ^\markup \mysans "64/49 against 5/4"
         ^\markup \sans "[80.00'']"
         \startTextSpan
         a a a
         a a a a
         a a a |}
       \tuplet 11/16 {
         a16 a a a
         a\> a a a
         a a a
       }
       \tuplet 11/16 {
         a16 a a a
         a a a a
         a a a\!\stopTextSpan
       }
     }
   }
    four-to-twentyf = {
      \relative c {
        \override Score.NonMusicalPaperColumn.padding = #3
        \override TupletNumber.text = #tuplet-number::calc-fraction-text
        \tuplet 25/16 {
          \override NoteHead.style = #'triangle
          a4\ff^\markup \mysans "25/16 against 49/32" a a a a a a16~ } |
        \tuplet 25/16 {
          a8.\> a4 a4 a4 a4 a4 a8 \!|
          
        }
      }
    }
    three-to-sixteen = {
      \relative c {
        \override Score.NonMusicalPaperColumn.padding = #3
        \override TupletNumber.text = #tuplet-number::calc-fraction-text
        \override NoteHead.style = #'triangle
        a8.\ff^\markup \mysans "64/49 against 32/25" a16~ a8 a8~ a16 a8. a8. a16~ |
        a8\> a8~ a16 a8. a8.\! r16 r4 |
      }
      
    }
     one-to-ten = {
       \relative c {
         \override Score.NonMusicalPaperColumn.padding = #3
         \override TupletNumber.text = #tuplet-number::calc-fraction-text
         \override NoteHead.style = #'triangle
         \tuplet 10/16 {
           a16\ff^\markup \mysans "8/7 against 35/32" a a a a a a a a a }
       }
     }
         

      #(set-default-paper-size "a3" 'landscape)
      
      \score {
	<< \new StaffGroup <<
	  \new DrumStaff \with {
				% \remove Bar_engraver
	    drumStyleTable = #percussion-style
	    \override StaffSymbol.line-count = #1
	  } \drummode {
	    \tempo 4 = 78
	    \clef percussion 
	    \bar ".|:" \one-to-six \bar ":|."
	  }
	  \new DrumStaff \with {
				% \remove Bar_engraver
	    drumStyleTable = #percussion-style
	    \override StaffSymbol.line-count = #1
	  } \drummode {
	    \clef percussion 
	    \two-to-fifteen |
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
	    \three-to-sixteen |
	  }
	  \new DrumStaff \with {
				% \remove Bar_engraver
	    drumStyleTable = #percussion-style
	    \override StaffSymbol.line-count = #1
	  } \drummode {
	    \clef percussion 
	    \one-to-ten | s1
	  }
	  \new Staff {
	    \clef bass c,1\mp~ c,4
	    }
	  
	>>
	 >>
      }
      \layout{}
