<cfapplication name="audior"
               sessionmanagement="Yes"
               setclientcookies="Yes"
			   searchimplicitscopes="true"
>
			   
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

<!--- Google Analytics --->
<cfhtmlhead
	text="<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');   ga('create', 'UA-32672693-1', 'auto');  ga('send', 'pageview');</script>"
>
