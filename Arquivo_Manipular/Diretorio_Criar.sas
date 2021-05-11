/*****      CRIA UM DIRETÓRIO       *****/
/*****      CREATE A DIRECTORY       *****/


/***** VARIÁVEL COM O CAMINHO *****/
/*****   VARIABLE WITH THE PATH  *****/
%let Caminho = /sas/Arquivo;


data _null_;
	CALL SYSTEM("mkdir &Caminho./Diretorio_A");
run;