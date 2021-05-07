/***** VARIÁVEIS COM OS CAMINHOS DE ORIGEM E DESTINO  *****/
/***** VARIABLES WITH PATHS OF ORIGIN AND DESTINATION *****/
%let Origem = /sas/Pasta_A;
%let Destino = /sas/Pasta_B;

data _null_;
	/*****  USA O COMANDO CD PARA ACESSAR A PASTA  *****/
    /***** USE THE CD COMMAND TO ACCESS THE FOLDER *****/    
    rc=CALL SYSTEM("cd &Origem.");    

    /*****  USA O COMANDO CP PARA COPIAR O ARQUIVO  *****/
    /*****    USE THE CP COMMAND TO COPY THE FILE   *****/
	rc=CALL SYSTEM("cp 'Arquivo1.* Arquivo2.* ' &Destino.");    

    /***** MUDA PERMISSÕES DOS ARQUIVOS *****/
    /*****    CHANGE FILE PERMISSIONS   *****/    
    x 'chmod 777 /sas/Pasta_B/*';

	if rc = 1 then do;
		put "Problema na cópia dos arquivos."; /*Problem copying the files.*/
		abort;
	end;
	else do;	
		put "Cópia OK."; /*Copy ok*/
	end;
run;
