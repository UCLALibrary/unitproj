<cfapplication name="audior"
               sessionmanagement="Yes"
               setclientcookies="Yes">
			   
<!---<cfif left(CGI.SERVER_NAME, len("unitdev")) eq "unitdev">
	<cfset dsn="musAudio_test">
<cfelse>
	<cfset dsn="musAudio">
</cfif>--->

<cfset dsn="musAudio">


<cfif isdefined("url.i")>
	<cfset session.usern=url.i>
	<cfset session.reservelist="yes">
	<cfset session.loggedin="1">
</cfif>
