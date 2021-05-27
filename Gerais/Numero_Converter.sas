/***** Converte de número para texto *****/
/***** Converts from number to text *****/

%let inteiro=%eval(10+20); /*Inteiro/Interger*/
%put 'inteiro:' &inteiro;

%let decimal=%SYSEVALF (10.1+20.2); /*Decimal/Float*/
%put 'decimal:' &decimal;