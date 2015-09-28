<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>Send Us Your Tips</title>

<link rel="stylesheet" type="text/css" href="css/0400.css">
<link rel="stylesheet" type="text/css" href="../css/global.css">
<style type="text/css">	<!--
	body {
		background-image: url(images/04_background2.gif);
	}
	-->
</style>
<script language="JavaScript" src="../javascript/certificate_launch.js" type="text/javascript"></script>
<script language="JavaScript" src="javascript/tip_validator.js" type="text/javascript"></script>
</head>

<body>

<cfinclude template="../objects/navigation.cfm">
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr>
  <td></td>
  <td align="center"><img src="images/04_sendtips.gif" alt="Send Us Your Tips" width="268" height="94" border="0" style="margin: 12px 0 12px 0;"></td>
  <td></td>
 </tr>
 <tr valign="top">
  <td width="120" align="right" valign="bottom">
<!-- begin left column -->  

<!-- previous button -->
<a href="14.cfm"><img src="images/04_previous.gif" alt="Previous" width="93" height="43" border="0" class="prev"></a>
<!-- end left column -->
  </td>
  <td>
   <table width="426" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
     <td><img src="images/04_border_top.gif" width="426" height="19"></td>
    </tr>
    <tr>
     <td background="images/04_border.gif">
<div class="copy">
<!-- begin content -->  

<p>
Send us your tips on studying & researching, juggling busy schedules, tackling multiple assignments, resources to know about, and whatever else you think will help other students. 
</p>


<form action="tip_action.cfm" method="post" name="tip_submitter" onSubmit="return validateForm(this)">
<p>
<strong>Your name</strong><br>
<input type="text" name="na" size="32" maxlength="51" class="form">
</p>
<p>
<strong>Email address</strong><br>
<input type="text" name="email" size="32" maxlength="51" class="form">
</p>
<p>
<strong>Title of your tip</strong><br>
<input type="text" name="tipTitle" size="32" maxlength="51" class="form">
</p>
<p>
<strong>Your tip</strong><br>
<textarea cols="36" rows="4" name="tip" class="form"></textarea>
</p>
<div align="center">
<input type="submit" value="Submit my tip" class="form">
</div>
</form>

<!-- end content -->
</div>
     </td>
    </tr>
    <tr>
     <td><img src="images/04_border_bottom.gif" width="426" height="19"></td>
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
<a href="http://www.library.ucla.edu/" target="_blank"><img src="images/04_ucla_logo.gif" alt="UCLA Library" width="86" height="73" border="0" ></a>
</div>
  </td>
  <td></td>
 </tr>
</table>
</body>
</html>
