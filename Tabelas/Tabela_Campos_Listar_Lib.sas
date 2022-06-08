*
Ref.:https://communities.sas.com/t5/Forum-em-portugu%C3%AAs/Relacionar-os-arquivos-de-Uma-LIB-em-uma-tabela/td-p/751442
Listar todas as tabelas e respectivas colunas, contidas em uma libname;

proc sql;
	create table Conteudo as
	select * from dictionary.columns
	where libname = 'lib name';
quit;
