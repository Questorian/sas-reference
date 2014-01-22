/*
 * FJB SAS Template
 */


/* BOILERPLATE: libname */

libname <new libname> "<filesystem path to folder to contain new lib with trailing slash>";

/* 
    libname FJB "C:\tmp\SAS\";
*/



/***********************************************/
/*******             data                *******/
/***********************************************/
/* loading data directly into SAS with the data statement */
data <SAS data set name to store the loaded data into>;
    input <space separated variable names for each row>;
    cards;
    <row1 data, space separated values, ...>
    <row2 data, space separated values, ...>
    ;
run;



/***********************************************/
/*******           infile                *******/
/***********************************************/

/* text file with or without delimeters */
data <SAS data set name>;
    infile   "<input data file path including file extension>"
    LRECL    = <a logical lenght of your data to encompass ENTIRE data record - ie row length> 
    DLM      = ',' 
    firstobs = <line no of first data item - 1 if no header, 2 if single line header row, ...>;
input
    <variable names here>
;
run;

/* 
    sample datafile - infile_test.txt:

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
    * proc options ... ;
    sheet    = "<EXCEL worksheet name - normaly sheet1 in en_US language>";
    getnames = <yes|no -- pull-in first row XLS column names and map to SAS variable names?>;
run;

/*
    proc import
        datafile = "data-101.xls"
        out      = _data_101
        dbms     = xls replace;
        sheet    = "sheet1";
        getnames = yes;
    run;
*/



/*
 SAS-Talk
 ========

observations        rows - each row is an observation in SAS
variable            column - equivalent to a SQL column name


*/
