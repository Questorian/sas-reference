/* 
	name: script-102.sas
	use : load and rename variables from input spreadsheet into dataset

	date  : 2014-01-09
	author: user42

 */

proc import out=staging1 datafile="data-101.xls"
	dbms=xls replace;
	sheet="sheet1";
	getnames=yes;

	
proc datasets;

	* map input/output variable names here;

	modify staging1;
	rename sexo=sex idade=age peso=weight altura=height;
	rename tensaoMax=MaxBP tensaoMin=MinBP;
quit;


/*
proc transpose;
quit;
*/
