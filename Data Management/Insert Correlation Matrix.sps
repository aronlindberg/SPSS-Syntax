* From: http://www-01.ibm.com/support/docview.wss?uid=swg21479694

* Example 1: This example includes a single value for the sample size, as specified by the /N subcommand in the MATRIX DATA command. Use of this subcommand implies that the Ns are the same for all variables, either due to full data or listwise deletion in creation of the correlation matrix. In listwise deletion, only cases with valid data on all of the analysis variables are included in calculation of each correlation.

MATRIX DATA VARIABLES = y1 TO y4 x1 TO x4
/N= 200 
/CONTENTS = CORR .
BEGIN DATA.
1
0.484 1
0.464 0.425 1
0.598 0.484 0.598 1
0.461 0.347 0.585 0.825 1
0.655 0.323 0.56 0.683 0.655 1
0.343 -0.006 0.253 0.543 0.47 0.438 1
0.551 0.217 0.516 0.679 0.567 0.558 0.518 1
END DATA.
EXECUTE.
FACTOR
/MATRIX = IN (COR = *)
/PRINT INITIAL EXTRACTION ROTATION
/FORMAT SORT
/CRITERIA MINEIGEN(.5) ITERATE(25)
/EXTRACTION PC
/CRITERIA ITERATE(25) DELTA(0)
/ROTATION OBLIMIN
/METHOD=CORRELATION .

* Example 2: This example reads a correlation matrix that was computed with pairwise deletion of missing values, along with the matrix of pairwise Ns. In pairwise deletion, each correlation is calculated with the cases that have valid data on that pair of variables, without regard to whether those cases have missing data on other variables in the analysis. To enter a matrix of pairwise Ns, omit the /N subcommand, add N_MATRIX to the /CONTENTS subcommand, and specify a matrix of N's as in the example below.

* Example of correlation matrix input for factor with pairwise Ns .

MATRIX DATA VARIABLES = x1 TO x5
/CONTENTS = N_MATRIX CORR .
BEGIN DATA.
99	
96	97	
98	96	99	
95	95	96	96 
97	95	97	94	98	
1	
.720	1	
.638	.560	1	
.628	.644	.548	1	
.639	.652	.641	.661	1	
END DATA.
EXECUTE.

FACTOR 
/MATRIX = IN (COR = *) 
/MISSING PAIRWISE 
/PRINT INITIAL EXTRACTION ROTATION repr kmo 
/FORMAT SORT 
/CRITERIA MINEIGEN(1.0) ITERATE(100) 
/EXTRACTION PAF 
/CRITERIA ITERATE(25) DELTA(0) 
/ROTATION varimax 
/METHOD=CORRELATION . 
