*Converts records in SAS to a column in Python dictionary format;
*Converte os registros em SAS para uma coluna no formato de dicionário do Python;

*Cria tabela de exemplo;
data Tabela;
   input ID_Venda ID_Cliente Qtd Valor;
   datalines;
   1 1 1 10.0
   2 1 3 30.0
   3 2 10 100.0
   4 3 2 10.0
   5 3 5 50.0
   6 3 7 80.0
;
run;

*Cria um campo inicial no formato Dicionário e concatena as colunas desejadas;
proc sql;
	create table Tabela1 as
	select 
	ID_Cliente,	
	"'" || compress(put(ID_Venda,10.)) || "':{" ||
	"'ID_Cliente':'" || compress(put(ID_Cliente,10.)) || "'" ||
	",'Qtd':" || compress(put(Qtd,10.)) ||
	",'Valor':" || compress(put(Valor,10.)) ||
	"}" as Dicionario_Python
	from Tabela
	order by ID_Cliente,ID_Venda desc;
quit;

*Concatena os registos em apenas uma linha, agrupando pelo ID_Cliente. Na primeira linha, adiciona { e na última };
DATA Tabela2 ();
	set Tabela1;
	by ID_Cliente;

	ID = _N_;

	length Coluna_Concat $2000.;

	retain Coluna_Concat;

	if first.ID_Cliente then Coluna_Concat = '';
	
	Coluna_Concat =  trim(Dicionario_Python) || "," || Coluna_Concat;

	if last.ID_Cliente then Coluna_Concat = "{" || Coluna_Concat;
	Dicionario = compress(Coluna_Concat) || "}";
run;

*Filtra os registros, deixando apenas a última linha por ID_Cliente, pois essa tem todos os registros concatenados.;
proc sql;
	create table Dicionario as
	select Dicionario
	from Tabela2
	group by ID_Cliente
	having ID=max(ID);
quit;
