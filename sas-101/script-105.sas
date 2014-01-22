/*
 * -------------------------------------------------------------------------
 *  script-105.sas - example to load data inline into SAS from script
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
 * import: load inline raw data directly from  SAS script
 */
data new_patients;
    input 
        id age height weight;
    * cards/datalines - are keywords and they are synonyms (from punched cards) ;
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



