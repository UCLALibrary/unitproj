<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>View site as non-admin user</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">
<cfif structKeyExists(form,"username")>
<cfset session.realtype=session.acctype>
<cfset session.realuser=session.user>
<cfset session.acctype="readonly">
<cfset session.user="#form.username#">
<cflocation url="index.cfm" addtoken="no">
<cfelse>
<h3>View site as a different user</h3>
<p>Enter the UCLA login name of the user you would like to view the site as.</p>
<p><b>N.B.: Use the &quot;restore admin&quot; option in the menu to restore administrative rights.</b></p>
<form action="test.cfm" method="post">
<input name="username" type="text">
<input type="submit" value="Login">
</form>
</cfif>
<cfinclude template="foot.cfm">

</body>
</html>
