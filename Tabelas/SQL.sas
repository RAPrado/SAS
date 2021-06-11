/***** Exemplo de Proc SQL formatando a coluna ******/
/***** Proc SQL example formatting the column ******/
proc sql;
    create table teste as
    select campo_A as Campo_Formatado
         length = 12 
         format = $ASFNUM.
         informat = $12.
         label = 'Campo A'
    from work.tabela;
quit;