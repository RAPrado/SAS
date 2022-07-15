/*Refência : https://sasexamplecode.com/how-to-add-row-numbers-in-sas/ */

/*ROW NUMBER usando data step*/
data work.tabela_final;
	set work.tabela;

	ID = _N_;
run;

*******************************************************************************;

/*ROW NUMBER usando proc sql*/
proc sql;
	create table work.tabela_final as
	select *,
	monotonic() as ID
	from work.tabela;
quit;

*******************************************************************************;

/*ROW NUMBER por grupo*/
data Tabela2;
	set Tabela1;
	by ColunaA; /*Campo a ser agrupado*/

	if first.ColunaA then row_number=0;

	row_number+1;
run;

/*
Exemplo de resultado da Tabela2

ColunaA		Row_Number
111		1
111		2
222		1
333		1
333		2
333		3
*/
