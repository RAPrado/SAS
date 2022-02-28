*Índice simples;
proc sql;
	create index campo1
	on lib.tabela(campo1);
quit;

*Índice composto;
proc sql;
   create index campos
   on lib.tabela(campo1,campo2);
quit;

*Índice único;
proc sql;
   create unique index Campo1
   on lib.tabela(campo1);
quit;
