/*
 * -------------------------------------------------------------------------
 *  script-106.sas - example of using the infile statement to import data
 * -------------------------------------------------------------------------
 * 
 *  Project: \__UNDEFINED
 *  Updated: 2014-01-22, (Created: 2014-01-22)
 *  Type   : SAS Script
 * -------------------------------------------------------------------------
 *  2014-01-22T19:56:33 - CLI003 - cli003\user42 - 
 * -------------------------------------------------------------------------
 */

/*
    sample datafile - infile_test.txt:

x y z
1 2 3
4 5 6
7 8 9

*/


/*
 * infile: load data from a text file somewhere on file system
 */
data _test_infile;
    infile  "infile_test.txt"
    LRECL    = 100 
    DLM      = ' ' 
    firstobs = 2;
input
    x y z
;
run;
