/*****  Processo de ordenação usando método do Insert Sort   *****/
/*****       Sorting process using Insert Sort method  *****/
*Adaptado de : https://www.studytonight.com/data-structures/bubble-sort;
data _null_;
	%let linhas = 300; /*Definir aqui o número de posições no Vetor/Define here the number of positions in the Vector;*/

	Hora=DATETIME();	
	put 'Hora inicio : ' Hora datetime21.4;

	length x $2000;
	x = '';
		
    *call streaminit(12);/*Define a semente do rand/Sets the rand seed;*/
	array z{&linhas} Col01-Col&linhas;

	do i=1 to &linhas;
	  z{i}=rand("Integer", 1, &linhas);
	end;

	x = catx('|',of z(*)); *6|7|4|9|5|5|6|3|4|2;
	put '       Vetor inicial:' x;

	%let troca = 0;

	do j=2 to &linhas;
		i=j;
		do while (i > 1);
			if (z{i-1} > z{i}) then
			do;
				troca = z{i};
				z{i} = z{i-1};
				z{i-1} = troca;
				*Exibe as mudanças feitas ao longo do loop/Shows the changes during the loop;
				/*x= catx('|',of z(*));
				put 'Linha ' j ' Vetor atual:' x;		
				*/
			end;
			i=i-1;
		end;
	end;	

    x = catx('|',of z(*)); *6|7|4|9|5|5|6|3|4|2;
	put '       Vetor final  :' x;

	Hora=DATETIME();	
	put 'Hora término: ' Hora datetime21.4;
run;