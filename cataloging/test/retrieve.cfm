<cfparam name="address" default="http://www.ucla.edu/">
<html>
<head>
	<title>Use Get Method</title>
</head>
<body>

<cfif address NEQ "">
	<cfhttp 
		method="Get"
		url=#address#
		resolveurl="Yes">
<!---	<cfoutput>
		#cfhttp.FileContent# <br>
	</cfoutput>
--->

<cfscript>
	if inStr(cfhttp.FileContent)
</cfscript>

</cfif>
</body>
</html>
