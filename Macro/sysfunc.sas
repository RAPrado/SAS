*Dentro da macro, algumas funções só funcionam se chamar a função sysfunc;

%let a = %eval(%sysfunc(rank(substr(&variavel,&i,1)))); *Rank precisa da Sysfunc. Com a Sysfunc, não se usa % nas funções chamadas;
%let b = %substr(&variavel,&i,1); *Substr funciona sem sysfunc, porém no exemplo acima, com está usando a Rank, dentro de um sysfunc, então a Substr deve estar sem % na frente;
