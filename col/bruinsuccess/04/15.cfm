<cfquery name="getTip" datasource = #dsn_np#>
SELECT *
FROM Tips
ORDER BY Update_DT DESC, TipID DESC
</cfquery>

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>Tips from Students</title>

<link rel="stylesheet" type="text/css" href="css/0400.css">
<link rel="stylesheet" type="text/css" href="../css/global.css">
<style type="text/css">	<!--
	body {
		background-image: url(images/04_background3.gif);
	}
	-->
</style>
<script language="javascript" src="../javascript/certificate_launch.js"></script>
<cfinclude template="../objects/js_Menu_Global.cfm">
</head>


<body>

<cfinclude template="../objects/navigation.cfm">
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr>
  <td></td>
  <td align="center"><img src="images/04_tips.gif" alt="Tips from Students" width="251" height="70" border="0" style="margin: 12px 0 12px 0;"></td>
  <td></td>
 </tr>
 <tr valign="top">
  <td width="120" align="right" valign="bottom">
<!-- begin left column -->  

<!-- previous button -->
<a href="" onClick="this.href='JavaScript:history.back();'"><img src="images/04_previous.gif" alt="Previous" width="93" height="43" border="0" class="prev"></a>
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
The following are tips on studying & researching, juggling busy schedules, tackling multiple assignments, resources to know about, and whatever else other students thought would be helpful. Have a tip you'd like to share? <a href="tip_form.cfm">Send it to us</a> and we'll post it on this web site.
</p>


<cfif getTip.recordcount neq 0>

<cfoutput query="getTip">
<p>
<strong>#tipTitle#</strong><br>
#tip#
</p>
<p class="citation">
Submitted by: #na#<br>
On: #DateFormat(Update_DT, "mmmm d, yyyy")#
</p>



</cfoutput>

<cfelse>
<h2>Currently there are no tips</h2>
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