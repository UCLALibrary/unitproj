<cfapplication name="mlStaffAudio"
               sessionmanagement="Yes"
               sessiontimeout="#createTimeSpan(0,0,1,0)#"
               applicationtimeout="#createTimeSpan(0,0,1,0)#">

<cfif not isDefined("session.loggedIn") Or session.loggedIn is not 1>
	<cflocation url="login/login.cfm" addtoken="no">
<cfelse>
	<cfif FindNoCase("unitproj", CGI.SERVER_NAME) EQ 1>
		<cfset dsn="musAudio">
	<cfelse>
		<cfset dsn="musAudio_test">
	</cfif>
	<cfset srv5="pnm://audior50.library.ucla.edu">
	<cfset srv7="rtsp://audior.library.ucla.edu">
	<cfset srv9="rtsp://audior.library.ucla.edu">
	<cfset srv="http://audior.library.ucla.edu:8080/ramgen">
</cfif>

