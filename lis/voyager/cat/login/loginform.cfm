<html>
<head>
	<title>Item Sorter Login</title>
</head>

<body>

<cfif structKeyExists(form,"user")>
	<cfquery name="login" datasource="#session.DSN#">
		select * from operator_password
			where operator_id = <cfqueryparam value = "#form.user#"  cfsqltype = 'CF_SQL_VARCHAR'>
			and password = vger_support.EncryptPassword(<cfqueryparam value = "#form.password#"  cfsqltype = 'CF_SQL_VARCHAR'>, 'Y')
	</cfquery>

	<cfif login.recordcount gt 0>
		<cfset session.loggedIn = 1>
		<cflocation url="../ItemSorter.cfm" addtoken="no">
	<cfelse>
		<cfset session.loggedIn = 0>
	</cfif>
</cfif>

<form id="loginform" action="loginform.cfm" method="post">
	<table border=0 cellspacing="5" cellpadding="5">
		<tr>
			<td><b>Login using your Voyager credentials</b></td><td></td><td></td>
		</tr>
		<tr>
			<td align="right">
			<b>Username:<font></b></td>
			<td><input type="text" name="user" id="user" size="16" maxlength="16" autofocus></td>
			<td></td>
		</tr>
		<tr>
			<td align="right">
			<b>Password:</b></td>
			<td><input type="password" name="password" size="16" maxlength="30"></td>
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
