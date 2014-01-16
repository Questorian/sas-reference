/* 
	name: fjb3.sas
	use : Calculate the BMI for each case - to a new dataset BMIdata

	date  : 2014-01-09
	author: Farley B

 */


data BMIdata;
	set fjb1;

	* calculate BMI from the standard formula;
	BMI = weight / (height * height);
run;



