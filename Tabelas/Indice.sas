*Referência : https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/sqlproc/p15pjnz1edzj8xn12k6xnqjjy33d.htm;

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

*Excluir índice;
proc sql;
   drop index Campo1 from lib.tabela;
quit;
