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

<cfscript> 
ipLogFile = filepath & 'pot\visitors.txt';
</cfscript>

<cfscript>
	if (Find("/authority/", PATH_INFO)) {
		sectionTitle = "Authority/Database Maintenance";
		navConfigFile = filePath & 'authority\navConfig.txt';
	}
	else if (Find("/drm/", PATH_INFO)) {
		sectionTitle = "Digital Resources Metadata";
		navConfigFile = filePath & 'drm\navConfig.txt';
	}
	else if (Find("/forms/", PATH_INFO)) {
		sectionTitle = "Forms";
		navConfigFile = filePath & 'forms\navConfig.txt';
	}

	else if (Find("/copyprocedures/", PATH_INFO)) {
		sectionTitle = "Copy Cataloging Procedures for Monographs";
		navConfigFile = filePath & 'copy\copyprocedures\navConfig.txt';
	}
	else if (Find("/copytools/", PATH_INFO)) {
		sectionTitle = "Copy Cataloging Tools";
		navConfigFile = filePath & 'copy\copytools\navConfig.txt';
	}
	
	else if (Find("/copy/", PATH_INFO)) {
		sectionTitle = "Copy Cataloging";
		navConfigFile = filePath & 'copy\navConfig.txt';
	}
	
	else if (Find("/keycontacts/", PATH_INFO)) {
		sectionTitle = "Key Contacts";
		navConfigFile = filePath & 'keycontacts\navConfig.txt';
	}
	else if (Find("/minutes/", PATH_INFO)) {
		sectionTitle = "Minutes";
		navConfigFile = filePath & 'minutes\navConfig.txt';
	}
	else if (Find("/monograph/", PATH_INFO)) {
		sectionTitle = "Monographic Cataloging";
		navConfigFile = filePath & 'monograph\navConfig.txt';
	}
	else if (Find("/physical/", PATH_INFO)) {
		sectionTitle = "Physical Processing";
		navConfigFile = filePath & 'physical\navConfig.txt';
	}
	else if (Find("/policies/", PATH_INFO)) {
		sectionTitle = "Policies and Procedures";
		navConfigFile = filePath & 'policies\navConfig.txt';
	}
	else if (Find("/refauthresources/", PATH_INFO)) {
		sectionTitle = "Authority Resources";
		navConfigFile = filePath & 'refshelf\refauthresources\navConfig.txt';
	}
	
	else if (Find("/refcattools/", PATH_INFO)) {
		sectionTitle = "Cataloging Tools and Aids";
		navConfigFile = filePath & 'refshelf\refcattools\navConfig.txt';
	}

	else if (Find("/refcollection/", PATH_INFO)) {
		sectionTitle = "Cataloging & Metadata Center Reference Resources";
		navConfigFile = filePath & 'refshelf\refcollection\navConfig.txt';
	}

	
	else if (Find("/referesourcescat/", PATH_INFO)) {
		sectionTitle = "Electronic Resources Cataloging";
		navConfigFile = filePath & 'refshelf\referesourcescat\navConfig.txt';
	}
	
	else if (Find("/refpublications/", PATH_INFO)) {
		sectionTitle = "Publications, Lists, etc.";
		navConfigFile = filePath & 'refshelf\refpublications\navConfig.txt';
	}
	
	else if (Find("/refgeographic/", PATH_INFO)) {
		sectionTitle = "Geographic Resources";
		navConfigFile = filePath & 'refshelf\refgeographic\navConfig.txt';
	}
	
	else if (Find("/refgovdocs/", PATH_INFO)) {
		sectionTitle = "Government Documents";
		navConfigFile = filePath & 'refshelf\refgovdocs\navConfig.txt';
	}
	
	else if (Find("/reflanguages/", PATH_INFO)) {
		sectionTitle = "Language Resources";
		navConfigFile = filePath & 'refshelf\reflanguages\navConfig.txt';
	}
	
	else if (Find("/reflibraries/", PATH_INFO)) {
		sectionTitle = "Libraries, Library Systems, Utilities";
		navConfigFile = filePath & 'refshelf\reflibraries\navConfig.txt';
	}
	
	else if (Find("/reforganizations/", PATH_INFO)) {
		sectionTitle = "Library and Professional Organizations";
		navConfigFile = filePath & 'refshelf\reforganizations\navConfig.txt';
	}
	
	else if (Find("/reflibraryofcongress/", PATH_INFO)) {
		sectionTitle = "Library of Congress";
		navConfigFile = filePath & 'refshelf\reflibraryofcongress\navConfig.txt';
	}
	
	else if (Find("/refmetadata/", PATH_INFO)) {
		sectionTitle = "Metadata Resources";
		navConfigFile = filePath & 'refshelf\refmetadata\navConfig.txt';
	}
	
	else if (Find("/refoclc/", PATH_INFO)) {
		sectionTitle = "OCLC Resources";
		navConfigFile = filePath & 'refshelf\refoclc\navConfig.txt';
	}
	
	else if (Find("/refpcc/", PATH_INFO)) {
		sectionTitle = "PCC - Program for Cooperative Cataloging";
		navConfigFile = filePath & 'refshelf\refpcc\navConfig.txt';
	}

	else if (Find("/refpcctraining/", PATH_INFO)) {
		sectionTitle = "Reference Shelf";
		navConfigFile = filePath & 'refshelf\navConfig.txt';
	}
		
	else if (Find("/refshelf/", PATH_INFO)) {
		sectionTitle = "Reference Shelf";
		navConfigFile = filePath & 'refshelf\navConfig.txt';
	}
	
	else if (Find("/sections/", PATH_INFO)) {
		sectionTitle = "Sections";
		navConfigFile = filePath & 'sections\navConfig.txt';
	}
	else if (Find("/serials/", PATH_INFO)) {
		sectionTitle = "Serials Cataloging";
		navConfigFile = filePath & 'serials\navConfig.txt';
	}
	else if (Find("/staff/", PATH_INFO)) {
		sectionTitle = "Staff Directory";
		navConfigFile = filePath & 'staff\navConfig.txt';
	}
	else if (Find("/training/", PATH_INFO)) {
		sectionTitle = "Training and Documentation";
		navConfigFile = filePath & 'training\navConfig.txt';
	}
	
		else if (Find("/callnumbers/", PATH_INFO)) {
		sectionTitle = "Call Number Manual";
		navConfigFile = filePath & 'callnumbers\navConfig.txt';
	}
	
	else if (Find("/demo/", PATH_INFO)) {
		sectionTitle = "Demonstration page";
		navConfigFile = filePath & 'demo\navConfig.txt';
	}
	
	else if (Find("/erc_cataloging/", PATH_INFO)) {
		sectionTitle = "Electronic Resources Cataloging: Documentation";
		navConfigFile = filePath & 'erc_cataloging\navConfig.txt';
	}	
	else if (Find("/erc_contacts/", PATH_INFO)) {
		sectionTitle = "Electronic Resources Cataloging: Contacts";
		navConfigFile = filePath & 'erc_contacts\navConfig.txt';
	}	
	else if (Find("/erc_erig/", PATH_INFO)) {
		sectionTitle = "Electronic Resources Cataloging Interest Group";
		navConfigFile = filePath & 'erc_erig\navConfig.txt';
	}	
	else if (Find("/erc_general/", PATH_INFO)) {
		sectionTitle = "Electronic Resources Cataloging";
		navConfigFile = filePath & 'erc_general\navConfig.txt';
	}
	else if (Find("/erc_reports/", PATH_INFO)) {
		sectionTitle = "Electronic Resources Cataloging: Reports";
		navConfigFile = filePath & 'erc_reports\navConfig.txt';
	}		
	else if (Find("/erc_SFX/", PATH_INFO)) {
		sectionTitle = "Electronic Resources Cataloging: SFX";
		navConfigFile = filePath & 'erc_SFX\navConfig.txt';
	}
		
	else if (Find("/erc_special/", PATH_INFO)) {
		sectionTitle = "Electronic Resources Cataloging: Special";
		navConfigFile = filePath & 'erc_special\navConfig.txt';
	}
	else if (Find("/saco/", PATH_INFO)) {
		sectionTitle = "Subject Authority Proposal Form";
		navConfigFile = filePath & 'saco\navConfig.txt';
	}	
	
	else {	
		sectionTitle = "Cataloging and Metadata Center";
		navConfigFile = filePath & 'navConfig.txt';
	}
</cfscript>