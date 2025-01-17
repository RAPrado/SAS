*Zip a file
%let Caminho = /Pasta/file.txt;

data _null_;
	CALL SYSTEM("gzip &Caminho");
run;


*Unzip a file;
%let Caminho = /Pasta/file.gz;

data _null_;
	CALL SYSTEM("gunzip &Caminho");
run;
