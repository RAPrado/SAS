*Referência : https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/proc/n0zs02iixw2lban15cxp9qe1cbok.htm#n0zs02iixw2lban15cxp9qe1cbok;

*Exemplo 1;
proc sort data=Tabela_Origem; /*Tabela de saída terá o mesmo nome*/
   by Coluna1 DESCENDING Coluna2; /*Colunas a serem usadas na ordenação. Coluna 1 será ordenada descendente*/
run;

*Exemplo 2;
proc sort data=Tabela_Origem out=Tabela_Saida;
   by Coluna1 Coluna2; /*Colunas a serem usadas na ordenação*/
run;
