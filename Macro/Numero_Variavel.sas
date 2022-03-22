Dentro de macro, para gravar um número em variável, precisa usar %eval ou %SYSEVALF, do contrário gravará como texto e não fará cálculos;
%let inteiro=%eval(10+20); /*Inteiro/Interger*/
%put 'inteiro:' &inteiro;

%let decimal=%SYSEVALF (10.1+20.2); /*Decimal/Float*/
%put 'decimal:' &decimal;
