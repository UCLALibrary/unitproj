<html>
<head>
	<title>Change password</title>
	<link href="audio.css" rel="stylesheet" type="text/css">
</head>
<body>
<cfinclude template="head.cfm">

<cfif structKeyExists(session,"user")>
	<!--- If form has been submitted, update password --->
	<cfif structKeyExists(form, "newpassword")>
		<cfset pwdhash = hash(form.newpassword, "SHA")>
		<cfquery name="changePassword" datasource="#dsn#">
			update login
			set password = '#pwdhash#'
			where username = '#session.user#'
		</cfquery>
		<p>Your password has been changed.</p>
	<cfelse>
		<!--- Otherwise, show form --->
		<form action="changePassword.cfm" method="post">
			New password: <input type="password" size="30" name="newpassword">
			<input type="submit" name="submit" value="Change password">
		</form>
	</cfif>
</cfif>

</body>
</html>