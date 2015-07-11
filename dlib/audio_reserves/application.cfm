<cfapplication name="audior"
               sessionmanagement="Yes"
               setclientcookies="Yes">
			   
<cfif FindNoCase("unitproj", CGI.SERVER_NAME) EQ 1>
	<cfset dsn="musAudio">
<cfelse>
	<cfset dsn="musAudio_test">
</cfif>

<cfif isdefined("url.i")>
	<cfset session.usern=url.i>
	<cfset session.reservelist="yes">
	<cfset session.loggedin="1">
</cfif>
