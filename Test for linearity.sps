*Code for Sample Output on 3.27.12.

GET
  FILE='C:\Users\emb7\Dropbox\Ellen and Aron Sessions\Dissertation_Data_3.27.12.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

* Run a regression so that we get a plot so that we can numerically and graphically test for linearity. 

DATASET ACTIVATE DataSet1.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Q16_2
  /METHOD=ENTER Q14_4 Q16_3
  /PARTIALPLOT ALL
  /SAVE MAHAL COOK.


* Export Output.

OUTPUT EXPORT
  /CONTENTS  EXPORT=ALL  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
  /PDF  DOCUMENTFILE='C:\Users\emb7\Dropbox\Ellen and Aron Sessions\Sample Output on 3.27.12.pdf'
     NOTESCAPTIONS=YES  WIDETABLES=WRAP
     PAGESIZE=INCHES(8.5, 11.0)  TOPMARGIN=INCHES(1.0)  BOTTOMMARGIN=INCHES(1.0)
     LEFTMARGIN=INCHES(1.0)  RIGHTMARGIN=INCHES(1.0).
