<cfif IsDefined("URL.INV") is false or IsDefined("URL.SUP") is false>
	<cflocation url="archive.cfm">
</cfif>

<cfif IsDefined("URL.DBCN") is true>
	<cfset m_DBCN = URL.DBCN>
<cfelse>
	<cfset m_DBCN = "">
</cfif>

<cfif IsDefined("URL.MODE") is true>
	<cfset m_Mode = URL.MODE>
<cfelse>
	<cfset m_Mode = "brief">
</cfif>

<cfset m_Inv_Number = Trim(URL.INV)>
<cfset m_Supplier_ID = Trim(URL.SUP)>

<cfinclude template="qryInvFull.cfm">
<cfinclude template="formatPO.cfm">

<cfoutput>
<html>
<head>
	<title>Invoice Record - #m_Inv_Number# (#m_Supplier_ID#)</title>
	<link rel="StyleSheet" href="classic.css" type="text/css" media="screen">
</head>
</cfoutput>

<body>

<p>
	<a href="archive.cfm">Return to search screen</a>
	<cfif m_DBCN NEQ "">
		<cfoutput>
			&nbsp;&nbsp;<a href="results.cfm?index=InvLine&terms=#m_DBCN#">Return to Invoice results list</a>
		</cfoutput>
	</cfif>
</p>

<cfif m_Mode EQ "brief">
	<cfinclude template="showInvBrief.cfm">
<cfelse>
	<cfinclude template="showInvFull.cfm">
</cfif>

</body>
</html>
