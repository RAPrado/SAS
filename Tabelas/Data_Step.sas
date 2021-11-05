*Exemplo 1;
data Tabela;
   x='December';
   y=10;
run;

*Exemplo 2;
data Tabela;
   *infile datalines delimiter=',';  *Descomentar essa linha se quiser delimitador entre as colunas;
   input Nome $ Sexo $ Idade Altura Peso;
   datalines;
   Augusto M 21 1.80 80.3
   Aparecida F 32 1.65 52.0
   Bruna F 45 1.55 70.2
   Raul M 41 1.72 66.3
   Thiago M 32 1.90 99.0
   Janaína F 55 1.65 56.5
;
run;
