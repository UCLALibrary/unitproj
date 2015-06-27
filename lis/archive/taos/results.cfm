<!--- Parameters can come from FORM or URL scope --->
<cfif IsDefined("index") is false or IsDefined("terms") is false>
	<cflocation url="archive.cfm">
</cfif>

<cfset m_Index = index>
<cfset m_Terms = REReplace(terms, "[?*]", "%", "ALL")>

<!--- Make sure search is not all wildcards, or empty string --->
<cfif REReplace(m_Terms, "%", "", "ALL") EQ "">
	<cflocation url="archive.cfm">
</cfif>

<cfset m_Terms = REReplace(m_Terms, "'", "", "ALL")>

<cfswitch expression=#m_Index#>
	<cfcase value="Author">
		<cfset m_Index_Code = "A">
		<cfset m_Results_Page = "bibResults.cfm">
		<cfinclude template="qryBibKeywords.cfm">
	</cfcase>
	<cfcase value="Call Number">
		<cfset m_Results_Page = "holResults.cfm">
		<cfinclude template="qryCallNumber.cfm">
	</cfcase>
	<cfcase value="DBCN">
		<cfset m_Results_Page = "showMarc.cfm">
		<cfinclude template="qryMarcRecord.cfm">
	</cfcase>
	<cfcase value="ISBN">
		<cfset m_Index_Code = "B">
		<!--- Be nice: normalize ISBN search term same as it was indexed by removing hyphen --->
		<cfset m_Terms = REReplace(m_Terms, "-", "", "ALL")>
		<cfset m_Results_Page = "bibResults.cfm">
		<cfinclude template="qryBibKeywords.cfm">
	</cfcase>
	<cfcase value="ISSN">
		<cfset m_Index_Code = "S">
		<!--- Be nice: normalize ISSN search term same as it was indexed by removing hyphen --->
		<cfset m_Terms = REReplace(m_Terms, "-", "", "ALL")>
		<cfset m_Results_Page = "bibResults.cfm">
		<cfinclude template="qryBibKeywords.cfm">
	</cfcase>
	<cfcase value="Item Barcode">
		<!---	Some barcodes are linked to multiple holdings, but since those all have same loc/call#,
				show bib info instead to help differentiate
		--->
		<cfset m_Results_Page = "bibResults.cfm">
		<cfinclude template="qryItemBarcode.cfm">
	</cfcase>
	<cfcase value="Keyword">
		<cfset m_Index_Code = "">
		<cfset m_Results_Page = "bibResults.cfm">
		<cfinclude template="qryBibKeywords.cfm">
	</cfcase>
	<cfcase value="O1RN">
		<cfset m_Index_Code = "O">
		<cfset m_Results_Page = "bibResults.cfm">
		<cfinclude template="qryBibKeywords.cfm">
	</cfcase>
	<cfcase value="OCLC">
		<cfset m_Index_Code = "C">
		<cfset m_Results_Page = "bibResults.cfm">
		<cfinclude template="qryBibKeywords.cfm">
	</cfcase>
	<cfcase value="Title">
		<cfset m_Index_Code = "T">
		<cfset m_Results_Page = "bibResults.cfm">
		<cfinclude template="qryBibKeywords.cfm">
	</cfcase>
</cfswitch>

<html>
<head>
	<title>Taos Archive - Search Results</title>
</head>

<body>
<cfoutput>
<a href="archive.cfm">Return to search screen</a>
<cfset m_Count = qryList.RecordCount>
<cfif m_Count EQ 1>
	<cfset m_Word = "record">
<cfelse>
	<cfset m_Word = "records">
</cfif>
<p>Your #m_Index# search for <b>#m_Terms#</b> found #m_Count# #m_Word#:</p>
</cfoutput>

<cfif qryList.RecordCount GT 0>
	<cfinclude template="#m_Results_Page#">
</cfif>

<p />
<a href="archive.cfm">Return to search screen</a>
</body>
</html>
