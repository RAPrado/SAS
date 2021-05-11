/*****      EXCLUIR UM ARQUIVO       *****/
/*****         DELETE A FILE         *****/


/***** VARIÁVEL COM O CAMINHO ONDE ESTÃO OS ARQUIVOS *****/
/*****   VARIABLE WITH THE PATH WHERE THE FILES ARE  *****/
%let Caminho = /sas/Arquivo;

data _null_;
	/*****  USA O COMANDO CD PARA ACESSAR A PASTA  *****/
    /***** USE THE CD COMMAND TO ACCESS THE FOLDER *****/    
    CALL SYSTEM("cd &Caminho.");

    /***** USA O COMANDO RM PARA DELETAR *****/
    /*****  USE THE RM COMMAND TO DELETE  *****/
	CALL SYSTEM("rm &Caminho./Arquivo_A*.csv");
    CALL SYSTEM("rm &Caminho./Arquivo_B*.*");
run;