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

<cflock timeout=20 scope="Session" type="Exclusive">
	<cfparam name="Session.finalVerify" default="">
</cflock>

<cfsilent>
	<!---
		Create the array of valid characters. Leave out the
		numbers 0 (zero) and 1 (one) as they can be easily
		confused with the characters o and l (respectively).
	--->
	<cfset arrValidChars = ListToArray(
		"A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z," &
		"2,3,4,5,6,7,8,9"
		) />

	<!--- Now, shuffle the array. --->
	<cfset CreateObject(
		"java",
		"java.util.Collections"
		).Shuffle(
			arrValidChars
			)
		/>

	<!---
		Now that we have a shuffled array, let's grab the
		first 8 characters as our CAPTCHA text string.
	--->
	<cfset strCaptcha = (
		arrValidChars[ 1 ] &
		arrValidChars[ 2 ] &
		arrValidChars[ 3 ] &
		arrValidChars[ 4 ] &
		arrValidChars[ 5 ] &
		arrValidChars[ 6 ] &
		arrValidChars[ 7 ] &
		arrValidChars[ 8 ]
		) />


	<!---
		At this point, we have picked out the CAPTCHA string
		that we want the users to ender. However, we don't
		want to pass that text anywhere in the form otherwise
		a spider might be able to scrape it. Thefefore, we now
		want to encrypt this value into our check field.
	--->
	<cfset FORM.captcha_check = Encrypt(
		strCaptcha,
		"bots-aint-sexy",
		"CFMX_COMPAT",
		"HEX"
		) />
</cfsilent>


<html>
<head><title>Validation Page</title>
<meta http-equiv="Expires" CONTENT="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Pragma" CONTENT="no-cache">
<meta http-equiv="cache-control" VALUE="no-cache, no-store, must-revalidate">
<meta http-equiv="Expires" content="-1">
</head>

<body bgcolor="#ffffff">
	<cfoutput>
	<form name="validate" action="validate.cfm" method="post">
		Please input the password below:
		<br>
		<input type="text" name="pwd" value="">
		<input type="text" name="nothing" value="" style="display: none;">
		<input type="submit" name="submit_button" value="Submit">
		<input type="hidden" name="captcha_check" value="#FORM.captcha_check#"/>
	</form>
	<!--img id="captcha" src="image.cfm"-->
	<cfimage
		action="captcha"
		height="75"
		width="363"
		text="#strCaptcha#"
		difficulty="medium"
		fonts="verdana,arial,times new roman,courier"
		fontsize="28"
	/>
	</cfoutput>
</body>
<head>
<meta http-equiv="Expires" CONTENT="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Pragma" CONTENT="no-cache">
<meta http-equiv="cache-control" VALUE="no-cache, no-store, must-revalidate">
<meta http-equiv="Expires" content="-1">
</head>
</html>