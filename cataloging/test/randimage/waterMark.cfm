<html>
<head>
<title>Scaling Images</title>
</head>

<body>
<cfif not isDefined("FORM.imageFile")>
	<form action="waterMark.cfm" method="post" enctype="multipart/form-data">
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

<!--- scaleX image to 640px wide and add watermark --->
<cfset scaleX640 = imageCFC.scaleX("", "#myfilepath#\Images\#uploadedImage#", "", 640)>
<cfset scaleX640_2_watermark = imageCFC.watermark(scaleX640.img,"" ,"","#myfilepath#\Images\sold.jpg",0.5,50, 50,"#myfilepath#\Images\_scaleX_640_waterMarked_#uploadedImage#")>
</cfif>
</body>
</html>
