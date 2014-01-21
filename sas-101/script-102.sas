/* 
    name: script-102.sas
    use : load and rename variables from input spreadsheet into dataset

    date  : 2014-01-09
    author: user42

 */

/*
 * import: load raw data from input spreadsheet
 */
proc import 
    datafile = "data-101.xls"
    out      = _data_101
    dbms     = xls replace;
    sheet    = "sheet1";
    getnames = yes;
quit;

    
proc datasets;

    * map input/output variable names here;

    modify _data_101;
    rename sexo=sex idade=age peso=weight altura=height;
    rename tensaoMax=MaxBP tensaoMin=MinBP;
quit;

