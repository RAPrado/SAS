/*****  Mostra o total de linhas afetadas pelo comando sql  *****/
/*****  Shows the total lines affected by the sql command  *****/

proc sql;
	create table teste as
	select * from tabela;

	%let linhas=&sqlobs;
quit;

%put "Linhas inseridas :&linhas";


proc sql;	
	delete * from tabela;

	%let linhas=&sqlobs;
quit;

%put "Linhas excluidas :&linhas";