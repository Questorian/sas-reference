/*
 * FJB SAS Template
 */


/* libname */

libname <new libname> "<filesystem path to folder to contain new lib with trailing slash>";

/* 
    sample - libname

libname MyStuff "C:\tmp\SAS\";

*/



/***********************************************/
/*******           data INPUT            *******/
/***********************************************/
/* loading data directly into SAS with the data statement */
data <SAS target data set name>;
    input <space separated variable names for each row>;
    * cards is a keyword - beware! ;
    cards;
    <row1 data, space separated values, ...>
    <row2 data, space separated values, ...>
    ;
run;

/*
    sample - data input

data _test_direct_load_data;
    input x y z;
    cards;
    1 2 3
    7 8 9
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
    datafile = "<filesystem path to Excel spreadsheet, including .xls extension"
    out      = <library.table data set name within SAS>
    dbms     = xls replace;
    * proc options (each with own semicolon) ... ;
    sheet    = "<EXCEL worksheet name - normaly sheet1 in en_US language>";
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
variable            column - equivalent to a SQL column name
data set            SAS target table for holding data. Underscores valid, hyphese are not for naming

*/
