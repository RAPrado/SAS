*Traz apenas o primeiro registro para cada valor do CampoA, para isso usa ele no GROUP BY e filtra no HAVING Campo_Data=max(Campo_Data),
o que fará pegar o registro com o maior valor;
proc sql;
	create table Tabela1 as
	select CampoA,Campo_Data
	from lib.tabela
	group by CampoA
	having Campo_Data=max(Campo_Data)
	order by CampoA;
quit;
