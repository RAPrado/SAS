********** Retorna campo com o ano e mës da uma data, no formato AAAAMM **********;
********** Returns field with year and month of date, in YYYYMM format **********;
proc sql;
    select
    year(datepart(campo_data)) * 100 + month(datepart(campo_data)) as ANO_MES
    from tabela;
quit;