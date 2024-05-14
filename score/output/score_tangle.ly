\version "2.24"
 \include "ekme-heji.ily"

#(define-markup-command (mysans layout props m) (markup?)
 (interpret-markup layout props
  #{ \markup \box \sans #m #}))

  
  pitch_list = {
    \accidentalStyle "dodecaphonic"
    \fixed c' {
      a, ^"1/1"
      csoaa ^"5/4"  
      doba^"98/75"
      doba^"21/16"
      d^"4/3"  
      doba^"75/56" 
      e^"3/2"  
      fsoaa ^"5/3"  
      goba^"7/4"  
      gsoaa^"15/8"
      a ^"2/1"
    }
  }
   beatingA = {
     \tempo 4 = 60
     \time 4/4
     \relative c {
     \tuplet 25/16 {
       \override NoteHead.style = #'triangle
       \clef bass
       a4-\markup \mysans "98/75 against 21/16" a a a
       a a a a
       a a a a
       a a a a
       a a a a
       a a a a
       a } |
   }
   } %% 98/75 & 21/16
   beatingB = {
     \tempo 4 = 60
     \time 4/4
     \relative c {
     \tuplet 5/4 {
        \override NoteHead.style = #'triangle
        \clef bass
        \override Score.TextMark.font-family = #'sans
        a8_\markup \mysans "21/16 against 4/3" a a a a
        a a a a a
     } |
   }
   } %% 21/16 & 4/3
   beatingBB = {
     \tempo 4 = 60
     \time 5/4
     \relative c {
     \tuplet 27/10 {
        \override NoteHead.style = #'triangle
        \clef bass
        \override Score.TextMark.font-family = #'sans
        a8_\markup \mysans "21/16 against 4/3" a a a a
        a a a a a
        a a a a a
        a a a a a
        a a a a a
        a a
     } |
   }
   } %% 21/16 & 4/3
   beatingC = {
     \tempo 4 = 60
     \time 5/8
     \relative c {
     \tuplet 7/5 {
        \override NoteHead.style = #'triangle
        \clef bass
        \override Score.TextMark.font-family = #'sans
        a32_\markup \mysans "5/4 against 98/75" a a a a a a }
         \tuplet 7/5 {
        a a a a a a a }
            \tuplet 7/5 {
        a a a a a a a }
            \tuplet 7/5 {
        a a a a a a a }
            \tuplet 7/5 {
        a a a a a a a }
            \tuplet 7/5 {
        a a a a a a a 
        
     } |
   }
   } %% 5/4 & 98/75
    %% 75/56 & 4/3

    				%    	\pitch_list

   \score {
     \new StaffGroup <<
       \new Staff {
				% \pitch_list
       }
       \new Staff {
	 \stemUp
	 \beatingCt
       }
       \new Staff {  	
	 \stemUp
				%  	\beatingA \beatingBB
       }
     >>
     \layout{}
     \midi{}
   }
