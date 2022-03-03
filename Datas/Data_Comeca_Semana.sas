*Dado uma data, retorna a data em que começa a semana;
*Given a date, return a date on wich the week begins;

PROC SQL;
	CREATE TABLE TESTE AS
	SELECT Campo_Data-(WEEKDAY(Campo_Data)-1) AS Semana FORMAT=DDMMYY10.
	FROM TABELA;
QUIT;
