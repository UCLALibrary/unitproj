
<html>
<head>
<title>Performing Multiple Operations On Uploaded Images</title>
</head>
<body>
<cfif not isDefined("FORM.imageFile")>
	<form action="multipleOperations.cfm" method="post" enctype="multipart/form-data">
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
<cfset scaleX150 = imageCFC.scaleX("", "#myfilepath#\Images\#uploadedImage#", "", 150)>
<cfset fontDetails = StructNew()>
<cfset fontDetails.fontfile = "#myfilepath#\fonts\framd.ttf">
<cfset fontDetails.color = "white">
<cfset fontDetails.size = 10>
<!--- Take the scaleX 150 image and add text to it --->
<!--- The 2nd argument which is the input file will not be used --->
<!--- The 1st argument we will use to pass the image object to (to add text) --->
<cfset scaleX150_2 = imageCFC.addtext(scaleX150.img, "", "#myfilepath#\Images\_scaleX_150_marked_#uploadedImage#", 5, 5, fontDetails, "Sample Text")>
<cfset scaleX150_2_rotated = imageCFC.rotate(scaleX150.img, "", "#myfilepath#\Images\_scaleX_150_rotated_#uploadedImage#", -90 )> 
<cfset scaleX150_2_flipHorizontal = imageCFC.flipHorizontal(scaleX150.img, "", "#myfilepath#\Images\_scaleX_150_flipHorizontal_#uploadedImage#", 400)> 

<!--- scaleX image to 300px wide --->
<cfset scaleX300 = imageCFC.scaleX("", "#myfilepath#\Images\#uploadedImage#", "", 300)>
<cfset scaleX300_2_rotated = imageCFC.rotate(scaleX300.img, "", "#myfilepath#\Images\_scaleX_300_rotated_#uploadedImage#", -90 )> 
<cfset scaleX300_2_flipHorizontal = imageCFC.flipHorizontal(scaleX300.img, "", "#myfilepath#\Images\_scaleX_300_flipHorizontal_#uploadedImage#", 400)>
<cfset fontDetails = StructNew()>
<cfset fontDetails.fontfile = "#myfilepath#\fonts\framd.ttf">
<cfset fontDetails.color = "white">
<cfset fontDetails.size = 10>
<!--- Take the scaleX 300 image and add text to it --->
<!--- The 2nd argument which is the input file will not be used --->
<!--- The 1st argument we will use to pass the image object to (to add text) --->
<cfset scaleX300_2 = imageCFC.addtext(scaleX300.img, "", "#myfilepath#\Images\_scaleX_300_marked_#uploadedImage#", 5, 5, fontDetails, "Sample Text")>

<!--- scaleX image to 640px wide --->
<cfset scaleX640 = imageCFC.scaleX("", "#myfilepath#\Images\#uploadedImage#", "", 640)>
<cfset fontDetails = StructNew()>
<cfset fontDetails.fontfile = "#myfilepath#\fonts\framd.ttf">
<cfset fontDetails.color = "white">
<cfset fontDetails.size = 20>
<!--- Take the scaleX 640 image and add text to it --->
<!--- The 2nd argument which is the input file will not be used --->
<!--- The 1st argument we will use to pass the image object to (to add text) --->
<cfset scaleX640_2 = imageCFC.addtext(scaleX640.img, "", "#myfilepath#\Images\_scaleX_640_marked_#uploadedImage#", 10, 10, fontDetails, "Sample Text")>
<cfset scaleX640_2_watermark = imageCFC.watermark(scaleX640.img,"" ,"","#myfilepath#\Images\sold.jpg",0.5,50, 50,"#myfilepath#\Images\_scaleX_640_waterMarked_#uploadedImage#")>

</cfif>
</body>
</html>
