<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>Whaddya Think?</title>

<link rel="stylesheet" type="text/css" href="css/0100.css">
<link rel="stylesheet" type="text/css" href="../css/global.css">
<style type="text/css">	<!--
	body {
		background-image : url(images/01_quiz_bg.gif);
	}
	#q1a {
		position : absolute;
		visibility : hidden;
		background-color : white;
		color : #ee4010;
		width : 360px;
	}
	#q1b {
		position : absolute;
		visibility : hidden;
		color: #ee4010;
		width : 360px;
	}
	-->
</style>
<script language="JavaScript1.2" src="../javascript/quiz.js" type="text/javascript"></script>
<cfinclude template="../objects/js_Menu_Global.cfm">
</head>

<body>

<cfinclude template="../objects/navigation.cfm">
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr>
  <td></td>
  <td align="center"><img src="images/01_11_quiztime.gif" alt="It's Quiztime!" width="485" height="112" border="0" style="margin: 10px 0 10px 0;"></td>
  <td></td>
 </tr>
 <tr valign="top">
  <td width="120" align="right" valign="bottom">
<!-- begin left column -->

<!-- previous button -->
<a href="1001.cfm"><img src="images/01_previous.gif" alt="Previous" width="93" height="43" border="0" class="prev"></a>
<!-- end left column -->
  </td>
  <td align="center">
  
  
   <table width="426" border="0" cellpadding="0" cellspacing="0">
    <tr>
     <td width="426" height="14" colspan="3"><img src="images/01_q_border_top.gif" width="426" height="14"></td>
    </tr>
    <tr valign="top">
     <td width="12" height="110"><img src="images/01_q_border_top_left.gif" width="12" height="110"></td>
     <td width="399" rowspan="3" bgcolor="#FFFFFF">
<div class="copy">
<!-- begin content -->

<br>

<p>
Think you know about intellectual property? Let's find out!
</p>

<h2>What do you think about the following scenarios?</h2>


<p>
<span class="quiz_number">Question 1 of 6:</span>
Eddie doodles in the margin of his notebook during class. Are his doodles protected by intellectual property laws?
<form>
<input type="radio" name="1" value="yes" class="form" onClick="JavaScript:QuizClick('q1a');QuizOff('q1b');"><strong> a. Yes</strong><br><br>
<input type="radio" name="1" value="no" class="form" onClick="JavaScript:QuizClick('q1b');QuizOff('q1a');"><strong> b. No</strong>
</form>
</p>


<div class="quiz_a">
 <div id="q1a">
<p>
That's right! Even doodles as original expressions are protected. 
</p>
 </div>
 <div id="q1b">
<p>So wrong. Try again.</p>
 </div>
</div>
<!-- end content -->
</div>
    </td>
     <td width="15" height="110"><img src="images/01_q_border_top_right.gif" width="15" height="110"></td>
    </tr>
    <tr>
 <!-- set area height here -->
     <td width="12" height="150" background="images/01_q_border_middle_left.gif"></td>
     <td width="15" background="images/01_q_border_middle_right.gif"></td>
    </tr>
    <tr valign="bottom">
     <td width="12" height="109"><img src="images/01_q_border_bottom_left.gif" width="12" height="109"></td>
     <td width="15" height="109"><img src="images/01_q_border_bottom_right.gif" width="15" height="109"></td>
    </tr>
    <tr>
     <td width="426" height="14" colspan="3"><img src="images/01_q_border_bottom.gif" width="426" height="14"></td>
    </tr>
   </table>
   
   
   
   
   
  </td>
  <td width="204" align="left" valign="bottom">
<!-- begin right column -->

<!-- next button -->
<a href="1102.cfm"><img src="images/01_next.gif" alt="Next" width="68" height="44" border="0" class="next"></a>

<!-- end right column -->  
  </td>
 </tr>
 <tr>
  <td></td>
  <td align="center"><div class="logo">
<a href="http://www.library.ucla.edu/" target="_blank"><img src="images/01_ucla_logo.gif" alt="UCLA Library" width="86" height="73" border="0" ></a>
</div>
  </td>
  <td></td>
 </tr>
</table>
</body>
</html>
