*Preenche com zero a esquerda, tanto campo texto quanto campo numérico;
*Fills with zero to the left, both text field and numeric field;

proc sql;
  create table teste as
	select
  put(Campo_Numerico,z12.) as Campo1,
  put(input(Campo_Texto,12.),z12.) as Campo2 length=12
	from Tabela1;
quit;
