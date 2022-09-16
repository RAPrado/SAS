%macro Acento_Remove(Conteudo);
	tranwrd(tranwrd(tranwrd(tranwrd(tranwrd(tranwrd(tranwrd(tranwrd(tranwrd(tranwrd(tranwrd(tranwrd(tranwrd(
	tranwrd(tranwrd(tranwrd(tranwrd(tranwrd(tranwrd(tranwrd(tranwrd(tranwrd(tranwrd(
		upcase(&Conteudo)
	,'Á','A')
	,'À','A')
	,'Â','A')
	,'Ã','A')
	,'Ä','A')

	,'Ç','C')

	,'É','E')
	,'È','E')
	,'Ê','E')
	,'Ë','E')

	,'Í','I')
	,'Ì','I')
	,'Î','I')
	,'Ï','I')

	,'Ñ','N')

	,'Ó','O')
	,'Ò','O')
	,'Õ','O')
	,'Ö','O')

	,'Ú','U')
	,'Ù','U')
	,'Ü','U')

	,'Ý','Y')

    as &Conteudo.sec
%mend;

data teste;
	campo='aÁÀÂÃÄÇéíñóúý';
run;


proc sql;
create table teste1 as
select
	campo,
  	%Acento_Remove(campo) as campo_trat
	
	/*%Acento_Remove(a.campo) as campo_trat1*/ /*Não funciona se passar a. no parametro*/
	/*coalesce(%Acento_Remove(campo),'null') as campo_trat2*/ /*Não funciona se chamar outra função antes da macro*/
from teste as a;
quit;
