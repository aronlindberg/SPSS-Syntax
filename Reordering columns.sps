* Open data set.
GET
  FILE='\\psf\Home\Downloads\Dataset.sav'.
DATASET NAME Pilot WINDOW=FRONT.

* This will save a new version of your dataset with the variables (columns) ordered as specified below.

SAVE OUTFILE ='\\psf\Home\Downloads\Dataset_with_reordered_columns.sav'
/KEEP =V1 V2 V3 V4 V5 V6 V7 V8 V9 V10.
