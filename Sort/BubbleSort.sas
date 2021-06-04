/*****  Processo de ordenação usando método do Bubble Sort  *****/
/*****        Sorting process using Bubble Sort method       *****/
*Adaptado de : https://www.studytonight.com/data-structures/bubble-sort;
data _null_;
	%let linhas = 200; /*Definir aqui o número de posições no Vetor/Define here the number of positions in the Vector;*/

	Hora=DATETIME();	
	put 'Hora inicio: ' Hora datetime21.4;

	length x $1000;
	x = '';
	
	/*call streaminit(12);*Define a semente do rand/Sets the rand seed;*/
	array z{&linhas} Col01-Col&linhas;

	do i=1 to &linhas;
	  z{i}=rand("Integer", 1, &linhas);
	end;

	x = catx('|',of z(*)); *6|7|4|9|5|5|6|3|4|2;
	put '       Vetor inicial:' x;

	%let troca = 0;
	%let mudou = 0;

	do j=1 to &linhas;
		do i=1 to &linhas-1;
			if (z{i} > z{i+1}) then
			do;
				troca = z{i+1};
				z{i+1} = z{i};
				z{i} = troca;
				mudou = 1;
			end;
		end;

		if mudou = 0 then leave;

		mudou = 0;
		x= catx('|',of z(*));	
		put 'Linha ' j ' Vetor atual:' x;		
	end;	

	Hora=DATETIME();	
	put 'Hora término: ' Hora datetime21.4;
run;