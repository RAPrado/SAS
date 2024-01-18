*
Comando usado para ler parte de uma string. No exemplo, lê a partir da posição 3 e pega 8 carateres
Comando substr é equivalente ao mid;

proc sql;
	create table teste as
	select substr(campoA,3,8) as Parcial
	from table;
quit;
