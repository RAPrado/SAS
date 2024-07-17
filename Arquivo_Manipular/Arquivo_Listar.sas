****************************************************
    1-Example in Linux to list file or directory
****************************************************;
filename DIRLIST pipe 'ls "/PastaA/PastaB"';
data Diretorio ;
    length buffer $256 ;

    infile dirlist length=reclen ;

    input buffer $varying256. reclen ;
run;


****************************************************
    2-Example in Windows to list file or directory
****************************************************;
*Reference: https://communities.sas.com/t5/SAS-Programming/How-to-List-all-the-files-in-a-folder/td-p/674065;

*List all files;
data filenames;
	length fref $8 fname $200;
	did = filename(fref,'\\servidor\pasta\');

	did = dopen(fref);

	do i = 1 to dnum(did);
	  fname = dread(did,i);
	  output;
	end;

	did = dclose(did);
	did = filename(fref);

	keep fname;	
run;

*Filtering files;
proc sql;
	create table Importar as
	select upcase(fname) as Arquivo
	from filenames	
	where
	calculated Arquivo like 'FILE1_%.TXT' or
	calculated Arquivo like 'FILE2_%.TXT';

	drop table filenames;
run;
