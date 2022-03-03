*** Update usando join / Update using join ***;
*Referencia : https://communities.sas.com/t5/SAS-Procedures/update-statement-inside-a-proc-sql/td-p/47964;

*Método 1;
PROC SQL;
	UPDATE LIBNAME.TABELA_A SET
	CAMPO_A='fixo'
	WHERE EXISTS (SELECT CAMPO_A FROM TABELA_B WHERE ID=TABELA_A.ID);

	%let linhas=&sqlobs;
QUIT;

*Método 2;
PROC SQL;
	UPDATE LIBNAME.TABELA_A TABELA_B
	SET CAMPO_A = (select CAMPO_A FROM TABELA_B WHERE TABELA_B.ID = TABELA_A.ID),
	CAMPO_B = (select CAMPO_B FROM TABELA_B WHERE TABELA_B.ID = TABELA_A.ID),
	CAMPO_C = (select CAMPO_C FROM TABELA_B	WHERE TABELA_B.ID = TABELA_A.ID),
	CAMPO_D=DATETIME()

	WHERE ID IN (SELECT ID FROM TABELA_B);
QUIT;
