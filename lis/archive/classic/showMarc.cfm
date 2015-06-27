<cfif isdefined("URL.DBCN") is false>
	<cflocation url="archive.cfm">
</cfif>

<cfset m_DBCN = URL.DBCN>
<cfinclude template="qryBibRecord.cfm">
<cfset Utf8Converter = CreateObject("Java", "edu.ucla.library.marc.MarcConverter")>
<!--- For unitdev
<cfset ret = Utf8Converter.init("F:\\Inetpub\\wwwroot\\lis_test\\classes\\eacc2uni.txt")>
 --->
<!--- For new unitproj environment --->
<cfset ret = Utf8Converter.init("E:\\Inetpub\\classes\\eacc2uni.txt")>

<cfinclude template="../common/hexToString.cfm">
<cfinclude template="../common/marcToHtml.cfm">

<cfoutput>
<html>
<head>
	<title>Bib Record - #m_DBCN#</title>
	<link rel="StyleSheet" href="../common/marc.css" type="text/css" media="screen">
</head>
<body>
<!---
	<cfset utf8record = Utf8Converter.convertToUtf8ForCF(qryBibRecord.Record)>
	#marcToHtml(hexToString(utf8record))#
--->
	<cfset utf8record = Utf8Converter.convertToUtf8ForCF(qryBibRecord.Record)>
	#marcToHtmlUnicode(hexToUtf8String(utf8record))#

</cfoutput>

</body>
</html>
