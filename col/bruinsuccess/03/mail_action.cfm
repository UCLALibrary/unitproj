<cfif not FindNoCase("mail_form", HTTP_REFERER)>
  <cfset status = -1>
</cfif>
<cfset FieldValue = StructNew()>
<cfloop collection="#Form#" item="VarName">
  <cfif not FindNoCase("fieldnames", LCase(VarName))>
    <cfset val = StructInsert(FieldValue, "#VarName#", "#Form[VarName]#")>
  </cfif>
</cfloop>
<cfif not isDefined("FORM.emailRec") or
      not isDefined("FORM.emailSend") or
	  not isDefined("FORM.naRec") or
	  not isDefined("FORM.naSend")>
  <cfset status = -1>
<cfelse>
  <cfif FORM.emailRec is "" or
        FORM.emailSend is "" or
	    FORM.naRec is "" or
	    FORM.naSend is "">
    <cfset status = -1>
  <cfelse>
    <cfset status = 1>
  </cfif>
</cfif>

<cfif status gt 0>
  <cfmail to="#FORM.emailRec#" from="#FORM.emailSend#" subject="Bruin Success with Less Stress Quiz Grade">#FORM.naRec#:

#FORM.naSend# got #FORM.finalScore# out of #FORM.totalQuestions# possible questions correct for a final grade of #FORM.grade# on the "Citing & Documenting Sources" module of Bruin Success with Less Stress.

Quiz taken on: #DateFormat(Now(), "mmm dd, yyyy")# at #TimeFormat(Now(), "hh:mm tt")#
  </cfmail>
  <cflocation url="end.cfm?no_mail=0" addtoken="No">
<cfelse>
<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Mail Confirmation</title>
<link rel="stylesheet" type="text/css" href="css/0300.css">
<link rel="stylesheet" type="text/css" href="../css/global.css">
<style type="text/css">	<!--
	BODY {
		background-image: url(images/03_background2.gif);
	}
	#live_area {
		top : 96px;
		background-image : url(images/03_border.gif);
		background-repeat : repeat-y;
	}
	.main_copy {
		margin : 1.5em;
	}
	-->
</style>
</head>
<body>
<cfinclude template="navigation.cfm">
<div id="live_area">
<div id="border_top"></div>
<div class="main_copy">
<!-- begin main page content -->

<h2>Error</h2>

<p>
One or more of the required fields were left blank in the form you submitted. Make sure you include the following information:
</p>

<ul>
<li>Name of person grade should be sent to</li>
<li>Recipient's email address</li>
<li>Your name</li>
<li>Your email address</li>
</ul>
<cfoutput>
<div align="center">  
<form action="mail_form.cfm" method="post">
<input type="submit" value="Return to form" class="form">
  <cfloop collection="#FieldValue#" item="VarName">
<input type="hidden" name="#VarName#" value="#FieldValue[VarName]#">  
    </cfloop>
</form>
</div>
</cfoutput>

<!-- end main page content -->
</div>
<div id="border_bottom"></div>
<!-- footer -->
<div id="footer">
&nbsp;
</div>
</div>
</body>
</html>


  
  
</cfif>
  


  