<cfparam name="HTTP_REFERER" default="">
<cfif not FindNoCase("mail_form.cfm", HTTP_REFERER) and 
      not FindNoCase("16.cfm", HTTP_REFERER)>
  <cflocation url="http://www.library.ucla.edu/bruinsuccess/" addtoken="No">
  <cfabort>
</cfif>
<cfparam name="no_mail" default="1">

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>Finished!</title>

<link rel="stylesheet" type="text/css" href="css/0300.css">
<link rel="stylesheet" type="text/css" href="../css/global.css">
<style type="text/css">	<!--
	body {
		background-image: url(images/03_background1.gif);
	}
	-->
</style>
<cfinclude template="../objects/js_Menu_Global.cfm">
</head>

<body>

<cfinclude template="../objects/navigation.cfm">
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr>
  <td></td>
  <td align="center"><img src="images/03_finished.gif" alt="Finished!" width="164" height="106" border="0" style="margin: 10px 0 10px 0;"></td>
  <td></td>
 </tr>
 <tr valign="top">
  <td width="120" align="right" valign="bottom">
<!-- begin left column -->  

<!-- previous button -->
<a href="" onClick="this.href='JavaScript:history.back();'"><img src="images/03_previous.gif" alt="Previous" width="93" height="43" border="0" class="prev"></a>
<!-- end left column -->
  </td>
  <td>
   <table width="426" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
     <td><img src="images/03_border_top.gif" width="426" height="19"></td>
    </tr>
    <tr>
     <td background="images/03_border.gif">
<div class="copy">
<!-- begin content -->  

<cfif not no_mail>
<h2>
Your quiz results have been sent.
</h2>
</cfif>

<p>
You have just completed the following module of Bruin Success with Less Stress:
</p>

<ul>
<li><strong>3. Citing & Documenting Sources</strong></li>
</ul>

<p>
Select another module:
</p>

<ul>
<li><a href="../01/01.cfm">1. Intellectual Property</a></li>
<li><a href="../02/01.cfm">2. Need a File, Share a File</a></li>
<li>3. Citing & Documenting Sources</li>
<li><a href="../04/01.cfm">4. Avoiding Disaster</a></li>
<li><a href="../05/01.cfm">5. Don't Get Busted</a></li>
</ul>

<p>
Or go to:
</p>

<ul>
<li><a href="../06/01.cfm">More Resources for UCLA Students</a></li>
<li><a href="http://www.library.ucla.edu/bruinsuccess/">Home</a></li>
</ul>


<!-- end content -->
</div>
     </td>
    </tr>
    <tr>
     <td><img src="images/03_border_bottom.gif" width="426" height="19"></td>
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