%Let Variavel_A = 'Situação de teste ';

proc sql;
	create table Tabela as
	select campoa1,
	case when campo2 between 1 and 10 then '01. ' || &Frase || '01 a 10' else 
		case when campo2 between 11 and 20 then '02. ' || &Frase || '11 a 20' else 
		  '03. ' || &Frase || ' restantes.'
	end end as Situacao
	from Tabela_B	
quit;
