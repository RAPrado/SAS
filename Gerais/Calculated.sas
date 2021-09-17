/*****  Usar uma coluna criada na consulta no where  *****/
/***** Use a column created in the query in the where *****/
proc sql number;
    select ID, salario, salario*1.15 as novo_salario,
    calculated novo_salario*0.1 as taxa
    from libname.tabela
    where calculated taxa > 1000;
quit;
