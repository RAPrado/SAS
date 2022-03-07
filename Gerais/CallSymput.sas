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
