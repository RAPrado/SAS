*Dentro da macro, algumas funções só funcionam se chamar a função sysfunc;

%let a = %substr(&variavel,&i,1); *Substr funciona sem sysfunc.
%let b = %eval(%sysfunc(rank(a))); *Rank precisa da Sysfunc. Com a Sysfunc, não se usa % nas funções chamadas; A rank não funciona em macro junto com outra função dentro do sysfunc, por isso fiz em duas etapas;
