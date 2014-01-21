/* 
	name: fjb2.sas
	use : load and rename variables from input spreadsheet into dataset

	date  : 2014-01-09
	author: Farley B

 */

proc import out=temp1 datafile="c:\tmp\sast-fjb1.xls"
	dbms=xls replace;
	sheet="folha1";
	getnames=yes;

	/*
proc datasets;

	* map input/output variable names here;

	modify fjb1;
	rename sexo=sex idade=age peso=weight altura=height;
	rename tensaoMax=MaxBP tensaoMin=MinBP;
quit;

*/

proc sql;
	CREATE TABLE joana AS
	SELECT 
	sexo   AS sex label='Genders',
	idade  AS age label='Age',
	peso   AS weight label='Weight',
	altura AS height label='Height',
	tensaoMax AS maxBP label='Max Blood Pressure',
	tensaoMin AS minBP label='Min Blood Pressure'
	FROM temp1
	WHERE sex IS NOT NULL

	UNION ALL

	SELECT sexo_1,idade_1,peso_1,altura_1,tensaoMax_1,tensaoMin_1 
	FROM temp1
	WHERE sexo_1 IS NOT NULL;

	DROP TABLE temp1;
quit;


data magda (keep=sex age weight);
	label  
		sex = 'Genders'
		age = 'Age'
	;

	set temp1;

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

* proc transpose;


