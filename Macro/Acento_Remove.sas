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
from teste;
quit;
