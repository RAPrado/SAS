*Referência : https://communities.sas.com/t5/SAS-Procedures/Regex-prxparse-question-validating-emails/td-p/257090;

proc sql;
	create table Email_Invalida as
	select email
	from tabela
	where not prxmatch('/[a-z0-9!#\$%&''*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#\$%&''*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/i',email);
quit;
