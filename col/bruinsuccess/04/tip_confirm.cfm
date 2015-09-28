<cfparam name="HTTP_REFERER" default="">
<cfif not FindNoCase("tip_form.cfm", HTTP_REFERER) and 
      not FindNoCase("14.cfm", HTTP_REFERER)>
  <cflocation url="http://www.library.ucla.edu/bruinsuccess/" addtoken="No">
  <cfabort>
</cfif>
<cfparam name="no_tip" default="1">

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>Tips from Students</title>

<link rel="stylesheet" type="text/css" href="css/0400.css">
<link rel="stylesheet" type="text/css" href="../css/global.css">
<style type="text/css">	<!--
	body {
		background-image: url(images/04_background2.gif);
	}
	-->
</style>
<script language="javascript" src="../javascript/certificate_launch.js"></script>
<script language="JavaScript" type="text/javascript">
<!--
function goEnd() {
	location = "end.cfm";
}
//-->
</script>
</head>

<body>

<cfinclude template="../objects/navigation.cfm">
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr>
  <td></td>
  <td align="center"><img src="images/04_tips.gif" alt="Artwork Needed" width="251" height="70" border="0" style="margin: 12px 0 12px 0;"></td>
  <td></td>
 </tr>
 <tr valign="top">
  <td width="120" align="right" valign="bottom">
<!-- begin left column -->  

<!-- previous button -->
<a href="tip_form.cfm"><img src="images/04_previous.gif" alt="Previous" width="93" height="43" border="0" class="prev"></a>
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

</div>

<div id="live_area">
<div id="border_top"></div>

<div class="main_copy">
<!-- begin main page content -->

<cfif not no_tip>
<h2>
Your tip has been submitted.
</h2>

<div align="center">
<form>
<input type="button" value="Print my certificate of completion" class="form" onClick="JavaScript:OpenGenerator('04');goEnd();">
</form>
</div>

</cfif>

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
