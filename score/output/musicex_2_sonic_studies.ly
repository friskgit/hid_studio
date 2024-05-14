\version "2.24"
\include "ekme-heji.ily"

musicA = {
  \accidentalStyle "dodecaphonic"
  \fixed c' {
    f1~^\markup \box {
      \pad-around #0.5 {
  	{
  	  \halign #0
  	  \center-column {
  	    \sans \small 4/3
  	  }
  	}
      }
    }
    f1\fermata
    boaa~^\markup \box {
      \pad-around #0.5 {
  	{
  	  \halign #0
  	  \center-column {
  	    \sans \small 15/8
  	  }
  	}
      }
    }
    boaa1\fermata
    goba1~^\markup \box {
      \pad-around #0.5 {
    	{
    	  \halign #0
    	  \center-column {
    	    \sans \small 21/16
    	  }
    	}
      }
    }
    goba2.~ <goba f>4~^\markup \box {
      \pad-around #0.5 {
  	{
  	  \halign #0
  	  \center-column {
  	    \sans \small 4/3
  	  }
  	}
      }
    }
    <goba f>1~
  }
}
musicB = {
  \accidentalStyle "dodecaphonic"
  \fixed c' {
    r4
    goba2.~^\markup \box {
      \pad-around #0.5 {
    	{
    	  \halign #0
    	  \center-column {
    	    \sans \small 21/16
    	  }
    	}
      }
    }
    goba1\fermata
    r2. asoba4~^\markup \box {
      \pad-around #0.5 {
    	{
    	  \halign #0
    	  \center-column {
    	    \sans \small 7/4
    	  }
    	}
      }
    }
    asoba1~\fermata
    asoba1~
    asoba1~
    asoba1
  }
}
musicC = {
  \accidentalStyle "dodecaphonic"
  \fixed c' {
    r1
    g1~\fermata ^\markup \box {
      \pad-around #0.5 {
    	{
    	  \halign #0
    	  \center-column {
    	    \sans \small 3/2
    	  }
    	}
      }
    }
    g1~
    g1\fermata
    r2. boaa4~^\markup \box {
      \pad-around #0.5 {
  	{
  	  \halign #0
  	  \center-column {
  	    \sans \small 15/8
  	  }
  	}
      }
    }
    boaa1~
    boaa
  }
}


\score {
  <<
    \new Staff { \clef treble
		 \musicA \bar "||"}
    \new Staff { \clef treble
		 \musicB }
    \new Staff { \clef treble
		 \musicC }
    >>
}
