<cfif not FindNoCase("mail_form", HTTP_REFERER)>
  <cfset status = -1>
</cfif>
<cfset FieldValue = StructNew()>
<cfloop collection="#Form#" item="VarName">
  <cfif not FindNoCase("fieldnames", LCase(VarName))>
    <cfset val = StructInsert(FieldValue, "#VarName#", "#Form[VarName]#")>
  </cfif>
</cfloop>
<cfif not isDefined("FORM.na") or
      not isDefined("FORM.email") or
	  not isDefined("FORM.message")>
  <cfset status = -1>
<cfelse>
  <cfif FORM.na is "" or
        FORM.email is "" or
	    FORM.message is "">
    <cfset status = -1>
  <cfelse>
    <cfset status = 1>
  </cfif>
</cfif>

<cfif status gt 0>
  <cfmail to="simonlee83@library.ucla.edu" from="#FORM.email#" subject="Bruin Success with Less Stress">Simon:

The following comment/question was submitted from the Bruin Success with Less Stress Tutorial.

#message#

From: #na#
Email: #email#

Submitted on: #DateFormat(Now(), "mmm dd, yyyy")# at #TimeFormat(Now(), "hh:mm tt")#
  </cfmail>
  <cflocation url="mail_confirm.cfm" addtoken="No">
<cfelse>

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>Say What?</title>

<link rel="stylesheet" type="text/css" href="css/ab.css">
<link rel="stylesheet" type="text/css" href="../css/global.css">
<style type="text/css">	<!--
	body {
		background-image: url(images/ab_background1.gif);
	}
	-->
</style>
<script src="../javascript/comment_validator.js" type="text/javascript"></script>
<cfinclude template="../objects/js_Menu_Global.cfm">
</head>


<body>

<cfinclude template="../objects/navigation.cfm">
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:25px;">
 <tr>
  <td width="120" align="right" valign="bottom">
<!-- begin left column -->  

<!-- previous button -->
&nbsp;  
<!-- end left column -->
  </td>
  <td>
   <table width="426" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
     <td><img src="images/ab_border_top.gif" width="426" height="19"></td>
    </tr>
    <tr>
     <td background="images/ab_border.gif">
<div class="copy">
<!-- begin content -->  

<h1>Oops!</h1>

<p>
One or more of the required fields were left blank in the form you submitted. Make sure you include the following information:
</p>

<ul>
<li>Your name</li>
<li>Your email address</li>
<li>Your comment/question</li>
</ul>
<cfoutput>
<div align="center">  
<form action="feedback.cfm" method="post">
<input type="submit" value="Return to form" class="form">
  <cfloop collection="#FieldValue#" item="VarName">
<input type="hidden" name="#VarName#" value="#FieldValue[VarName]#">  
    </cfloop>
</form>
</div>
</cfoutput>


<!-- end content -->
</div>
     </td>
    </tr>
    <tr>
     <td><img src="images/ab_border_bottom.gif" width="426" height="19"></td>
    </tr>
   </table>
  </td>
  <td width="204" align="left" valign="bottom">
<!-- begin right column -->

<!-- next button -->
&nbsp;
  
<!-- end right column -->  
  </td>
 </tr>
 <tr>
 <tr>
  <td></td>
  <td align="center"><div class="logo">
<a href="http://www.library.ucla.edu/" target="_blank"><img src="images/ab_ucla_logo.gif" alt="UCLA Library" width="86" height="73" border="0" ></a>
</div>
</td>
  <td></td>
 </tr>
</table>
</body>
</html>
</cfif>