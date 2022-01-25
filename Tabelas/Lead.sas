/*
Referencia : https://support.sas.com/kb/36/199.html
This sample demonstrates how to read the subsequent observation in a data set in addition to the current observation during the same iteration of the DATA step. The value of a variable from the subsequent observation is subtracted from the same variable in the current observation to demonstrate this functionality. Conditional logic is included so as not to attempt to read a subsequent observation when the current observation is the last observation in the data set.
*/
/*Sample data set*/
data one;
  input var1 $ var2;
datalines;
A 10
B 22
C 5
D 41
E 33
;
run;

*Tabela de origem deve estar ordenada;

data two;
/*Add the END= option to facilitate checking for last observation.*/
  set one end=finished;
/*Look ahead only if not on last observation.*/
  if not finished then do;
/*Define or calculate the observation number to be read. In this example,*/
/*simply add one to the _N_ variable to read the very next observation.*/
  pt = _N_ + 1;
/*Be sure to keep only pertinent variables and rename them.*/
  set one (keep= var2 rename= (var2 = next_var2)) point=pt;
/*Subtract next value of var2 from current value of var2.*/
  diff = var2 - next_var2;
  end;
  else next_var2 = .;
run;
