<cfset session.DSN = "Voyager">

<cfif not isDefined("session.loggedIn")>
	<cflocation url="login/loginform.cfm" addtoken="no">
</cfif>
