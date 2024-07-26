*Reference : https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/proc/n03ji3gyt52p10n1mma27gr6rdxg.htm#n03ji3gyt52p10n1mma27gr6rdxg;
*Option 1;
proc import out=Arquivo
    datafile="\\servidor\pasta\arquivo.txt"
    dbms=dlm
    replace;	
    getnames=no; /*or yes if file has columns names*/
    delimiter=";";
run;

*Option 2 - defining layout;
DATA Arquivo;
	LENGTH VAR1 $ 10 VAR2 8;
	DROP Var3; /*delete the column*/ 
 
	format VAR1 $CHAR10. VAR2 BEST6.;	
	informat VAR1 $CHAR10. VAR2 BEST6.;

    INFILE "\\servidor\pasta\arquivo.txt" 
    DLM=';';

	INPUT
         VAR1     : $CHAR10.
         VAR2     : BEST6.
         VAR3     : $CHAR2.;
run;
