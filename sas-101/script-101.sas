/* 
    name: script-101.sas
    use : read excel spreadsheet worksheet named 'data-101.xls' into 'work.fjb1'

    date  : 2014-01-09
    author: user42

    notes: 
    * Tools / Options / Change current folder to 'sas-101' to find data XLS
    * add working directory to your explorer "favorites"

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
