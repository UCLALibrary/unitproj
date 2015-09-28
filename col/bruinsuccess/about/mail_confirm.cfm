<cfif not find("feedback.cfm", HTTP_REFERER)>
 <cflocation url="feedback.cfm" addtoken="no">
 <cfabort>
</cfif>
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

<h2>Thank you. Your Message Has Been Sent</h2>

<p>Go to:</p>

<ul>
<li><a href="../01/01.cfm">1. Intellectual Property</a></li>
<li><a href="../02/01.cfm">2. Need a File, Share a File</a></li>
<li><a href="../03/01.cfm">3. Citing & Documenting Resources</a></li>
<li><a href="../04/01.cfm">4. Avoiding Disaster</a></li>
<li><a href="../05/01.cfm">5. Don't Get Busted</a></li>
<li><a href="../07/01.cfm">Resources for Faculty</a></li>
<li><a href="../06/01.cfm">Resources for UCLA Students</a></li>
<li><a href="../about/index.cfm">What Is This Site?</a></li>
<li><a href="../about/credits.cfm">Who Made This?</a></li>
<li><a href="http://www.library.ucla.edu/bruinsuccess/">Home</a></li>
</ul>


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