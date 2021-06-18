/*****  Processo de ordenação usando método do Quick Sort   *****/
/*****       Sorting process using Quick Sort method  *****/
*Adaptado de : https://www.studytonight.com/data-structures/quick-sort;

*Não está funcionando ainda;

%macro partition(int a[], int beg, int end);
/*
{  
    int left, right, temp, loc, flag;     
    loc = left = beg;  
    right = end;  
    flag = 0;  
    while(flag != 1)  
    {  
        while((a[loc] <= a[right]) && (loc!=right))  
        right--;  
        if(loc==right)  
        flag =1;  
        else if(a[loc]>a[right])  
        {  
            temp = a[loc];  
            a[loc] = a[right];  
            a[right] = temp;  
            loc = right;  
        }  
        if(flag!=1)  
        {  
            while((a[loc] >= a[left]) && (loc!=left))  
            left++;  
            if(loc==left)  
            flag =1;  
            else if(a[loc] < a[left])  
            {  
                temp = a[loc];  
                a[loc] = a[left];  
                a[left] = temp;  
                loc = left;  
            }  
        }  
    }  
    return loc;  
}
*/
%mend;	

%macro quickSort(a,beg,end);
    %let loc=0;
    %if(beg<end) %then
    %do;
        %let loc = partition(a, beg, end);  
        %quickSort(a, beg, loc-1);  
        %quickSort(a, loc+1, end);  
    %end;  

	x = catx('|',of a(*));
	%put 'Vetor :' &x;
%mend;


data _null_;
	%let linhas = 10; /*Definir aqui o número de posições no Vetor/Define here the number of positions in the Vector;*/

	Hora=DATETIME();	
	put 'Hora inicio : ' Hora datetime21.4;

	length x $2000;
	x = '';
		
    call streaminit(12);/*Define a semente do rand/Sets the rand seed;*/
	array z{&linhas} Col01-Col&linhas;

	do i = 1 to &linhas;
	  z{i}=rand("Integer", 1, &linhas);
	end;

	x = catx('|',of z(*)); *6|7|4|9|5|5|6|3|4|2;
	put '       Vetor inicial:' x;

	%quickSort(z{2}, 1, &linhas);  

    x = catx('|',of z(*)); *6|7|4|9|5|5|6|3|4|2;
	put '       Vetor final  :' x;

	Hora=DATETIME();	
	put 'Hora término: ' Hora datetime21.4;
run;