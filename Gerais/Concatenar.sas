/*****  Concatenar valores ou colunas  *****/
/*****  Concatenate values ​​or columns  *****/
*Adaptado de  : https://communities.sas.com/t5/SAS-Communities-Library/How-to-concatenate-values-in-SAS/ta-p/494125;

data Teste(keep=Campo1 Campo2 Campo3 Campo4 Campo5);
	set sashelp.class;
	Campo1 = name || ', Age: ' || age; /*Usa || para concatenar, porém deixa espaço em branco nos campos/Uses || to concatenate, but leave blank space in the fields.*/

	Campo2 = cats(name, ', Age:',age);/*Usa função Cats para concatenar, e limpa espaço em branco/Uses Cats function to concatenate, and clears white space */
	Campo3 = cats(name, ', Age:',of name--weight);/*Passa sequência de colunas para concatenar/Pass columns to concatenate*/

	Campo4 = catx(',',name,age);/*Usa função Catx para concatenar e acrescenta caracter como separador, e limpa espaço em branco/Uses Catx function to concatenate and add character as separator, and clears white space */
	Campo5 = catx(',',of name--weight);/*Passa sequência de colunas para concatenar/Pass columns to concatenate*/
run;