<cfif IsDefined("URL.POP") is false or IsDefined("URL.PON") is false or IsDefined("URL.DBCN") is false>
	<cflocation url="archive.cfm">
</cfif>

<cfif IsDefined("URL.MODE") is true>
	<cfset m_Mode = URL.MODE>
<cfelse>
	<cfset m_Mode = "brief">
</cfif>

<cfset m_PO_Number = Trim(URL.PON)>
<cfset m_PO_Prefix = Trim(URL.POP)>
<cfset m_DBCN = URL.DBCN>

<cfinclude template="qryPOFull.cfm">
<cfinclude template="formatPO.cfm">

<cfoutput>
<html>
<head>
	<title>PO Record - #FormatPO(m_PO_Prefix, m_PO_Number)#</title>
	<link rel="StyleSheet" href="classic.css" type="text/css" media="screen">
</head>
</cfoutput>

<body>

<cfoutput>
<p>
	<a href="archive.cfm">Return to search screen</a>
	&nbsp;&nbsp;
	<a href="results.cfm?index=POLine&terms=#m_DBCN#">Return to PO results list</a></p>
</cfoutput>

<cfif m_Mode EQ "brief">
	<cfinclude template="showPoBrief.cfm">
<cfelse>
	<cfinclude template="showPoFull.cfm">
</cfif>

</body>
</html>
