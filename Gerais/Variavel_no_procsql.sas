********** EXEMPLLO 1 **********;
%Let Variavel_A = 'Situação de teste ';
%put &Variavel_A; *Imprime o conteúdo da variável no log;

proc sql;
	create table Tabela as
	select campoa1,
	case when campo2 between 1 and 10 then '01. ' || &Variavel_A || '01 a 10' else 
		case when campo2 between 11 and 20 then '02. ' || &Variavel_A || '11 a 20' else 
		  '03. ' || &Variavel_A || ' restantes.'
	end end as Situacao
	from Tabela_B	
quit;


********** EXEMPLLO 2 **********;
%Let Variavel_A = 'teste';
%put &Variavel_A; *Imprime o conteúdo da variável no log;

proc sql;
	create table Tabela as
	select campoa1
	from Tabela_B
	where campo2 = "&Variavel_A" /*Variável deve ficar entre ASPAS, pois o campo é string.*/
quit;


********** EXEMPLLO 3 **********;
proc sql;
	select campoB,campoC
	into :par_B,:par_C
	from tabelaA;
quit;

proc sql;
	select campoA
	from tabelaB
	where campoB="&par_B" and campoC="&par_C"; /*A variável de parêmtro tem que ficar entre aspas e não apostrofe*/
quit;
