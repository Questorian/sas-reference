/* 
    name  : script-104.sas
    use   : load and rename variables from input spreadsheet into dataset using 'proc sql'

    date  : 2014-01-09
    author: user42
 */



/*
 * import: load raw data from input spreadsheet
 */
proc import 
    datafile = "data-101.xls"
    out      = _data_import1 
    dbms     = xls replace;
    sheet    = "sheet1";
    getnames = yes;
quit;




proc sql;
    CREATE TABLE 
        Sample_Set1 
    AS
    SELECT 
        sexo      AS sex    label='Genders',
        idade     AS age    label='Age',
        peso      AS weight label='Weight',
        altura    AS height label='Height',
        tensaoMax AS maxBP  label='Max Blood Pressure',
        tensaoMin AS minBP  label='Min Blood Pressure'
    FROM 
        _data_import1
    WHERE 
        sex IS NOT NULL

    UNION 
    ALL

    SELECT 
        sexo_1,idade_1,peso_1,altura_1,tensaoMax_1,tensaoMin_1 
    FROM 
        _data_import1
    WHERE 
        sexo_1 IS NOT NULL;


quit;


data  Sample_Set2 (keep=sex age weight);
    label  
        sex = 'subjects Gender'
        age = 'subjects Age'
        weight = 'subjects Weight'
    ;

    set _data_import1;

    if sexo ~= . then do;
        sex = sexo;
        age = idade;
        weight = peso;
        output;

        sex = sexo_1;
        age = idade_1;
        weight = peso;
        output;
    end;

run;


/*
 * clean-up: remove temporary data-staging tables
 */
proc sql;

    DROP TABLE _data_import1;

quit;
