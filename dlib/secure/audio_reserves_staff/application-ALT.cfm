<cfapplication name="frontera2"
               sessionmanagement="Yes"
               sessiontimeout="#createTimeSpan(1,0,0,0)#"
               applicationtimeout="#createTimeSpan(1,0,0,0)#">
			   
<cfset admt=0>
<cfif not isdefined("session.loggedin")>
	<cflocation url="login/login.cfm" addtoken="No">
<cfelseif session.loggedin is not "1">
	<cflocation url="login/login.cfm" addtoken="No">
<cfelse>
	<cfset admt=1>
	<cfset dsn="musAudio">
</cfif>


