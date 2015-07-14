<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Music Library: Digital Audio Reserves Login</title>
</head>

<body>

<cfif structKeyExists(form,"user")>
	<cfquery name="login" datasource="#dsn#">
		select * from login
			where username='#form.user#'
				<!--- and password='#form.password#' --->
	</cfquery>

	<cfif login.recordcount gt 0>
		<cfset session.loggedIn=1>
		<cfset session.acctype=trim(login.loginType)>
		<cfset session.user=lcase(trim(login.username))>
		<cflocation url="../index.cfm" addtoken="no">
	<cfelse>
		<cfquery name="instructors" datasource="#dsn#">
			select instructorID from instructors
				where UCLA_ID='#session.user#'
		</cfquery>
	    <cfif instructors.recordCount>
	    	<cfset session.loggedIn=1>
			<cfset session.acctype="readonly">
			<cfset session.user=lcase(session.user)>
			<cfset session.instructor=instructors.instructorID>
			<cflocation url="../index.cfm" addtoken="no">
		<cfelse>
			<cfquery name="TAs" datasource="#dsn#">
				select TAs from classes
					where TAs like '%#session.user#%'
			</cfquery>
			<cfif TAs.recordCount>
				<cfloop query="TAs">
					<cfif ListContainsNoCase(TAs,session.user)>
				    	<cfset session.loggedIn=1>
						<cfset session.acctype="readonly">
						<cfset session.user=lcase(session.user)>
						<cfset session.instructor=0>
						<cflocation url="../index.cfm" addtoken="no">	
					</cfif>
				</cfloop>
			</cfif>
		</cfif>
		<cfset session.loggedIn = 0>
		<h3>You do not have access to this database.</h3>
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

<cfif structKeyExists(form,"user")>
<table border="0"><tr><td bgcolor="#808080" class="white">&nbsp;Login failed. &nbsp; Username and Password must be valid. &nbsp; You may try again.&nbsp;</td></tr></table>
</cfif>

</body>
</html>
