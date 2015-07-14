<cfapplication name="mlStaffAudio"
               sessionmanagement="Yes"
               setclientcookies="Yes"
               sessiontimeout="#createTimeSpan(0,0,1,0)#"
               applicationtimeout="#createTimeSpan(0,0,1,0)#">

<cfif FindNoCase("unitproj", CGI.SERVER_NAME) EQ 1>
	<cfset dsn="musAudio">
<cfelse>
	<cfset dsn="musAudio_test">
</cfif>

