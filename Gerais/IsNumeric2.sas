*Não funcionando totalmente, precisa de ajustes;
%macro Valida_Numero(conteudo);
	%let tamanho = %length(&conteudo);

	%if &tamanho = 0 %then
	%do;
		%let retorno=%eval(0);
	%end;
	%else
	%do;
		%let retorno=%eval(1);
	%end;
	
	%let caracter = '';
	%let b=%eval(0);
	%put Tamanho da string:&tamanho;

	%do i = 1 %to &tamanho;
		%if &retorno = 1 %then
		%do;
			%let caracter=%substr(&conteudo,&i,1);
			%let b=%eval(%sysfunc(rank(&caracter)));
			%put &i.ºcaracter: &caracter - ascii:&b;

			%if (&b < 48) or (&b > 57) %then 
			%do;
				%let retorno=%eval(0);
			%end;
		%end;
		%else 
		%do; 
			%let i = %eval(&tamanho);
		%end;
	%end;

	&retorno; *Retorna resultado;
%mend;
