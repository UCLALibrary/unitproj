<http>
<head>
<title>output page</title>
</head>
<body>
<h1>Thank You For Filling Out This Form</h1>
<cfoutput>
upfile = #FORM.upfile#<br/>
<cftry>
	<cffile action="upload"
		destination="f:\Inetpub\Development\unitproj\cataloging\erc_general\uploads\"
		filefield="#FORM.upfile#"
		nameconflict="overwrite">
	<cfcatch type="Any">
		<cfset up2snuff = 0>
		<!---cfset em = "An error ocurred while attempting to upload the file. Please try again."--->
		<cfset em = "#cfcatch.Message#" & "#cfcatch.Detail#">
	</cfcatch>
</cftry>
<cfif not up2snuff>
#em#
</cfif>
</cfoutput>
</body>
</html>