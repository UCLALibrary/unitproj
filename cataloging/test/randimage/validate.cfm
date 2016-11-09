<cfapplication 
   name = "randimg"
   loginStorage = "session"
   clientManagement = "Yes"
   clientStorage = "Cookie" 
   setClientCookies = "Yes"
   sessionManagement = "Yes"
   sessionTimeout = #CreateTimeSpan(0, 0, 5, 0)#
   applicationTimeout = #CreateTimeSpan(0, 0, 5, 0)#
   setDomainCookies = "Yes">

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
Validating...<br>

<cflock timeout=20 scope="Session" type="Readonly">
<cfif IsDefined("Session.finalVerify")>
	<cfif URL.pwd EQ Session.finalVerify>
	    <cfcookie name="WEBTOOL" value="UCLA">
		<cflocation url="http://unitdev.library.ucla.edu/cataloging/test/webtool2.cfm" addToken="No">
	<cfelse>
		<cflocation url="http://unitdev.library.ucla.edu/cataloging/test/randimage/randimage2.cfm">
	</cfif>
<cfelse>
	Session expired... <br>
	Please click <a href="randimage2.cfm">here</a> to try again.
</cfif>
</cflock>
</body>
</html>
