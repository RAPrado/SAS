/***** Função para verificar se campo é nulo *****/
/***** Function to check if the field is null *****/

proc sql;
	create table Ramo as
	select campo_a
	from tabela
    where missing(campo_b);
quit;