/* 
	name: script-103.sas
	use : Calculate the BMI for each case - to a new dataset BMIdata

	notes:
	* function to calculate the BMI and create a new variable called BMI
	* uses the staging1 data as input
	* sends output to a new table called BMIData
	

	date  : 2014-01-09
	author: user42
 */


data BMIdata;
	set staging1;

	* calculate BMI from the standard formula;
	BMI = weight / (height * height);
run;



