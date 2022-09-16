*Referênia : https://communities.sas.com/t5/SAS-Enterprise-Guide/call-a-macro-inside-a-proc-sql/td-p/403929;

%macro changecharac (value=);
  translate(&value,'eea','éèà') as &value.sec
%mend;

data teste;
  field1=1;
  field2='abc';
  field3='éèà';
run;

proc sql;
  create table teste as
  select
    field1,
    field2,
    %changecharac(value=field3)
  from teste;
quit;
