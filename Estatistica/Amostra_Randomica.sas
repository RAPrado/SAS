*Referência : https://support.sas.com/kb/24/802.html;

/* Method 1:  Using PROC SURVEYSELECT                                */
/* Example 1                                                         */
/*                                                                   */
/* Use METHOD=URS.  N= is the number of observations to select.  The */
/* sample is stored in the OUT= data set, SAMPLE.                    */
/*                                                                   */
/* The OUTHITS option includes an observation in the OUT= data set   */
/* for each selected unit. By default, the OUT= will contain one     */
/* observation for each unique selected unit and the NumberHits      */
/* variable identifies the number of times each unit is selected.    */

proc surveyselect data=EastHigh method=urs n=15 out=sample outhits;
run;

title "Method 1: PROC SURVEYSELECT ";
proc print;
run;

/* Example 2                              */
proc surveyselect
   data= st192.cars      /* sample from data table */
   seed=31475            /* If no SEED option is specified, SAS uses the system time as its seed value. This creates a different random sample every time the procedure is run. */
   method=srs            /* For simple random sampling without replacement, use METHOD=SRS. For simple random sampling with replacement, use METHOD=URS. For other selection methods and details on sampling algorithms, see the SAS online documentation for PROC SURVEYSELECT. */
   sampsize=12           /* sample size */
   out=work.CarSample12; /* sample stored in this data set */
run;

/* Example 3 - shows how to select a certain percentage of the original sample using the SAMPRATE= option.*/
proc surveyselect data=Statdata.cars    /* sample from data table */
                  seed=13094425         /* recommended that you use this option */
                  method=srs            /* simple random sample */
                  samprate=0.05         /* 0 < sampling rate < 1 */
                  out=work.cars12pc;    /* sample stored in this data set */
run;  


/* Method 2:  Using SAS DATA Step                                   */
/*                                                                  */
/* When sampling with replacement, once an obs is selected it goes  */
/* back into the pool of possible choices to be selected again.     */
/* Instead of reading through the data set sequentially, as in the  */
/* Simple random sample without replacement example, use the        */
/* POINT= option on the SET statement to read obs directly.         */
/*                                                                  */
/* In the sample below, the variable 'n' is set at compile time.    */
/* When the data set header is opened and read, the number of       */
/* observations in the data set is assigned to the variable.        */

data sample(drop=i);
  choice=int(ranuni(36830)*n)+1;
  set EastHigh point=choice nobs=n;
  i+1;

  /* Enter the desired sample size, 15 in this case */
  if i>15 then stop;
run;
