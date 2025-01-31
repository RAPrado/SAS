*Lista os arquivos sasdataset e o seu tamanho físico;
*Referencia : https://communities.sas.com/t5/SAS-Enterprise-Guide/Is-there-a-way-to-view-the-physical-size-of-SAS-Data-set-within/td-p/207897;
proc sql;
	create table tamanho as
	select memname, filesize format=sizekmg10.1
	from dictionary.tables
	where libname='lib' and memtype='DATA';
quit;
