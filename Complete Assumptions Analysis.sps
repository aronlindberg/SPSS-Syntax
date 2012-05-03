COMMENT Open the data set.

GET
  FILE='Z:\Advanced Statistics II\Homework #1\Employee data 473.sav'.

DATASET NAME Employee_data WINDOW=FRONT.

COMMENT Test for Adequate Variability
COMMENT Run frequencies to see if the data set actually has adequate variability. My assessment is that there is variability in the data.

FREQUENCIES
  VARIABLES=salary salbegin prevexp minority jobtime gender educ
  /FORMAT=ONEPAGE
  /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /HISTOGRAM NORMAL.

COMMENT Explore the data through the examine command. It is pretty obvious that there is a spread in the data.

EXAMINE
  VARIABLES=salary salbegin prevexp minority jobtime gender educ
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUP
  /STATISTICS DESCRIPTIVES EXTREME
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

COMMENT  Test for influential cases.

REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT salary
  /METHOD=ENTER salbegin prevexp minority jobtime gender educ
  /PARTIALPLOT ALL
  /SCATTERPLOT=(*SDRESID, *ZPRED) (*SDRESID, salbegin) (*SDRESID, gender) (*SDRESID, jobtime) (*SDRESID, educ) 
                            (*SDRESID, prevexp) (*SDRESID, minority) (*SDRESID, jobtime)
  /RESIDUALS HIST(SDRESID) NORM(SDRESID) OUTLIERS (COOK, MAHAL, SDRESID)
  /SAVE ZPRED MAHAL COOK SDRESID DFBETA SDBETA COVRATIO.

COMMENT Run a scatterplot to provide a graphic overview of outliers.

GRAPH
  /SCATTERPLOT(BIVAR)=mah_1 WITH sdr_1 BY coo_1 (IDENTIFY)
  /MISSING=LISTWISE .

COMMENT The next two commands provide gaphic looks at influential cases.

GRAPH
  /SCATTERPLOT(BIVAR)=mah_1 WITH sdr_1 BY coo_1 (IDENTIFY)
  /MISSING=LISTWISE.

EXAMINE
  VARIABLES=mah_1 coo_1 cov_1 sdb0_1 sdb1_1 sdb2_1 sdb3_1 sdb4_1 sdb5_1 sdr_1
  /PLOT BOXPLOT HISTOGRAM 
  /COMPARE GROUP
  /STATISTICS DESCRIPTIVES EXTREME (10)
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

COMMENT The next commands are graphic tests of constant error variance (secondary assumption 1).

GRAPH
  /SCATTERPLOT(BIVAR)=zpr_1 WITH sdr_1
  /MISSING=LISTWISE .

GRAPH
  /SCATTERPLOT(BIVAR)= salbegin WITH sdr_1
  /MISSING=LISTWISE .

GRAPH
  /SCATTERPLOT(BIVAR)= gender WITH sdr_1
  /MISSING=LISTWISE .

GRAPH
  /SCATTERPLOT(BIVAR)=jobtime WITH sdr_1
  /MISSING=LISTWISE .

GRAPH
  /SCATTERPLOT(BIVAR)=educ WITH sdr_1
  /MISSING=LISTWISE .

GRAPH
  /SCATTERPLOT(BIVAR)= prevexp WITH sdr_1
  /MISSING=LISTWISE .

GRAPH
  /SCATTERPLOT(BIVAR)= minority WITH sdr_1
  /MISSING=LISTWISE .

COMMENT The next two commands are graphic and significance tests of the normality of the residuals.

FREQUENCIES
   VARIABLES=sdr_1
   /STATISTICS=STDDEV RANGE MINIMUM MAXIMUM MEAN MEDIAN SKEWNESS SESKW KURTOSIS SEKURT
   /HISTOGRAM NORMAL.

EXAMINE VARIABLES=sdr_1
   /PLOT HISTOGRAM NPPLOT
   /COMPARE GROUP
   /STATISTICS DESCRIPTIVES
   /CINTERVAL 95
   /MISSING LISTWISE
   /NOTOTAL.

COMMENT Print the output to PDF.

OUTPUT EXPORT
  /CONTENTS  EXPORT=ALL  LAYERS=PRINTSETTING  MODELVIEWS=PRINTSETTING
  /PDF  DOCUMENTFILE='Z:\Advanced Statistics II\Homework #1\Homework1 Output.pdf'
     EMBEDBOOKMARKS=YES  EMBEDFONTS=YES.

COMMENT Close the dataset.

DATASET CLOSE Employee_data.






