#FJB SAS Installation and Deinstallation Notes

##Installation

### General Installation Points
* SAS is installed/removed with the "SAS Deployment Manager" - a standard MS wizard
* The "SAS Software Depot" is the enterprise single point to install SAS within organisation
** contains both source software and license keys
* the product comprises of over 130 modules that need to be installed/removed
* SAS Order number and installation key are read from the data file in the "SAS Software Depot"
* installation/desinstallation is quick if all MS prereqs are already intalled (MDAC, ODBC, ...)
* no size or version is reported in the Windows add/remove programs dialog
* Do not install under the general Administrator account on Windows - IE (Internet Explorer) and other tools do not work the same and it is bad practice anyway.
* however - add the user account to the local administrators just for the installation of SAS for pain free ride
* Minimal installation version: 9.3
* Installation source from QNet NAS PACK-DATA: SAS Software Depot
* SAS 9.3 sends output to HTML by default - text is a better choice when starting-out (Tools/Options/Preferences)




Run setup from network share \\SRV003\SAS and enter following point Order number, and SAS installation key.

Proceed as follows:
* install SAS Foundation and related software
* installed SAS Enterprise Guide in 64-bit Native Mode
* verify that all SAS Foundation Products are selected
* view and confirm that SAS Installation Data File (license) is ok
* English only language (clear all - English is installed in anycase)
* regional settings: en_US
* default SAS file type Assosication: SAS Foundation (in future maybe SAS Enterprise Guide)
* Java Runtime Environment - use recommended
* next - installation takes about twenty minutes - time for coffee (takes about 15 miutes)

Post installation do not forget to remove user account from the administrators group.

###Post Installation Steps
* set default output to text
* change curent folder - to correct working folder
* 

## github configuration 

keep all scripts, documenatation and data files up to date with git and github.com:

	git remote add origin git@github.com:Questorian/sas-reference.git
	git push -u origin master


On Windows make sure that HOME variable it pointing to correct directory:

	set home=V:\_data\_config\_homedir

to pickup github global variables.

##Deinsallation

Caution: Do NOT remove the VJR until all of SAS has been removed first. The VJR must be in place where you have SAS software installed.

Two parts to remove:

* SAS 9.3
* SAS VJR (SAS Versioned JAR Repository - ie java) - remove last

note: if you get the error "Report Fonts for Clients" remove manually with these steps:

1. In Windows Explorer, navigate to your-sas-home\ReportFontsforClients\9.2\_uninstTTFONTS\.
2. In that directory, double-click the UninstTTFONTS.exe file to remove the Report Fonts for Clients application

As a final step delete the SAS directory tree and clean-up registry:

* C:\Program Files\SAS
* C:\Program Files\SASHome
* HKEY_LOCAL_MACHINE\SOFTWARE\SAS Institute Inc.
* HKEY_CURRENT_USER\Software\SAS Institute Inc.


## Disk Space
Space required is approx 6GB for this baby
* disk free before removal: 3.68GB
* disk free after removal: 9.28GB

##Bugs and Issues
###Unable to Scroll in Viewtable
* this link could help: http://support.sas.com/kb/48/790.html

