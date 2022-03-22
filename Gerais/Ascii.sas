*Retorna o código ascii de um caracter / Return ascii code;

*SAS versão/version 9.2;
data teste;   
   x = rank('a');
run;

*SAS versão/version 9.4;
data teste;   
   x = asc('a');
run;
