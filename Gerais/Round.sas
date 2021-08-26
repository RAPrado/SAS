/*****  Comando round para arrendondar a casa decimal ou a parte inteira  *****/
/*****  Round command to round the decimal place or the whole part  *****/
*Referência: https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/lefunctionsref/p0tj6cmga7p8qln1ejh6ebevm0c9.htm;

data round;
   original=1234.56789; 
   campo1=round(original, 100);*      1200; 
   campo2=round(original, 10);*       1230; 
   campo3=round(original, 1);*        1235; 
   campo4=round(original, .1);*       1234.6;
   campo5=round(original, .01);*      1234.57; 
   campo6=round(original, .001);*     1234.568;  
   campo7=round(original, .0001);*    1234.5679; 
   campo8=round(original, .00001);*   original;
   campo9=round(original, .1111);*    1234.5432;
   campo10 = round(original, .11111);*1234.54321; 
run;
