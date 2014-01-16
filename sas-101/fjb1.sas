/* 
	name: fjb1.tst
	use : read excel spreadsheet worksheet named 'folha1' into 'work.fjb1'

	date  : 2014-01-09
	author: Farley B

 */

proc import out=work.fjb1 datafile="c:\tmp\sast-fjb1.xls"
	dbms=xls replace;
	sheet="folha1";
	getnames=yes;

	* rename=(sexo=sex);

	run;


