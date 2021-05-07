/***** VARIÁVEL COM O CAMINHO ONDE ESTÃO OS ARQUIVOS *****/
/*****   VARIABLE WITH THE PATH WHERE THE FILES ARE  *****/
%let Caminho = /sas/Arquivo;

data _null_;
	/*****  USA O COMANDO CD PARA ACESSAR A PASTA  *****/
    /***** USE THE CD COMMAND TO ACCESS THE FOLDER *****/    
    CALL SYSTEM("cd &Caminho.");

    /***** USA O COMANDO MV PARA RENOMEAR *****/
    /*****  USE THE MV COMMAND TO RENAME  *****/
	CALL SYSTEM("mv 'Arquivo_UM.xlsx' Arquivo_Final.xlsx");
	CALL SYSTEM("mv 'Arquivo Espaco.txt' ArquivoSemEspaco.txt");
run;