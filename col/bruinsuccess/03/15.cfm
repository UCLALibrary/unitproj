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
	.quiz_a {
		position : relative;
		width : 300px
	}
	#q1a {
		position : absolute;
		visibility: hidden;
		left : 60px;
		color: #ee4010;
		width : 300px
	}
	#q1b {
		position : absolute;
		visibility : hidden;
		left : 60px;
		color: #ee4010;
		width : 300px
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
  <td align="center"><img src="images/03_15_quiztime.gif" alt="Quiz-O-Rama" width="485" height="112" border="0" style="margin: 0 0 0 0;"></td>
  <td></td>
 </tr>
 <tr valign="top">
  <td width="120" align="right" valign="bottom">
<!-- begin left column -->  

<!-- previous button -->
<a href="14.cfm"><img src="images/03_previous.gif" alt="Previous" width="93" height="43" border="0" class="prev"></a>
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


<p>
Now that Eddie knows a little bit more about writing, citing, and documenting, help him make some choices. Give it your all&mdash;you will be graded! 
</p>

<div align="center">
<form>
<input type="button" value="Begin Quiz" class="form" onClick="parent.location='quiz.cfm'">
</form>
</div>


<!-- end content -->
</div>
     </td>
     <td width="15" height="109"><img src="images/03_q_border_top_right.gif" width="15" height="109"></td>
    </tr>
    <tr>
 <!-- set area height here -->
     <td width="12" background="images/03_q_border_middle_left.gif"></td>
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
