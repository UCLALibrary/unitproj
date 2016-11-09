<html>
<head>
<title>Scaling Images</title>
</head>

<body>
<cfif not isDefined("FORM.imageFile")>
	<form action="addText.cfm" method="post" enctype="multipart/form-data">
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

<!--- scaleX image to 150px wide and add text --->
<cfset scaleX150 = imageCFC.scaleX("", "#myfilepath#\Images\#uploadedImage#", "", 150)>
<cfset fontDetails = StructNew()>
<cfset fontDetails.fontfile = "#myfilepath#\fonts\framd.ttf">
<cfset fontDetails.color = "white">
<cfset fontDetails.size = 10>
<!--- Take the scaleX 150 image and add text to it --->
<!--- The 2nd argument which is the input file will not be used --->
<!--- The 1st argument we will use to pass the image object to (to add text) --->
<cfset scaleX150_2 = imageCFC.addtext(scaleX150.img, "", "#myfilepath#\Images\_scaleX_150_marked_#uploadedImage#", 5, 5, fontDetails, "Sample Text")>
</cfif>
</body>
</html>
