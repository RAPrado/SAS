*Referencia  : 
https://communities.sas.com/t5/General-SAS-Programming/What-is-the-difference-between-strip-compress-and-trim/td-p/323286
https://communities.sas.com/t5/SAS-Procedures/SAS8-How-to-remove-special-characters-from-string/td-p/59186;

data _null_;
    length text $15;
    format text $char15.;
    text = '  AB   CºDªE  F   ';
    trim = '*'||trim(text)||'*';         *Remove os espaços em braco a direita;
    compress = '*'||compress(text)||'*'; *Remove todos os espaços em braco;
    limpar = '*'||compress(text,"AÁÀÂÃÄBCÇDEÉÈÊËFGHIÍÌÎÏJKLMNÑOÓÒÕÖPQRSTUÚÙÜVWXYÝZ1234567890 ","k")||'*'; *Manterá apenas os caracteres informados no parâmetro;
    strip = '*'||strip(text)||'*';       *Remove os espaços em braco a esquerda e a direita;
    put trim;
    put compress;
    put limpar;
    put strip;
run;
