***************************************************************************
Exemplo 1
Pega o valor de um campo, mas da linha anterior ao atual registro na tabela
****************************************************************************;

DATA Tabela2;
  SET Tabela1;
  Nova_Coluna=LAG(coluna origem);
RUN;

***************************************************************************
Exemplo 2
Além do comando Lag, usa o Retain, para reter o valor da várivel e poder 
usar na próxima linha.
****************************************************************************;
data Tabela1;
	set Tabela2;
	by CampoA CampoB;

	retain Fim;
	
	Lag_Data_Processamento=lag(Data_Processamento);
	FORMAT Lag_Data_Processamento DDMMYY10.;

	if first.CampoB then
	do;
		Filtro=1;
		Fim=0;
	end;
	else
	do;
		if Fim ne 1 then
		do;
			if Lag_Data_Processamento eq Data_Processamento then
			do;
				Filtro=1;
			end;
			else
			do;
				Filtro=0;
				Fim=1;
			end;
		end;
		else
		do;
			Filtro=0;
		end;
	end;
run;

data Tabela3;
	set Tabela2;
	where Filtro eq 1;/*Filtra os casos marcados acima*/
run;
