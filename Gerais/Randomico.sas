****** Exemplo de uso da função randomica ******;
******    Example of random function   ******;
*Adaptado de :
https://blogs.sas.com/content/iml/2015/10/05/random-integers-sas.html
https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/lestmtsref/p08do6szetrxe2n136ush727sbuo.htm:


****** Exemplo de random usando Array com resultado por coluna ******;
****** Example of random using Array with result per column ******;

data Randomico1 (drop=i);
	array z{10} Col01-Col10;
	do i=1 to 10;
	  z{i}=rand("Integer", 1, 10);
	end;
run;

******* Exemplo de random com resultado por linha ******;
*******   Example of random with result per line  *******;
data Randomico2;
	call streaminit(12345);        /* use default method */
	do i = 1 to 8;
	   u1 = rand('uniform');
	   n1 = rand('normal');
	   i1 = rand("Integer", 1, 10); /*Valor inteiro entre dois números. Requer versão 9.4M5 ou superior*/
	   output;
	end;
run;

********** Quando versão do SAS inferior a 9.4M5, tem que usar uma macro **********;
*Referência : https://blogs.sas.com/content/iml/2015/10/05/random-integers-sas.html#:~:text=For%20example%2C%20if%20you%20want%20a%20random%20integer,has%20the%20same%20functionality%20as%20the%20Excel%20function. ;
%macro RandBetween(min, max);
   (&min + floor((1+&max-&min)*rand("uniform")))
%mend;

data Randomico3;
	call streaminit(12345);        /* use default method */
	do i = 1 to 8;
	   u1 = rand('uniform');
	   n1 = rand('normal');
	   i1 = %RandBetween(1, 10); /*Valor inteiro entre dois números.*/
	   output;
	end;
run;
