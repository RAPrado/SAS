%Macro Gera_Amostra(num_obs);
  *Essa macro é para gerar amostras de uma tabela, quando se quer filtrar por determinados grupos, e ao invés de fazer
  vários selects, a macro automatiza isso;

	*Lista todos os códigos distintos;
	proc sql;
		create table Tabela_A as
		select monotonic() as ID,Campo_Filtro
		from
		(
			select distinct Campo_Filtro
			from Origem
		) as a
		order by Campo_Filtro;
	quit;

	*Pega o maior ID para fazer paginação, como se fosse Cursor;
	proc sql noprint;		
		select Max(ID)
		into :UltimoID
		from Tabela_A;
	quit;

	*Cria tabela vazia a receber os registos achados;
	proc sql inobs=0;
		create table Amostra as
		select Campo_01, Campo_02,Quantidade
		from Origem;
	quit;

	*Para cada registo na Tabela_A, busca o Campo_Filtro, usando o &I no where, e armazena na variável var_cursor,
	e depois usa essa variável no where do segundo select, para trazer os registros desejados;
	%Do I=1 %To &UltimoID;
		Proc SQL noprint;
			select Campo_Filtro length=8
			into :var_cursor
			from Tabela_A
			where ID = &I;

			create table Registros as
			select Campo_01, Campo_02,Quantidade
			from Origem(obs=&num_obs)
			where
			Campo_Filtro = "&var_cursor"
			order by Quantidade Desc;

			insert into Amostra
			(Campo_01, Campo_02,Quantidade)
			select Campo_01,Campo_02,Quantidade
			from Registros;
		
            %let linhas=&sqlobs;
		Quit;

		%put Registro:&I;
	%End;

	proc sql;
		drop table Registros;
		drop table Tabela_A;
	quit;
%MEnd;

%Gera_Amostra(1000);
