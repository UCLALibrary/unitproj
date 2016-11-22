<html>
<head>
	<title>Successfully logged out</title>
</head>
<body>
<cfset session.loggedIn = 0>
<cfscript>
	structdelete(session,"loggedin");
</cfscript>
<p>You have successfully logged out.  <a href="ItemSorter.cfm">Click here to log in again</a></p>
</body>
</html>