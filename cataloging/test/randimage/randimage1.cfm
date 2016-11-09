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

<CFHEADER name="Expires" value="06 Nov 1994 08:49:37 GMT">
<CFHEADER name="Pragma" value="no-cache">
<CFHEADER name="cache-control" value="no-cache, no-store, must-revalidate">
<!--- Generate a couple of random numbers --->
<cfset randNums1 = RandRange(1000,9999)>
<cfset randNums2 = RandRange(1000,9999)>
<!--- List of Alphas we will use --->
<cfset alphas = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z">
<!--- Generate random numbers for different list element positions --->
<cfset randChar1 = RandRange(1,26)>
<cfset randChar2 = RandRange(1,26)>
<cfset randChar3 = RandRange(1,26)>
<cfset randChar4 = RandRange(1,26)>
<!--- Now we will store the random Alphas in vars --->
<cfset randAlpha1 = ListGetAt(alphas,randChar1,',')>
<cfset randAlpha2 = ListGetAt(alphas,randChar2,',')>
<cfset randAlpha3 = ListGetAt(alphas,randChar3,',')>
<cfset randAlpha4 = ListGetAt(alphas,randChar4,',')>
<!--- Create a string with your rand numbers and rand Alphas --->
<!--- <cfset finalVerify = "#randAlpha1#-#randNums1#-#randAlpha2#-#randNums2#"> --->
<cfset finalVerify = "#randAlpha1##randAlpha2##randAlpha3##randAlpha4#">
<!--- Invoke image.cfc component --->
<cfset imageCFC = createObject("component","image") />
<!--- This struct is necessary to add the text to the image, make sure the correct path to the fontfile is used otherwise it won't work --->
<cfset fontDetails = StructNew()>
<cfset fontDetails.fontfile = "#ExpandPath(".")#/fonts/framd.ttf">
<cfset fontDetails.color = "maroon">
<cfset fontDetails.size = 80>
<!--- 
    1st arg is for passing an image object, which we are not doing here
    2nd arg is to pass the image and location to the CFC
    3rd arg is the new image with the text placed on top of it 
    4th arg is the position of the text on the image from left to right
    5th arg is the position from the top
    6th arg is the fontDetails struct from above
    7th arg is the text to add 
--->
<cfset imgAddText = imageCFC.addtext("", "#ExpandPath(".")#/Images/bgdigits.jpg", "#ExpandPath(".")#/Images/bgdigits2.jpg", 70, 0, fontDetails, "#finalVerify#")>

<cfif IsDefined("FORM.submit_button")>
	<cfset prev_pwd = Client.random_pwd>
</cfif>

<cfset Client.random_pwd = finalVerify>

<cfif IsDefined("FORM.submit_button")>
	<cfif FORM.pwd EQ prev_pwd>
		<cflocation url="http://unitdev.library.ucla.edu/cataloging/test/webtool3.cfm" addToken="No">
	<cfelse>
		<cfset Client.random_pwd = finalVerify>
		<cfset Client.initialLoad = 1>
	</cfif>	
</cfif>

<html>
<head><title>Random Image?</title>
<meta http-equiv="Expires" CONTENT="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Pragma" CONTENT="no-cache">
<meta http-equiv="cache-control" VALUE="no-cache, no-store, must-revalidate">
<meta http-equiv="Expires" content="-1">
</head>

<body bgcolor="#ffffff">

<cfif IsDefined("FORM.submit_button")>
	Previous password is: <cfoutput>#prev_pwd#</cfoutput>
</cfif>
<br>
Current password is: <cfoutput>#Client.random_pwd#</cfoutput>
	<form name="validate" action="randimage2.cfm" method="post">
		Please input the password below:
		<br>
		<input type="text" name="pwd" value="">
		<input type="text" name="nothing" value="" style="display: none;">
		<input type="submit" name="submit_button" value="Submit">
	</form>
	<img src="images/bgdigits2.jpg">
</body>
<head>
<meta http-equiv="Expires" CONTENT="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Pragma" CONTENT="no-cache">
<meta http-equiv="cache-control" VALUE="no-cache, no-store, must-revalidate">
<meta http-equiv="Expires" content="-1">
</head>
</html>