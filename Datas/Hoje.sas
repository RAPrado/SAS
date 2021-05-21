********** Retorna uma data com o dia atual **********;
********** Returns a date with the current day **********;
proc sql;
    select
    today() as Campo_Data1 format ddmmyy10., /*21/05/2021*/
	today() as Campo_Data2 format date9.	 /*21MAY2021*/
    from tabela;
quit;