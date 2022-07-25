*Irá ler e trazer apenas os 10 primeiros registros lidos;
proc sql inobs=10;
	create table Tabela as
	select CampoA, CampoB
	from Tab_Z;
 quit;

*Irá ler todos os registos da tabela, porém apenas os 10 primeiros registros serão exibidos;
proc sql outobs=10;
	create table Tabela as
	select CampoA, CampoB
	from Tab_Z;
 quit;

*Como está unindo duas tabelas, o comando OBS=10 foi colocado após o nome de cada tabela, para assim trazer apenas 10 registros de cada tabela.
Se tivesse usado o INOBS ou OUTOBS, primeiro iria unir as duas tabelas e depois traria os 10 primeiros registos, e nà0 10 de cada tabela.
proc sql;
	create table Tabela as
	select CampoA, CampoB
	from Tab_Z (OBS=10)
  
  union all
  
  select CampoA, CampoB
	from Tab_X (OBS=10)
quit;

*Referência sobre (OBS=10)
https://communities.sas.com/t5/SAS-Programming/How-to-select-first-few-records-to-test-the-Proc-sql/td-p/7589;
