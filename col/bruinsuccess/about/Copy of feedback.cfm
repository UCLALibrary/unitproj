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

<h1>Say What?</h1>

<p>
Use the following form to submit any questions, comments or suggestions.  You can also contact Pauline Swartz at 310-825-6522. 
</p>

<cfoutput>
<form action="mail_action.cfm" method="post" onSubmit="return validateForm(this)">
<p>
<strong>Your name:</strong><br>
<input type="text"
       name="na"
       size="32"
       maxlength="51"
       class="form"
	   <cfif isDefined("FORM.na")>value="#FORM.naSend#"</cfif>>
</p>
<p>
<strong>Your email address:</strong><br>
<input type="text"
       name="email"
       size="32"
       maxlength="51"
       class="form"
	   <cfif isDefined("FORM.email")>value="#FORM.emailSend#"</cfif>>
</p>
<p>
<strong>Your comment/question:</strong><br>
<textarea cols="32"
          rows="4"
          name="message"
          class="form"
		  <cfif isDefined("FORM.message")>value="#FORM.emailSend#"</cfif>></textarea>
</p>

<input type="submit" value="Send" class="form">
</form>
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
