<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>Fact or Fiction?</title>

<link rel="stylesheet" type="text/css" href="css/0200.css">
<link rel="stylesheet" type="text/css" href="../css/global.css">
<style type="text/css">	<!--
	body {
		background-image : url(images/02_quiz_bg.gif);
	}
	#q1a {
		position : absolute;
		visibility: hidden;
		color: #4d7bb0;
		width : 360px
	}
	#q1b {
		position : absolute;
		visibility: hidden;
		color: #4d7bb0;
		width : 360px
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
  <td align="center"><img src="images/02_quiz.gif" alt="Fact or Fiction?" width="475" height="120" border="0" style="margin:0 25px 0 0;"></td>
  <td></td>
 </tr>
 <tr>
  <td width="120" align="right" valign="bottom">
<!-- begin left column -->  

<!-- previous button -->
<a href="06.cfm"><img src="images/02_previous.gif" alt="Previous" width="92" height="43" border="0" class="prev"></a>
<!-- end left column -->
  </td>
  <td align="center">
   <table border="0" cellpadding="0" cellspacing="0">
    <tr>
     <td width="426" height="14" colspan="3"><img src="images/02_q_border_top.gif" width="426" height="14"></td>
    </tr>
    <tr valign="top">
     <td width="12" height="109"><img src="images/02_q_border_top_left.gif" width="12" height="109"></td>
     <td width="399" rowspan="3" bgcolor="#FFFFFF">
<div class="copy">
<!-- begin content -->  

<br>


<p>
Think you know about file sharing? Let's find out how much you really know. Don't worry&mdash;no one is tracing you.
</p>
<p>
<span class="quiz_number">Question 1 of 5:</span>
File sharing is always unethical or illegal.
</p>
<form>
<input type="radio" name="1" value="yes" class="form" onClick="JavaScript:QuizClick('q1a');QuizOff('q1b');"><strong> a. Fact</strong><br><br>
<input type="radio" name="1" value="no" class="form" onClick="JavaScript:QuizClick('q1b');QuizOff('q1a');"><strong> b. Fiction</strong>

</form>
<div class="quiz_a">
<div id="q1a">
<p>
No, file sharing is not <em>always</em> unethical or illegal. There are a lot of legitimate and legal uses of file sharing programs. Downloading an entire season of <em>South Park</em> is not one of them.
</p>
</div>
<div id="q1b">
<p>Right, file sharing is not <em>always</em> unethical or illegal. There are a lot of legitimate and legal uses of file sharing programs. Downloading an entire season of <em>South Park</em> is not one of them.</p>
</div>


<!-- end content -->
     </div></td>
     <td width="15" height="109"><img src="images/02_q_border_top_right.gif" width="15" height="109"></td>
    </tr>
    <tr>
 <!-- set area height here -->
     <td width="12" height="150" background="images/02_q_border_middle_left.gif"></td>
     <td width="15" background="images/02_q_border_middle_right.gif"></td>
    </tr>
    <tr valign="bottom">
     <td width="12" height="109"><img src="images/02_q_border_bottom_left.gif" width="12" height="109"></td>
     <td width="15" height="109"><img src="images/02_q_border_bottom_right.gif" width="15" height="109"></td>
    </tr>
    <tr>
     <td width="426" height="14" colspan="3"><img src="images/02_q_border_bottom.gif" width="426" height="14"></td>
    </tr>
   </table>
  </td>
  <td width="204" align="left" valign="bottom">
<!-- begin right column -->

<!-- next button -->
<a href="0702.cfm"><img src="images/02_next.gif" alt="Next" width="68" height="44" border="0" class="next"></a>

<!-- end right column -->  
  </td>
 </tr>
 <tr>
 <tr>
  <td></td>
  <td align="center"><div class="logo">
<a href="http://www.library.ucla.edu/" target="_blank"><img src="images/02_ucla_logo.gif" alt="UCLA Library" width="86" height="73" border="0" ></a>
</div>
</td>
  <td></td>
 </tr>
</table>
</body>
</html>
