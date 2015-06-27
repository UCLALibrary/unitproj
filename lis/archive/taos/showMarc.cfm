<cfif isdefined("URL.DBCN") is false and isdefined("m_DBCN") is false>
	<cflocation url="archive.cfm">
</cfif>

<!--- Coming directly via URL --->
<cfif isdefined("m_DBCN") is false>
	<cfset m_DBCN = URL.DBCN>
	<cfinclude template="qryMarcRecord.cfm">
</cfif>

<cfset Utf8Converter = CreateObject("Java", "edu.ucla.library.marc.MarcConverter")>
<!--- For unitproj
<cfset ret = Utf8Converter.init("F:\\Inetpub\\wwwroot\\lis\\classes\\eacc2uni.txt")>
--->
<!--- For new unitproj environment --->
<cfset ret = Utf8Converter.init("E:\\Inetpub\\classes\\eacc2uni.txt")>


<cfinclude template="../common/hexToString.cfm">
<cfinclude template="../common/marcToHtml.cfm">

<cfoutput>
<html>
<head>
	<title>MARC Record - #m_DBCN#</title>
	<link rel="StyleSheet" href="../common/marc.css" type="text/css" media="screen">
</head>
<body>

<!--- Show this only if came via URL (otherwise, was printed by results.cfm) --->
<cfif isdefined("URL.DBCN") is true>
	<p><a href="archive.cfm">Return to search screen</a></p>
</cfif>

<cfif qryList.RecordCount EQ 1>
<!---
	<cfset utf8record = Utf8Converter.convertToUtf8ForCF(qryList.Record)>
	#marcToHtml(hexToString(utf8record))#
--->
	<cfset utf8record = Utf8Converter.convertToUtf8ForCF(qryList.Record)>
	#marcToHtmlUnicode(hexToUtf8String(utf8record))#
</cfif>

<!--- m_Type set by qryMarcRecord.cfm --->
<cfif m_Type EQ "Bib_Record">
	<cfinclude template="showSummaryHoldings.cfm">
</cfif>

</body>
</html>
</cfoutput>
