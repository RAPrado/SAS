proc sql;
	create table Teste as
	select
	TRANWRD('1.2345'),'.',',') AS A,
  TRANWRD('ABC DE'),'AB','ZY') AS B
	from tabela;
quit;
