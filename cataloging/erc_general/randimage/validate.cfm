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

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
Validating...<br>

<cflock timeout=20 scope="Session" type="Readonly">
<!---cfif IsDefined("Session.finalVerify")>
	<cfif URL.pwd EQ Session.finalVerify>
	    <cfcookie name="WEBTOOL" value="UCLA">
		<cflocation url="http://unitdev.library.ucla.edu/cataloging/erc_general/webtool.cfm" addToken="No">
	<cfelse>
		<cflocation url="randimage2.cfm">
	</cfif>
<cfelse>
	Session expired... <br>
	Please click <a href="randimage2.cfm">here</a> to try again.
</cfif--->
		<!---
			Decrypt the captcha check value. Since this was
			submitted via a FORM, we have to be careful about
			attempts to hack it. Always put a Decrypt() call
			inside of a CFTry / CFCatch block.
		--->
		<cftry>

			<!--- Decrypt the check value. --->
			<cfset strCaptcha = Decrypt(
				FORM.captcha_check,
				"bots-aint-sexy",
				"CFMX_COMPAT",
				"HEX"
				) />

			<!---
				Check to see if the user-submitted value is
				the same as the decrypted CAPTCHA value.
				Remember, ColdFusion is case INsensitive with
				the EQ opreator.
			--->
			<cfif (strCaptcha EQ FORM.pwd)>

				<!---
					The user entered the correct text. Set the
					flag for future use.
				--->
				<cfcookie name="WEBTOOL" value="UCLA">
				<cflocation url="http://unitdev.library.ucla.edu/cataloging/erc_general/webtool.cfm" addToken="No">
			<cfelse>
				<cflocation url="randimage2.cfm">

			</cfif>

			<!--- Catch any errors. --->
			<cfcatch>

				<!--- Make sure the bot flag is set. --->
				<cflocation url="randimage2.cfm">

			</cfcatch>
		</cftry>

</cflock>
</body>
</html>
