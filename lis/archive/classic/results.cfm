<!--- Parameters can come from FORM or URL scope --->
<cfif IsDefined("index") is false or IsDefined("terms") is false>
	<cflocation url="archive.cfm">
</cfif>

<cfset m_Index = index>
<cfset m_Terms = REReplace(terms, "[?*]", "%", "ALL")>
<cfset m_Terms = REReplace(m_Terms, "'", "", "ALL")>

<cfswitch expression=#m_Index#>
	<cfcase value="Author">
		<cfset m_Index_Code = "A">
		<cfset m_Results_Page = "bibResults.cfm">
		<cfinclude template="qryBibKeywords.cfm">
	</cfcase>
	<cfcase value="DBCN">
		<cfset m_Results_Page = "bibResults.cfm">
		<cfinclude template="qryBibDBCN.cfm">
	</cfcase>
	<cfcase value="FundID,FundName">
		<cfset m_Results_Page = "fundResults.cfm">
		<cfinclude template="qryFunds.cfm">
	</cfcase>
	<cfcase value="InvLine">
		<cfset m_Index_Code = "">
		<cfset m_Results_Page = "invlineResults.cfm">
		<cfinclude template="qryInvLines.cfm">
	</cfcase>
	<cfcase value="InvNumber,InvSeq,InvSuppID,InvSuppName">
		<cfset m_Results_Page = "invoiceResults.cfm">
		<cfinclude template="qryInvoices.cfm">
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
	<cfcase value="PoLine">
		<cfset m_Index_Code = "">
		<cfset m_Results_Page = "polineResults.cfm">
		<cfinclude template="qryPoLines.cfm">
	</cfcase>
	<cfcase value="PoNumber,PoSuppID,PoSuppName">
		<cfset m_Results_Page = "polineResults.cfm">
		<cfinclude template="qryPoLines.cfm">
	</cfcase>
	<cfcase value="SupplierID,SupplierName">
		<cfset m_Results_Page = "supplierResults.cfm">
		<cfinclude template="qrySuppliers.cfm">
	</cfcase>
	<cfcase value="Title">
		<cfset m_Index_Code = "T">
		<cfset m_Results_Page = "bibResults.cfm">
		<cfinclude template="qryBibKeywords.cfm">
	</cfcase>
</cfswitch>

<html>
<head>
	<title>Classic Archive - Search Results</title>
</head>

<body>
<cfoutput>
<a href="archive.cfm">Return to search screen</a>
<p>Your #m_Index# search for <b>#m_Terms#</b> found #qryList.RecordCount# record(s):</p>
</cfoutput>

<cfif qryList.RecordCount GT 0>
	<cfinclude template="#m_Results_Page#">
</cfif>

<p />
<a href="archive.cfm">Return to search screen</a>
</body>
</html>
