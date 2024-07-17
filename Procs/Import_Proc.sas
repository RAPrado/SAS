*Reference : https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/proc/n03ji3gyt52p10n1mma27gr6rdxg.htm#n03ji3gyt52p10n1mma27gr6rdxg;

proc import out=arquivo
    datafile="\\servidor\pasta\arquivo.txt"
    dbms=dlm
    replace;	
    getnames=no; /*or yes if file has columns names*/
	  delimiter=";";
    /*informat or format parameters are ignored by SAS 9.2*/
run;
