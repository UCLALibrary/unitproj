<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Successfully logged out</title>
</head>

<LINK href="greys.css" rel="stylesheet" type="text/css">

<cfset loginOld = 0>
<cfif structKeyExists(session,"loginOld")>
<cfif session.loginOld eq 1><cfset loginOld = 1></cfif>
</cfif>

<body>
<cfinclude template="isis-logout.cfm">
<cfset session.loggedIn = 0>
<cfscript>
	structdelete(session,"loginOld");
</cfscript>
<h3>You have successfully logged out</h3>
<h3><cfif loginOld><a href="login/login.cfm"><cfelse><a href="index.cfm"></cfif>Click here to log in again</a></h3>
</body>
</html>