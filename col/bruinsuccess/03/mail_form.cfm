<cfif not FindNoCase("16.cfm", HTTP_REFERER) and
      not FindNoCase("mail_action", HTTP_REFERER)>
  <cflocation url="15.cfm" addtoken="No">
  <cfabort>
<cfelseif not isDefined("FORM.totalQuestions") or
      not isDefined("FORM.finalScore") or
      not isDefined("FORM.grade")>
  <cflocation url="15.cfm" addtoken="No">
  <cfabort>
<cfelse>

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>Quiz-O-Rama</title>

<link rel="stylesheet" type="text/css" href="css/0300.css">
<link rel="stylesheet" type="text/css" href="../css/global.css">
<style type="text/css">	<!--
	body {
		background-image : url(images/03_quiz_bg.gif);
	}
	-->
</style>
<script language="JavaScript" src="javascript/form_validator.js" type="text/javascript"></script>
</head>

<body>

<cfinclude template="../objects/navigation.cfm">
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr>
  <td></td>
  <td align="center"><img src="images/03_15_quiztime.gif" alt="It's Quiztime!" width="485" height="112" border="0" style="margin: 0 0 0 0;"></td>
  <td></td>
 </tr>
 <tr valign="top">
  <td width="120" align="right" valign="bottom">
<!-- begin left column -->  

<!-- previous button -->
<cfoutput>
<form action="16.cfm" method="post">
<div id="previous">
<input type="image"
       src="images/03_previous.gif"
       alt="Previous"
       width="93"
       height="43"
       border="0">
<input type="hidden"
       name="totalQuestions"
       value="#FORM.totalQuestions#">
<input type="hidden"
       name="finalScore"
       value="#FORM.finalScore#">
<input type="hidden"
       name="grade"
       value="#FORM.grade#">
</div>
</form>
</cfoutput>



<!-- end left column -->
  </td>
  <td align="center">
   <table border="0" cellpadding="0" cellspacing="0">
    <tr>
     <td width="426" height="14" colspan="3"><img src="images/03_q_border_top.gif" width="426" height="14"></td>
    </tr>
    <tr valign="top">
     <td width="12" height="109"><img src="images/03_q_border_top_left.gif" width="12" height="109"></td>
     <td width="399" rowspan="3" bgcolor="#FFFFFF">
<div class="copy">
<!-- begin content -->  

<br>

<cfoutput>
<form action="mail_action.cfm" method="post" onSubmit="return validateForm(this)">
<p>
<strong>Name of person grade should be sent to:</strong><br>
<input type="text"
       name="naRec"
	   size="32"
	   maxlength="51"
	   class="form" 
       <cfif isDefined("FORM.naRec")>value="#FORM.naRec#"</cfif>>
</p>
<p>
<strong>Recipient's email address:</strong><br>
<input type="text"
       name="emailRec"
	   size="32"
	   maxlength="51"
	   class="form"
	   <cfif isDefined("FORM.emailRec")>value="#FORM.emailRec#"</cfif>>
</p>
<p>
<strong>Course title (if applicable):</strong><br>
<input type="text"
       name="course"
       size="32"
       maxlength="51"
       class="form"
	   <cfif isDefined("FORM.course")>value="#FORM.course#"</cfif>>
</p>
<p>
<strong>Your name:</strong><br>
<input type="text"
       name="naSend"
       size="32"
       maxlength="51"
       class="form"
	   <cfif isDefined("FORM.naSend")>value="#FORM.naSend#"</cfif>>
</p>
<p>
<strong>Your email address:</strong><br>
<input type="text"
       name="emailSend"
       size="32"
       maxlength="51"
       class="form"
	   <cfif isDefined("FORM.emailSend")>value="#FORM.emailSend#"</cfif>>
</p>
<input type="hidden" name="totalQuestions" value="#FORM.totalQuestions#">
<input type="hidden" name="finalScore" value="#FORM.finalScore#">
<input type="hidden" name="grade" value="#FORM.grade#">
<input type="submit" value="Send grade now" class="form">
</form>
</cfoutput>
<!-- end content -->
</div>
     </td>
     <td width="15" height="109"><img src="images/03_q_border_top_right.gif" width="15" height="109"></td>
    </tr>
    <tr>
 <!-- set area height here -->
     <td width="12" height="200" background="images/03_q_border_middle_left.gif"></td>
     <td width="15" background="images/03_q_border_middle_right.gif"></td>
    </tr>
    <tr valign="bottom">
     <td width="12" height="109"><img src="images/03_q_border_bottom_left.gif" width="12" height="109"></td>
     <td width="15" height="109"><img src="images/03_q_border_bottom_right.gif" width="15" height="109"></td>
    </tr>
    <tr>
     <td width="426" height="14" colspan="3"><img src="images/03_q_border_bottom.gif" width="426" height="14"></td>
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
  <td></td>
  <td align="center"><div class="logo">
<a href="http://www.library.ucla.edu/" target="_blank"><img src="images/03_ucla_logo.gif" alt="UCLA Library" width="86" height="73" border="0" ></a>
</div>
  </td>
  <td></td>
 </tr>
</table>
</body>
</html>
</cfif>