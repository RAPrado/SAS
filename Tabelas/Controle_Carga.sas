/***** Apagar os registos superiores à ultima data processada, para evitar duplicidade na reexecução ******/
/***** Delete the records higher than the last processed date, to avoid duplication in the re-execution *****/
proc sql;
	delete * from tabela
	where dt_processamento > &Ultima_Data.;
	
	%let linhas=&sqlobs; *Linhas afetadas;
quit;

*Só recria a tabela se houve exclusão/Only recreates the table if there was an exclusion;
%if &linhas > 0 %then
%do;
	%put 'Recriou tabela';

	/* Recria a tabela para liberar o espaço dos registros excluídos */
    /* Recreates the table to free space for deleted records */
	data tabela
		set tabela;
	run;
%end;
%else
%do;
	%put 'Não Recriou tabela';
%end;

%put "Linhas excluidas :&linhas";