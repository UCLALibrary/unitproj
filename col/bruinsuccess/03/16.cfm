<cfif not FindNoCase("quiz.cfm", HTTP_REFERER) and
      not FindNoCase("mail_form.cfm", HTTP_REFERER)>
  <cflocation url="15.cfm" addtoken="No">
  <cfabort>
<cfelse>
<cfparam name="finalScore" default=FORM.finalScore>
<cfparam name="totalQuewstions" default=#FORM.totalQuestions#>
<cfset percentage = #NumberFormat(((finalScore / totalQuestions) * 100), "___")#>
<cfif percentage gt 89>
  <cfset grade = "A">
<cfelseif percentage gt 79 and percentage lt 90>
  <cfset grade = "B">
<cfelseif percentage gt 69 and percentage lt 80>
  <cfset grade = "C">
<cfelseif percentage gt 59 and percentage lt 70>
  <cfset grade = "D">
<cfelse>
  <cfset grade = "F">
</cfif>

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
<script language="JavaScript" src="../javascript/quiz.js" type="text/javascript"></script>
<cfinclude template="../objects/js_Menu_Global.cfm">
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
<a href="15.cfm"><img src="images/03_previous.gif" alt="Previous" width="93" height="43" border="0" class="prev"></a>
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
<p>
You got <strong>#finalScore#</strong> out of <strong>#totalQuestions#</strong> questions right. That's<br>
</p>
<p class="grade">
#percentage#%
</p>
<p>
for a grade of
</p>
<p class="grade">
#grade#
</p>
</cfoutput>

<p>
Would you like to email your grade to somebody?
</p>
<div align="center">
<table>
<tr>
<form action="mail_form.cfm" method="post">
	<td>
<input type="submit" value="Yes" class="form">
	</td>
<cfoutput>
<input type="hidden" name="finalScore" value="#finalScore#">
<input type="hidden" name="totalQuestions" value="#totalQuestions#">
<input type="hidden" name="grade" value="#grade#">
</cfoutput>
</form>
<form action="end.cfm" method="post">
	<td>
<input type="submit" value="No" class="form">
<input type="hidden" name="no_mail" value="1">
	</td>
</form>
</tr>
</table>
</div>

<cfif grade is "b" or
      grade is "c" or
      grade is "d" or
      grade is "f">
<p>
<a href="15.cfm">Retake the quiz to see if you can score higher.</a>
</p>
</cfif>


<!-- end content -->
</div>
     </td>
     <td width="15" height="109"><img src="images/03_q_border_top_right.gif" width="15" height="109"></td>
    </tr>
    <tr>
 <!-- set area height here -->
     <td width="12" height="150" background="images/03_q_border_middle_left.gif"></td>
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