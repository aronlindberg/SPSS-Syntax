*Code for Sample Output on 3.27.12.

GET
  FILE='\\vmware-host\Shared Folders\Ellen and Aron Sessions\Dissertation_Data_3.27.12.sav'.
DATASET NAME DataSet4 WINDOW=FRONT.

*put your commands here. 

DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=Q13_1 Q13_2 Q13_3
  /STATISTICS=STDDEV VARIANCE RANGE MINIMUM MAXIMUM MEAN MEDIAN MODE SUM SKEWNESS SESKEW KURTOSIS 
    SEKURT
  /HISTOGRAM NORMAL
  /ORDER=ANALYSIS.

* Export Output.
OUTPUT EXPORT
  /CONTENTS  EXPORT=ALL  LAYERS=ALL  MODELVIEWS=ALL
  /PDF  DOCUMENTFILE='\\vmware-host\Shared Folders\Ellen and Aron Sessions\3.27.12 Session '+
    'Output ARON.pdf'
     EMBEDBOOKMARKS=YES  EMBEDFONTS=YES.
