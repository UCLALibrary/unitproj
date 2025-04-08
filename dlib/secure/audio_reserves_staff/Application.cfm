<cfapplication name="mlStaffAudio"
               sessionmanagement="Yes"
               sessiontimeout="#createTimeSpan(0,1,0,0)#"
               applicationtimeout="#createTimeSpan(0,1,0,0)#"
			   searchimplicitscopes="true"
>

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

<!--- Google Analytics --->
<cfhtmlhead
	text="<script> (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');  ga('create', 'UA-32672693-3', 'auto');  ga('send', 'pageview');</script>"
>
