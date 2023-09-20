proc sql;
	create table Teste as
	select
	TRANWRD('1.2345'),'.',',') AS A,
        TRANWRD('ABC DE'),'AB','ZY') AS B,
	COMPRESS(TRANWRD('ABC DE'),'AB','')) AS C /*Remove o espaço em branco deixado pelo tranwrd*/
	from tabela;
quit;
