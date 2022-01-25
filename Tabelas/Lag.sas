/*Pega o valor de um campo, mas da linha anterior ao atual registro na tabela*/

DATA TABELA_FINAL;
  SET TABELA;
  Nova_Coluna=LAG(coluna origem);
RUN;
