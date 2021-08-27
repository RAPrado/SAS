/*****  Macro para validar se o conteúdo de uma string é um número  *****/
/*****  Macro to validate that the content of a string is a number  *****/
*Referência: https://www.lexjansen.com/pharmasug/2005/CodersCorner/cc01.pdf;

%macro isnum(str);
	verify(trim(left(&str)),'0123456789')=0 or /*number only*/
	verify(trim(left(&str)),'0123456789.')=0 and
	not indexc(substr(&str,indexc(&str,'.')+1), '.') or /*allow only one '.'*/
	verify(trim(left(&str)),'0123456789.+-')=0 and
	not indexc(substr(&str,indexc(&str,'.')+1), '.') and
	(indexc(&str,'+-')=1 and
	not indexc(substr(&str,2),'+-') and /*allow only one leading '+' or '-'*/
	indexc(&str,'0123456789.') > 1 ) or /* '+-' must followed by number*/
	compress(&str)='' /*'', ' ', or multiple ' ' is numeric*/
%mend; 

/*Usando Data Step*/
data teste;
	Col1=%isnum('a');			*Resultado : 0;
	Col2=%isnum('1');			*Resultado : 1;
	Col3=%isnum('1 ');			*Resultado : 1;
	Col4=%isnum('-1 ');			*Resultado : 1;
	Col5=%isnum('-1');			*Resultado : 1;
	Col6=%isnum('1-');			*Resultado : 0;
	Col7=%isnum('+1 ');			*Resultado : 1;
	Col8=%isnum('+1');			*Resultado : 1;
	Col9=%isnum('1+');			*Resultado : 0;
	Col10=%isnum('1,00');		*Resultado : 0;
	Col11=%isnum('10.00');		*Resultado : 1;
	Col12=%isnum('100,000');	*Resultado : 0;
	Col13=%isnum('100,000.00');	*Resultado : 0;
run;

/*Usando PROC SQL*/
proc sql;
	select %isnum('a') as Col1, 
           %isnum('1') as Col2,
           %isnum('1,00') as Col3,
           %isnum('10.00') as Col4
	from teste;
quit;
