/***** Converte de número para texto ou vice versa *****/
/***** Converts from number to text *****/

%let inteiro=%eval(10+20); /*Inteiro/Interger*/
%put 'inteiro:' &inteiro;

%let decimal=%SYSEVALF (10.1+20.2); /*Decimal/Float*/
%put 'decimal:' &decimal;


*ou/or;
proc sql;
	create table Teste as
	select
	put(202106,6.) as ANO_MES_Em_Texto,
	input('202106',8.) as ANO_MES_Em_Numero,
	put(1.2345,6.4) AS Numero_Decimal_Para_Texto /*Onde 6.4 = 6 o total de caracteres já contemplando a parte decimal, e 4 o total apenas do decimal*/
	from tabela;
quit;
