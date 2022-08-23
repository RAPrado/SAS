*Transforma as linhas em colunas;

*Referência : https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/proc/p03avwj37ggkpkn1mzqzkmwvk1sl.htm;

proc transpose data=Tabela_Origem
	out=Tabela_Saida;
	var Campo_a_virar_coluna;
	by Campo_usado_para_agrupar;
run;
