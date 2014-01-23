/*
 * FJB SAS Template
 */

/*
 * simplest possible SAS program
 */
data main;
    x = 1;
run;

* note: we force 'proc print' to use the 'main' data set;
* this is a useful trick for testing lots of data sets at once;
proc print data=main;
quit;



/* libname */
libname 
    <new libname>   "<filesystem path to folder to contain new lib with trailing slash>";

/* 
    sample - libname

libname 
    MyStuff     "C:\tmp\SAS\";

*/



/***********************************************/
/*******           proc SQL              *******/
/***********************************************/
* SQL statements have semicolon after the proc statement;
* SQL proc options go before the semicolon (if any required);
* UNION ALL - is a good trick for reading "doubled-up" data;
* SQL statements end with a quit, and not a 'run'
* there can be many SQL statements in the 'proc sql' call, separated by semicolons;
* use DROP TABLE <libref.data set name> to remove data sets if required;
proc sql;

    CREATE TABLE 
        <tablename - SAS data set name>
    AS

    SELECT
        <var AS newvar label='label text for this variable'>,
    FROM
        <SAS data set>
    WHERE
        <WHERE clause if required>
    ;

quit;
 

proc sql;

    CREATE TABLE 
        <tablename - SAS data set name>
    AS

    SELECT
        <var AS newvar label='label text for this variable'>,
    FROM
        <SAS data set>
    WHERE
        <WHERE clause if required>

    UNION ALL

    SELECT
        <var AS newvar label='label text for this variable'>,
    FROM
        <SAS data set>
    WHERE
        <WHERE clause if required>;
        

quit;

proc sql;

    DROP TABLE <data set name1>;
    DROP TABLE <data set name2>;

quit;


/***********************************************/
/*******           data INPUT            *******/
/***********************************************/
/* loading data inline into SAS with the DATA INPUT statement */
data <SAS target data set name>;
    input 
        <space separated variable names for each row>;
    * cards/datalines - are keywords and they are synonyms (from punched cards) ;
    cards;
    <row1 data, space separated values, ...>
    <row2 data, space separated values, ...>
    ;
run;

/*
    sample - data input

data new_patients;
    input 
        id age height weight;
    cards;
    1 45 1.60 99
    2 44 1.70 89
    3 37 1.67 92
    4 54 1.54 78
    5 23 1.74 72
    6 34 1.82 76
    7 66 1.84 74
    ;
run;


*/



/***********************************************/
/*******           data INFILE           *******/
/***********************************************/

/* text file with or without delimeters */
data <SAS target data set name>;
    infile   "<input data file path including file extension>"
    LRECL    = <a logical lenght of your data to encompass ENTIRE data record - ie row length> 
    DLM      = ',' 
    firstobs = <line no of first data item - 1 if no header, 2 if single line header row, ...>;
input
    <variable names here>
;
run;

/* 
    sample - data infile: infile_test.txt:

x y z
1 2 3
4 5 6
7 8 9


    and sample usage:

data _test_infile;
    infile  "infile_test.txt"
    LRECL    = 100 
    DLM      = ' ' 
    firstobs = 2;
input
    x y z
;
run;

*/



/***********************************************/
/*******           proc import           *******/
/***********************************************/

/* Excel file type */
proc import
    datafile = "<filesystem path to Excel spreadsheet, including .xls extension>"
    out      = <library.table data set name within SAS>
    dbms     = xls replace;
    * proc options (each with own semicolon) ... ;
    sheet    = "<EXCEL worksheet name - normaly Sheet1 in en_US language>";
    getnames = <yes|no -- pull-in first row XLS column names and map to SAS variable names?>;
    mixed    = <yes|no -- refers to datatypes being loaded - are they numeric and character?>;
    scantime = <yes|no -- read in time formated data as long as variable not date format?>;
run;

/*
    sample - proc import

proc import
    datafile = "data-101.xls"
    out      = _data_101
    dbms     = xls replace;
    sheet    = "sheet1";
    getnames = yes;
run;
*/



/*
 SAS Lexicon
 ===========

observations        rows - each row is an observation in SAS
variable            column - equivalent to a SQL column name (8 characters max - use labels for more)
data set            SAS target table for holding data. Underscores valid, hyphese are not for naming
labels              SAS extended variable data and descriptions. Probably because vars are too short

*/
