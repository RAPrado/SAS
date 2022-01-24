********** Funções diversas com data e hora **********;
********** Miscellaneous functions with data and time **********;
*Origem : https://www.sfu.ca/sasdoc/sashtml/ets/chap3/sect13.htm;



***************************** Funções com Data *****************************;
DATE()
retorna a data de hoje como um valor de data SAS/returns todays date as a SAS date value.

DATEJUL( yyddd )
retorna a data juliana para um valor de data SAS/returns the Julian date for a SAS date value.

JULDATE( date )
retorna a data juliana de um valor de data SAS/returns the Julian date from a SAS date value.

DAY( date )
retorna o dia do mês de um valor de data SAS/returns the day of the month from a SAS date value.

MDY( month, day, year )
retorna um valor de data SAS para valores de mês, dia e ano/returns a SAS date value for month, day, and year values.

MONTH( date )
retorna o mês do ano a partir de um valor de data SAS/returns the month of the year from a SAS date value.

QTR( date )
retorna o trimestre do ano a partir de um valor de data SAS/returns the quarter of the year from a SAS date value.

YYQ( year, quarter )
retorna um valor de data SAS para valores de ano e trimestre/returns a SAS date value for year and quarter values.

TODAY()
retorna a data atual como um valor de data SAS. (TODAY é outro nome para a função DATE.)/returns the current date as a SAS date value. (TODAY is another name for the DATE function.)

WEEKDAY( date )
retorna o dia da semana de um valor de data SAS/returns the day of the week from a SAS date value.

YEAR( date )
retorna o ano de um valor de data SAS/returns the year from a SAS date value.

DATEPART( datetime )
retorna a parte da data de um valor de data e hora do SAS como um valor de data/returns the date part of a SAS datetime value as a date value.


***************************** Funções com Data e hora *****************************;
DATETIME()
retorna a data e hora atuais do dia/returns the current date and time of day.

DHMS( date, hour, minute, second )
retorna um valor de data e hora do SAS para valores de data, hora, minuto e segundo/returns a SAS datetime value for date, hour, minute, and second values.



***************************** Funções com hora *****************************;
HMS( hour, minute, second )
retorna um valor de tempo SAS para valores de hora, minuto e segundo/returns a SAS time value for hour, minute, and second values.

HOUR( datetime )
retorna a hora de um valor de data e hora ou tempo SAS/returns the hour from a SAS datetime or time value.

MINUTE( datetime )
retorna o minuto de um valor de hora ou data e hora SAS/returns the minute from a SAS time or datetime value.

SECOND( date )
retorna o segundo de um valor de hora ou data e hora SAS/returns the second from a SAS time or datetime value.

TIME()
retorna a hora atual do dia/returns the current time of day.

TIMEPART( datetime )
retorna a parte do tempo de um valor de data e hora SAS/returns the time part of a SAS datetime value.

***************************** Cálculos entre datas *****************************;
INTCK( interval, date1, date2 )
retorna o número de limites de intervalos do tipo fornecido que se encontram entre os dois valores de data ou data e hora/returns the number of boundaries of intervals of the given kind that lie between the two date or datetime values.

INTNX( interval, date, n <, 'alignment' > )
ex. INTNX('MONTH',Campo data,qtd de meses a somar)
retorna o valor de data ou data e hora do início do intervalo que é n intervalos do intervalo que contém a data ou valor de data e hora fornecidos. O argumento opcional de alinhamento especifica que a data retornada está alinhada com o início, meio ou fim do intervalo. O começo é o padrão/
returns the date or datetime value of the beginning of the interval that is n intervals from the interval that contains the given date or datetime value. The optional alignment argument specifies that the returned date is aligned to either the beginning, middle, or end of the interval. Beginning is the default.
