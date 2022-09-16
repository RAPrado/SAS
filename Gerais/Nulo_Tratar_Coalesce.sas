/***** Selecionar o primeiro valor não nulo em uma lista *****/
/*****     Select the first non-null value in a list    *****/

/*Referencia : https://www.listendata.com/2016/03/sas-coalesce-function.html */

/***** Cria uma tabela de exemplo    *****/
/*****   Creates an example table    *****/
data teste;
	input ID COL1-COL4;
	cards;
	1 10 . 30 40
	2 . 20 40 50
	3 . . . 60
	;
run;

/***** Usando o comando Coalesce em um data step *****/
/***** Using the Coalesce command in a data step *****/
data tratado;
	set teste;
	Coluna_Nao_Nula = coalesce(of COL1-COL4);
	/*Para coluna com string usar a coalescec*/
run;

/***** Usando o comando Coalesce em uma proc sql *****/
/***** Using the Coalesce command in a proc sql  *****/
proc sql;
	select *,
	coalesce(COL1,COL2,COL3,COL4) as Coluna_Nao_Nula
	/*Para coluna com string usar a coalescec*/
	from teste;
quit;
