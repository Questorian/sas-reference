/* 
	name: script-101.sas
	use : read excel spreadsheet worksheet named 'data-101.xls' into 'work.fjb1'

	date  : 2014-01-09
	author: user42

	notes: 
	* Tools / Options / Change current folder to 'sas-101' to find data XLS

 */

proc import out=work.fjb1 datafile="data-101.xls"
	dbms=xls replace;
	sheet="sheet1";
	getnames=yes;

	* rename=(sexo=sex);

	run;


