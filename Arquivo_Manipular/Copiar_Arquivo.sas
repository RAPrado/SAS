/***** VARIÁVEIS COM OS CAMINHOS DE ORIGEM E DESTINO  *****/
/***** VARIABLES WITH PATHS OF ORIGIN AND DESTINATION *****/
%let Origem = /sas/Pasta_A;
%let Destino = /sas/Pasta_B;

data _null_;
	/*****  USA O COMANDO CD PARA ACESSAR A PASTA  *****/
    /***** USE THE CD COMMAND TO ACCESS THE FOLDER *****/    
    CALL SYSTEM("cd &Origem.");    

    /*****  USA O COMANDO CP PARA COPIAR O ARQUIVO  *****/
    /*****    USE THE CP COMMAND TO COPY THE FILE   *****/
	CALL SYSTEM("cp '&Origem./Arquivo.txt' &Destino.");	
run;