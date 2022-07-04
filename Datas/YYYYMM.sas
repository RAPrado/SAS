********** Retorna campo com o ano e mës da uma data, no formato AAAAMM e AAAAMMDD **********;
********** Returns field with year and month of date, in YYYYMM or AAAAMMDD format **********;
proc sql;
    select
    year(datepart(campo_data_hora)) * 100 + month(datepart(campo_data_hora)) as ANO_MES,
    year(date()) * 10000 + month(date())*100 + day(date())  as ANO_MES_DIA
    from tabela;
quit;
