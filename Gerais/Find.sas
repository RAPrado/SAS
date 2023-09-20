*Referência : https://www.statology.org/sas-find-function/;

proc sql;
	create table Procura as
	select email
	from tabela
	where find(email,'teste','i') > 0; /*Procura pela palavra teste e usa o parâmetro "i" para não diferenciar case sensitive*/
quit;
