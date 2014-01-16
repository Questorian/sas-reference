#FJB SAS Notes

##Installation

## General Installation Points
* Do not install under the general Administrator account on Windows - IE (Internet Explorer) and other tools do not work the same and it is bad practice anyway.
* Minimal installation version: 9.3
* Installation source from QNet NAS PACK-DATA: SAS Software Depot

Run setup from network share \\SRV003\SAS and enter following point Order number, and SAS installation key.

## github configuration 

keep these files up to date via github.com:

	git remote add origin git@github.com:Questorian/sas-reference.git
	git push -u origin master


On Windows make sure that HOME variable it pointing to correct directory:

	set home=V:\_data\_config\_homedir

to pickup github global variables.
