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

<html>
<head><title>Random Image?</title>
<meta http-equiv="Expires" CONTENT="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Pragma" CONTENT="no-cache">
<meta http-equiv="cache-control" VALUE="no-cache, no-store, must-revalidate">
<meta http-equiv="Expires" content="-1">
</head>

<body bgcolor="#ffffff">

	<form name="validate" action="validate.cfm" method="get">
		Please input the password below:
		<br>
		<input type="text" name="pwd" value="">
		<input type="text" name="nothing" value="" style="display: none;">
		<input type="submit" name="submit_button" value="Submit">
	</form>
	<img id="captcha" src="image.cfm">
</body>
<head>
<meta http-equiv="Expires" CONTENT="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Pragma" CONTENT="no-cache">
<meta http-equiv="cache-control" VALUE="no-cache, no-store, must-revalidate">
<meta http-equiv="Expires" content="-1">
</head>
</html>