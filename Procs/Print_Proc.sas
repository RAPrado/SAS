/***** Exibe o conteúdo da tabela em forma de relatório *****/
/***** Displays the contents of the table in the form of a report *****/

proc print data=libname.tabela;
    var Coluna_A Coluna_B;  /* Colunas a serem exibidas, parâmetro opcional, se ocultar, exibirá todas as colunas */
                            /*  Columns to be displayed, optional parameter, if hidden, will display all columns  */
run;