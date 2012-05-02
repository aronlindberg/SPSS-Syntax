*Testing for multicollinearity

GET
  FILE='C:\Users\Dropbox/Datasav'.
DATASET NAME DataSet1 WINDOW=FRONT.

* Test for multicollinearity, i.e. if several IVs are so highly correlated that we cannot distinguish their effects on the DV.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS ALL
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT dependent_variable_1
  /METHOD=ENTER variable1 variable2 variable3  /SAVE MAHAL.


* Export Output.

OUTPUT EXPORT
  /CONTENTS  EXPORT=ALL  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
  /PDF DOCUMENTFILE='C:\Users\Dropbox\Output.pdf'
     NOTESCAPTIONS=YES  WIDETABLES=WRAP
     PAGESIZE=INCHES(8.5, 11.0)  TOPMARGIN=INCHES(1.0)  BOTTOMMARGIN=INCHES(1.0)
     LEFTMARGIN=INCHES(1.0)  RIGHTMARGIN=INCHES(1.0).
