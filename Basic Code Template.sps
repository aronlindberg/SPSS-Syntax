*Code for Sample Output on 3.27.12.

GET
  FILE='\\vmware-host\Shared Folders\Ellen and Aron Sessions\Dissertation_Data_3.27.12.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.


*put your commands here. 






* Export Output.
OUTPUT EXPORT
  /CONTENTS  EXPORT=ALL  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
  /PDF  DOCUMENTFILE='\\vmware-host\Shared Folders\Ellen and Aron Sessions\\Sample Output on X.XX.12.pdf'
     NOTESCAPTIONS=YES  WIDETABLES=WRAP
     PAGESIZE=INCHES(8.5, 11.0)  TOPMARGIN=INCHES(1.0)  BOTTOMMARGIN=INCHES(1.0)
     LEFTMARGIN=INCHES(1.0)  RIGHTMARGIN=INCHES(1.0).



