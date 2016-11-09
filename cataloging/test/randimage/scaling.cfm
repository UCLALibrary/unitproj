<html>
<head>
<title>Scaling Images</title>
</head>

<body>
<cfif not isDefined("FORM.imageFile")>
	<form action="scaling.cfm" method="post" enctype="multipart/form-data">
		<input type="file" name="imageFile" /><br />
		<input type="submit" value="PROCESS IMAGE" /></form>
	</form>
<cfelse>
	<cfset myfilepath="#getDirectoryFromPath( getTemplatePath() )#">
	<cffile action="upload" 
		 filefield="imageFile" 
		 destination="#myfilepath#Images" 
		 nameconflict="overwrite">
<cfset uploadedImage = "#cffile.serverfile#">
<!--- Invoke image.cfc component --->
<cfset imageCFC = createObject("component","image") />

<!--- scaleX image to 150px wide --->
<cfset scaleX150 = imageCFC.scaleX("", "#myfilepath#\Images\#uploadedImage#", "#myfilepath#\Images\_scaleX_150_#uploadedImage#", 150)>
</cfif>
</body>
</html>
