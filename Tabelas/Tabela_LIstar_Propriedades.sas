*Referência :https://marc.info/?l=sas-l&m=116624330819938&w=2;
proc sql inobs=10;
	create table Tabela as
	select *
	from sashelp.vtable
	where memname = 'Nome da tabela' and memtype = 'DATA';
quit;
