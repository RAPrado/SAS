*call symput usado para gravar um valor em uma variável, e depois usar fora de um data step ou macro;
*Exemplo 1
Referencia : https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/mcrolref/p09y28i2d1kn8qn1p1icxchz37p3.htm;

data x;
   x='December';
   call symput('var',x);
proc print;
title "Report for &var";
run;


**Exemplo 2
Referência : https://communities.sas.com/t5/SAS-Procedures/Proc-SQL/td-p/13466?nobounce;

%Macro Export(Status=);
	Proc SQL;
		Create Table StatusFound as
		Select *
		From Inventory.Status
		Where Status = "&Status";
	Quit;

	*Check to see if any updates needed;
	%Let DSid = %sysfunc(open(StatusFound));
	%Let Num = %sysfunc(attrn(&DSid, nobs));
	%Let RC = %sysfunc(close(&DSid));
	%If &Num = 0 %Then %Goto NoExport;

	*Assign Row Numbers;
	Data StatusFound;
		Set StatusFound;
		N = _N_;
	Run;

	*Create "fake" cursor;
	Data StatusFound;
		Set StatusFound;
		By N;
		If Last.N Then Call Symput("LastN", N);
	Run;

	Data StatusFound;
		Set StatusFound;
		%Do I=1 %To &LastN;
			If N=&I Then Do;
			Call Symput("RecorderID_&I", RecorderID);
			Call Symput("Location_&I", Location);
			Call Symput("Sheet_&I", SheetName);
			End;
		%End;
	Run;

	%Do I=1 %To &LastN;
		*Export new data;
		%ExportExcel(&&&RecorderID_&I, &&&Location_&I, &&&Sheet_&I);

		*Update status Table;
		Proc SQL;
			Update Table Inventory.Status as S
			Set LastUpdateDate = (Select Max(Date) 
                                  From Inventory.Data as D Where S.RecorderID = D.RecorderID)
			Where RecorderID = "&&&RecorderID_&I";
		Quit;
	%End;
	%NoExport:
%Mend;
