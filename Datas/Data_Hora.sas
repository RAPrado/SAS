********** Retorna a data e hora corrente em vários formatos **********;
********** Returns the current date and time in various formats **********;
*Adaptação de : https://documentation.sas.com/doc/en/vdmmlcdc/1.0/leforinforref/n0av4h8lmnktm4n1i33et4wyz5yy.htm;

data _null_;
	Inicio=DATETIME();
	Data_Hora= INPUT(PUT(DATE(),date9.)|| ':00:00:00',DATETIME19.); *Adiciona hora a uma data;
	
	put Inicio datetime.;	*26MAY21:10:21:29;
	put Inicio datetime7.;	*26MAY21;
	put Inicio datetime12.;	*26MAY21:10;
	put Inicio datetime18.;	*26MAY21:10:21:29;
	put Inicio datetime18.1;*26MAY21:10:21:29.3;
	put Inicio datetime19.;	*26MAY2021:10:21:29;
	put Inicio datetime20.1;*26MAY2021:10:21:29.3;
	put Inicio datetime21.2;*26MAY2021:10:21:29.27;
	put Inicio datetime21.3;*26MAY2021:10:21:29.271;

	put Inicio datetime19.;*26MAY2021:14:28:37;
run;
