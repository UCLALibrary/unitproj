<cfif isdefined("URL.DBCN") is false and isdefined("m_DBCN") is false>
	<cflocation url="archive.cfm">
</cfif>

<!--- Coming directly via URL --->
<cfif isdefined("m_DBCN") is false>
	<cfset m_DBCN = URL.DBCN>
	<cfinclude template="qryMarcRecord.cfm">
</cfif>

<!---
<cfset MarcWriter = CreateObject("Java", "MarcToHtml")>
--->

<cfset Utf8Converter = CreateObject("Java", "edu.ucla.library.marc.MarcConverter")>

<!---
<cfset tester = CreateObject("Java", "testCF")>
--->

<cfcontent type="text/html; charset=UTF-8">

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
	<cfset utf8record = Utf8Converter.testCF(qryList.Record)>
	<p>utf8record = #utf8record#</p>
	<p>#hexToString(utf8record)#</p>
	#marcToHtml(hexToString(utf8record))#
</cfif>


<!---
<p>String 1 (Java Unicode): #tester.test(1)#</p>
<p>String 2 (UTF-8): #tester.test(2)#</p>
<p>String 3 (hex of s2): #tester.test(3)#</p>
<p>Decoded s3: #hexToString(tester.test(3))#</p>

	#MarcWriter.convertToHtml(hexToString(utf8record))#

	#MarcWriter.convertToHtml(utf8record)#
	#MarcWriter.convertToHtml(qryList.Record)#
--->

<!---
<cfif qryList.RecordCount EQ 1>
	#MarcWriter.convertToHtml(qryList.Record)#
</cfif>
--->

<!--- m_Type set by qryMarcRecord.cfm --->

<!---
<cfif m_Type EQ "Bib_Record">
	<cfinclude template="showSummaryHoldings.cfm">
</cfif>
--->
</body>
</html>
</cfoutput>
