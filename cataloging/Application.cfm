<cfapplication
	name = "Cataloging"
	searchimplicitscopes="true"
>
<cfparam name="prt" default="0">
<cfparam name="pageTitle" default="">
<!---	Changed filePath to support navlinks after migrating from lis51 to lis02
		Made generic, using CF directory & path functions, instead of hardcoding
		2006-04-05 akohler
<cfset filePath = "F:\inetpub\wwwroot\cataloging\">
--->
<!---   Set the Data Source Name for the Reference Database Collection 
        9/11/06 rv
--->
<cfset DSN = "catReference">

<cfset filePath = GetDirectoryFromPath(ExpandPath("\cataloging\"))>
<cfset currentPath = CGI.SCRIPT_NAME>

<cfscript> 
ipLogFile = filepath & 'pot\visitors.txt';
</cfscript>

<cfscript>
	if (Find("/authority/", currentPath)) {
		sectionTitle = "Authority/Database Maintenance";
		navConfigFile = filePath & 'authority\navConfig.txt';
	}
	else if (Find("/drm/", currentPath)) {
		sectionTitle = "Digital Resources Metadata";
		navConfigFile = filePath & 'drm\navConfig.txt';
	}
	else if (Find("/forms/", currentPath)) {
		sectionTitle = "Forms";
		navConfigFile = filePath & 'forms\navConfig.txt';
	}

	else if (Find("/copyprocedures/", currentPath)) {
		sectionTitle = "Copy Cataloging Procedures for Monographs";
		navConfigFile = filePath & 'copy\copyprocedures\navConfig.txt';
	}
	else if (Find("/copytools/", currentPath)) {
		sectionTitle = "Copy Cataloging Tools";
		navConfigFile = filePath & 'copy\copytools\navConfig.txt';
	}
	
	else if (Find("/copy/", currentPath)) {
		sectionTitle = "Copy Cataloging";
		navConfigFile = filePath & 'copy\navConfig.txt';
	}
	
	else if (Find("/keycontacts/", currentPath)) {
		sectionTitle = "Key Contacts";
		navConfigFile = filePath & 'keycontacts\navConfig.txt';
	}
	else if (Find("/minutes/", currentPath)) {
		sectionTitle = "Minutes";
		navConfigFile = filePath & 'minutes\navConfig.txt';
	}
	else if (Find("/monograph/", currentPath)) {
		sectionTitle = "Monographic Cataloging";
		navConfigFile = filePath & 'monograph\navConfig.txt';
	}
	else if (Find("/physical/", currentPath)) {
		sectionTitle = "Physical Processing";
		navConfigFile = filePath & 'physical\navConfig.txt';
	}
	else if (Find("/policies/", currentPath)) {
		sectionTitle = "Policies and Procedures";
		navConfigFile = filePath & 'policies\navConfig.txt';
	}
	else if (Find("/refauthresources/", currentPath)) {
		sectionTitle = "Authority Resources";
		navConfigFile = filePath & 'refshelf\refauthresources\navConfig.txt';
	}
	
	else if (Find("/refcattools/", currentPath)) {
		sectionTitle = "Cataloging Tools and Aids";
		navConfigFile = filePath & 'refshelf\refcattools\navConfig.txt';
	}

	else if (Find("/refcollection/", currentPath)) {
		sectionTitle = "Cataloging & Metadata Center Reference Resources";
		navConfigFile = filePath & 'refshelf\refcollection\navConfig.txt';
	}

	
	else if (Find("/referesourcescat/", currentPath)) {
		sectionTitle = "Electronic Resources Cataloging";
		navConfigFile = filePath & 'refshelf\referesourcescat\navConfig.txt';
	}
	
	else if (Find("/refpublications/", currentPath)) {
		sectionTitle = "Publications, Lists, etc.";
		navConfigFile = filePath & 'refshelf\refpublications\navConfig.txt';
	}
	
	else if (Find("/refgeographic/", currentPath)) {
		sectionTitle = "Geographic Resources";
		navConfigFile = filePath & 'refshelf\refgeographic\navConfig.txt';
	}
	
	else if (Find("/refgovdocs/", currentPath)) {
		sectionTitle = "Government Documents";
		navConfigFile = filePath & 'refshelf\refgovdocs\navConfig.txt';
	}
	
	else if (Find("/reflanguages/", currentPath)) {
		sectionTitle = "Language Resources";
		navConfigFile = filePath & 'refshelf\reflanguages\navConfig.txt';
	}
	
	else if (Find("/reflibraries/", currentPath)) {
		sectionTitle = "Libraries, Library Systems, Utilities";
		navConfigFile = filePath & 'refshelf\reflibraries\navConfig.txt';
	}
	
	else if (Find("/reforganizations/", currentPath)) {
		sectionTitle = "Library and Professional Organizations";
		navConfigFile = filePath & 'refshelf\reforganizations\navConfig.txt';
	}
	
	else if (Find("/reflibraryofcongress/", currentPath)) {
		sectionTitle = "Library of Congress";
		navConfigFile = filePath & 'refshelf\reflibraryofcongress\navConfig.txt';
	}
	
	else if (Find("/refmetadata/", currentPath)) {
		sectionTitle = "Metadata Resources";
		navConfigFile = filePath & 'refshelf\refmetadata\navConfig.txt';
	}
	
	else if (Find("/refoclc/", currentPath)) {
		sectionTitle = "OCLC Resources";
		navConfigFile = filePath & 'refshelf\refoclc\navConfig.txt';
	}
	
	else if (Find("/refpcc/", currentPath)) {
		sectionTitle = "PCC - Program for Cooperative Cataloging";
		navConfigFile = filePath & 'refshelf\refpcc\navConfig.txt';
	}

	else if (Find("/refpcctraining/", currentPath)) {
		sectionTitle = "Reference Shelf";
		navConfigFile = filePath & 'refshelf\navConfig.txt';
	}
		
	else if (Find("/refshelf/", currentPath)) {
		sectionTitle = "Reference Shelf";
		navConfigFile = filePath & 'refshelf\navConfig.txt';
	}
	
	else if (Find("/sections/", currentPath)) {
		sectionTitle = "Sections";
		navConfigFile = filePath & 'sections\navConfig.txt';
	}
	else if (Find("/serials/", currentPath)) {
		sectionTitle = "Serials Cataloging";
		navConfigFile = filePath & 'serials\navConfig.txt';
	}
	else if (Find("/staff/", currentPath)) {
		sectionTitle = "Staff Directory";
		navConfigFile = filePath & 'staff\navConfig.txt';
	}
	else if (Find("/training/", currentPath)) {
		sectionTitle = "Training and Documentation";
		navConfigFile = filePath & 'training\navConfig.txt';
	}
	
		else if (Find("/callnumbers/", currentPath)) {
		sectionTitle = "Call Number Manual";
		navConfigFile = filePath & 'callnumbers\navConfig.txt';
	}
	
	else if (Find("/demo/", currentPath)) {
		sectionTitle = "Demonstration page";
		navConfigFile = filePath & 'demo\navConfig.txt';
	}
	
	else if (Find("/erc_cataloging/", currentPath)) {
		sectionTitle = "Electronic Resources Cataloging: Documentation";
		navConfigFile = filePath & 'erc_cataloging\navConfig.txt';
	}	
	else if (Find("/erc_contacts/", currentPath)) {
		sectionTitle = "Electronic Resources Cataloging: Contacts";
		navConfigFile = filePath & 'erc_contacts\navConfig.txt';
	}	
	else if (Find("/erc_erig/", currentPath)) {
		sectionTitle = "Electronic Resources Cataloging Interest Group";
		navConfigFile = filePath & 'erc_erig\navConfig.txt';
	}	
	else if (Find("/erc_general/", currentPath)) {
		sectionTitle = "Electronic Resources Cataloging";
		navConfigFile = filePath & 'erc_general\navConfig.txt';
	}
	else if (Find("/erc_reports/", currentPath)) {
		sectionTitle = "Electronic Resources Cataloging: Reports";
		navConfigFile = filePath & 'erc_reports\navConfig.txt';
	}		
	else if (Find("/erc_SFX/", currentPath)) {
		sectionTitle = "Electronic Resources Cataloging: SFX";
		navConfigFile = filePath & 'erc_SFX\navConfig.txt';
	}
		
	else if (Find("/erc_special/", currentPath)) {
		sectionTitle = "Electronic Resources Cataloging: Special";
		navConfigFile = filePath & 'erc_special\navConfig.txt';
	}
	else if (Find("/saco/", currentPath)) {
		sectionTitle = "Subject Authority Proposal Form";
		navConfigFile = filePath & 'saco\navConfig.txt';
	}	
	
	else {	
		sectionTitle = "Cataloging and Metadata Center";
		navConfigFile = filePath & 'navConfig.txt';
	}
</cfscript>