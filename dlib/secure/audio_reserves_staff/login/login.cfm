<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Music Library: Digital Audio Reserves Login</title>
</head>

<body>

<cfif structKeyExists(form,"user")>
	<cfset pwdhash = hash(form.password, "SHA")>
	<cfquery name="login" datasource="#dsn#">
		select * from login
			where username = <cfqueryparam value = "#form.user#"  cfsqltype = 'CF_SQL_VARCHAR'>
			and password = <cfqueryparam value = "#pwdhash#"  cfsqltype = 'CF_SQL_VARCHAR'>
	</cfquery>

	<cfif login.recordcount gt 0>
		<cfset session.loggedIn=1>
		<cfset session.acctype=trim(login.loginType)>
		<cfset session.user=lcase(trim(login.username))>
		<cflocation url="../index.cfm" addtoken="no">
	<cfelse>
		<cfset session.loggedIn = 0>
	</cfif>
</cfif>

<form action="login.cfm" method="post">
	<table border=0 cellspacing="5" cellpadding="5">
		<tr>
			<td><b>Login . . .</b></td><td></td><td></td>
		</tr>
		<tr>
			<td align="right">
			<b>Username:<font></b></td>
			<td><input type="text" name="user" size="16" maxlength="16"></td>
			<td></td>
		</tr>
		<tr>
			<td align="right">
			<b>Password:</b></td>
			<td><input type="password" name="password" size="16" maxlength="16"></td>
			<td>
			<input type="submit" name="submitform" value="Submit">
			</td>
		</tr>
	</table>
</form>

<!--- Form submitted but still on this page?  Login failed --->
<cfif structKeyExists(form,"user")>
	<p>Login failed: Invalid username/password.</p>
</cfif>

</body>
</html>
