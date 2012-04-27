*Basic Code Template

* Open the dataset (remember to set the path, or paste the command in from the menu)
GET
  FILE='\\vmware-host\Shared Folders\Dropbox\Data.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.


*put your commands here. 


* Export Output. Remember to set the path to your computer.

OUTPUT EXPORT
  /CONTENTS  EXPORT=ALL  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
  /PDF  DOCUMENTFILE='\\vmware-host\Dropbox\Sample Output on X.XX.12.pdf'
     NOTESCAPTIONS=YES  WIDETABLES=WRAP
     PAGESIZE=INCHES(8.5, 11.0)  TOPMARGIN=INCHES(1.0)  BOTTOMMARGIN=INCHES(1.0)
     LEFTMARGIN=INCHES(1.0)  RIGHTMARGIN=INCHES(1.0).



