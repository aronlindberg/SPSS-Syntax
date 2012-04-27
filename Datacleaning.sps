   * Open the dataset (remember that the path is dependent on which computer you are working on.
   GET
     FILE='\\vmware-host\Shared Folders\Ellen and Aron Sessions\Dissertation_Data_3.27.12.sav'.
   DATASET NAME Datacleaning WINDOW=FRONT.

*This command renames your variables. Create a paranthesis pair for each variable, 
put the old variable name before the equal sign and new variable sign after the equal sign).
Rename variables (V3=name) (V5=email).
EXECUTE.

*This command renames the variable labels. add a line for each variable in the format below (variablename NewLablename).
VARIABLE LABELS name The name of the respondent.
VARIABLE LABELS email The respondents email.
EXECUTE.

*Close the dataset (we don't want to save the dataset, but rather keep it pristine.
*Instead we want to keep all the changes in syntax files so that we can recreate them at any time, and also go back and check for bugs (mistakes).
DATASET CLOSE Datacleaning.

