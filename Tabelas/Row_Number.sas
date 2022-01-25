/*Refência : https://sasexamplecode.com/how-to-add-row-numbers-in-sas/ */

/*ROW NUMBER usando data step*/
data work.tabela_final;
	set work.tabela;

	ID = _N_;
run;
 
 
/*ROW NUMBER usando proc sql*/
proc sql;
	create table work.tabela_final as
	select *,
	monotonic() as ID
	from work.tabela;
quit;
