/*
Concatena as linhas em uma coluna

Referência : https://communities.sas.com/t5/Forum-em-portugu%C3%AAs/Concatenar-Linhas/td-p/818078
*/

DATA Tabela2 ();
	set Tabela1;
	by ColunaA;

	length Coluna_Concat $1000.;

	retain Coluna_Concat;

	if first.ColunaA then Coluna_Concat = '';
	else Coluna_Concat =  "," || Coluna_Concat;

	Coluna_Concat =  compress(ColunaB) || Coluna_Concat; /*Se inver a Coluna_Concat pela ColunaB, o SAS dá erro e não concatena, logo a Coluna_Concat deve vir por útlimo*/
run;
