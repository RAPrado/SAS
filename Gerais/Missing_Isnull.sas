/***** Função para verificar se campo é nulo *****/
/***** Function to check if the field is null *****/
*Opção 1;
proc sql;
	create table Teste as
	select campo_a
	from tabela
    where campo_b is missing;
quit;

*Opção 2;
proc sql;
	create table Teste as
	select campo_a
	from tabela
    where campo_b is null;
quit;
