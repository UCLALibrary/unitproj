<!--- Generate a couple of random numbers --->
<cfset randNums1 = #RandRange(1000,9999)#>
<cfset randNums2 = #RandRange(1000,9999)#>
<!--- List of Alphas we will use --->
<cfset alphas = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z">
<!--- Generate random numbers for different list element positions --->
<cfset randChar1 = #RandRange(1,26)#>
<cfset randChar2 = #RandRange(1,26)#>
<!--- Now we will store the random Alphas in vars --->
<cfset randAlpha1 = ListGetAt(alphas,randChar1,',')>
<cfset randAlpha2 = ListGetAt(alphas,randChar2,',')>
<!--- Create a string with your rand numbers and rand Alphas --->
<cfset finalVerify = "#randAlpha1#-#randNums1#-#randAlpha2#-#randNums2#">
<!--- Invoke image.cfc component --->
<cfset imageCFC = createObject("component","image") />
<!--- This struct is necessary to add the text to the image, make sure the correct path to the fontfile is used otherwise it won't work --->
<cfset fontDetails = StructNew()>
<cfset fontDetails.fontfile = "#ExpandPath(".")#/fonts/framd.ttf">
<cfset fontDetails.color = "maroon">
<cfset fontDetails.size = 18>
<!--- 
1st arg is for passing an image object, which we are not doing here
2nd arg is to pass the image and location to the CFC
3rd arg is the new image with the text placed on top of it 
4th arg is the position of the text on the image from left to right
5th arg is the position from the top
6th arg is the fontDetails struct from above
7th arg is the text to add 
--->
<cfset imgAddText = imageCFC.addtext("", "#ExpandPath(".")#/Images/bgdigits.jpg",  "#ExpandPath(".")#/Images/bgdigits2.jpg", 1, 0, fontDetails, "#finalVerify#")>
<html>
<head>
<title>Image Verification(For Form Submissions)</title>
</head>
<body>
	<form action="form.cfm" method="post">
		First Name: <input type="text" name="fName" /><br />
		Last Name: <input type="text" name="lName" /><br />
		<img src="images/bgdigits2.jpg"><br />
		<input type="text" name="finalVerify" />
		<input type="submit" value="Submit Info" />		
	</form>
</body>	
</html>