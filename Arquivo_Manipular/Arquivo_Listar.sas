/******  Lista Arquivo ou Diretorio *******/
/*******   List File or Directory   *******/
filename DIRLIST pipe 'ls "/PastaA/PastaB"';
data Diretorio ;
    length buffer $256 ;

    infile dirlist length=reclen ;

    input buffer $varying256. reclen ;
run;