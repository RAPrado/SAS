/*
Exemplo de "cursor"
"Cursor" example
Outro exemplo : https://communities.sas.com/t5/SAS-Procedures/Proc-SQL/td-p/13466?nobounce
*/

%Macro Cursor ();
	*Lista registros da base a serem cruzados;
	proc sql;
		create table Tabela_B as
		select Campo_A,monotonic() as ID		
		from Tabela_A
		where Campo_B is not missing;
	quit;

	*Pega o maior ID para fazer paginação, como se fosse Cursor;
	proc sql noprint;		
		select Max(ID)
		into :UltimoID
		from Tabela_B;
	quit;

	*Cria tabela vazia a receber os registos achados;
	proc sql inobs=0;
		create table Alterar as
		select Campo_A,Campo_B
		from Tabela_A;
	quit;

	*Para cada registo na Tabela_A, verifica nos registros, no campo Campo_C
	se é feito referência ao Campo_A destes;
	%Do I=1 %To &UltimoID;
		Proc SQL noprint;
			select cats('%',compress(put(input(Campo_A,15.),15.)),'%') length=17 /*Concatena com % pois usará like*/
			into :var_Workflow
			from Tabela_B
			where ID = &I;

			insert into Alterar
			(Campo_A,Campo_B)
			select Campo_A,Campo_B
			from Tabela_A
			where
			Campo_C like "&var_Workflow"
			and Campo_B is missing;
			
            %let linhas=&sqlobs;
		Quit;

		%put Registro:&I;
	%End;
%MEnd;

%Cursor();
