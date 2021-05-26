********** Retorna a data corrente em vários formatos **********;
********** Returns the current date in various formats **********;
*Adaptado de : https://documentation.sas.com/doc/en/vdmmlcdc/1.0/leforinforref/n0av4h8lmnktm4n1i33et4wyz5yy.htm;

proc sql;
    select
	today() as Campo_Data0,                 /*22426*/
	today() as Campo_Data1 format date5.,   /*26MAY*/
	today() as Campo_Data2 format date7.,   /*26MAY21*/
	today() as Campo_Data3 format date9.,   /*26MAY2021*/
	today() as Campo_Data4 format ddmmyy10.,/*21/05/2021*/
	today() as Campo_Data5 format yymmdd10.,/*2021-05-26*/
	today() as Campo_Data6 format date11.   /*26-MAY-2021*/
    from tabela;
quit;

*ou/or;

data _null_;
	Inicio=Date();

	put Inicio;         *22426;
	put Inicio date5.;  *26MAY;
	put Inicio date7.;  *26MAY21;
	put Inicio date9.;  *26MAY2021;
	put Inicio date10.; *26MAY2021;
	put Inicio ddmmyy10.;*26/05/2021;
	put Inicio yymmdd10.;*2021-05-26;
	put Inicio date11.;*26-MAY-2021*;
run;