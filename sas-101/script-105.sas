/*
 * -------------------------------------------------------------------------
 *  script-105.sas - example to load data directly into SAS from script
 * -------------------------------------------------------------------------
 * 
 *  Project: \__UNDEFINED
 *  Updated: 2014-01-22, (Created: 2014-01-22)
 *  Type   : SAS Script
 * -------------------------------------------------------------------------
 *  2014-01-22T19:27:06 - CLI003 - cli003\user42 - 
 * -------------------------------------------------------------------------
 */



/*
 * import: load raw data directly from  SAS script
 */
data _test_direct_load_data;
    input x y z;
    cards;
    1 2 3
    7 8 9
    ;
run;
