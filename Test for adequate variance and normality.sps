*Test for adequate variance and normality

GET
  FILE='\\vmware-host\Shared Folders\Dropbox\Data.sav'.
DATASET NAME DataSet4 WINDOW=FRONT.

* The frequencies command displays all kinds of statistics about variables that you can use to determine variance
* (through looking at how variables are distributed) and normality (kurtosis, skewness as well as histograms).

DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=Q13_1 Q13_2 Q13_3
  /STATISTICS=STDDEV VARIANCE RANGE MINIMUM MAXIMUM MEAN MEDIAN MODE SUM SKEWNESS SESKEW KURTOSIS 
    SEKURT
  /HISTOGRAM NORMAL
  /ORDER=ANALYSIS.

* Export Output.
OUTPUT EXPORT
  /CONTENTS  EXPORT=ALL  LAYERS=ALL  MODELVIEWS=ALL
  /PDF  DOCUMENTFILE='\\vmware-host\Shared Folders\Dropbox\Output.pdf'
     EMBEDBOOKMARKS=YES  EMBEDFONTS=YES.
