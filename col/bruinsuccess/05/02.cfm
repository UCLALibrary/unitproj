
<cfparam name="q1" default="">
<cfparam name="q2" default="">
<cfparam name="q3" default="">

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>Where Do You Stand?</title>

<link rel="stylesheet" type="text/css" href="css/0500.css">
<link rel="stylesheet" type="text/css" href="../css/global.css">
<style type="text/css">	<!--
	body {
		background-image: url(images/05_background2.gif);
	}
	-->
</style>
<script language="JavaScript" src="javascript/analysis_validator.js" type="text/javascript"></script>
<cfinclude template="../objects/js_Menu_Global.cfm">
</head>


<body>

<cfinclude template="../objects/navigation.cfm">
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr>
  <td></td>
  <td align="center"><img src="images/05_02_hed.gif" alt="Where Do You Stand?" width="270" height="39" border="0" style="margin: 25px 0 25px 0;"></td>
  <td></td>
 </tr>
 <tr valign="top">
  <td width="120" align="right" valign="bottom">
<!-- begin left column -->  

<!-- previous button -->
<a href="01.cfm"><img src="images/05_previous.gif" alt="Previous" width="93" height="43" border="0" class="prev"></a>
<!-- end left column -->
  </td>
  <td>
   <table width="426" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
     <td><img src="images/05_border_top.gif" width="426" height="19"></td>
    </tr>
    <tr>
     <td background="images/05_border.gif">
<div class="copy">
<!-- begin content -->  

<p>
Carlos and Eddie obviously don't share the same views about their approach to academics. Where do you stand? Answer the questions and see where you fall. (This is just for fun, so relax and enjoy.) 
</p>

<form action="analysis.cfm" method="post" onSubmit="return validateForm(this)">

<p>
<span class="quiz_number">1.</span> I've used or would use bestessays.com or other web sites where I could get free or purchase completed assignments and papers online.
</p>
<p>
<input type="radio" name="q1" value="a" class="form" <cfif q1 is "a">checked</cfif>> a. That's me.<br>
<input type="radio" name="q1" value="b" class="form" <cfif q1 is "b">checked</cfif>> b. Only if I'm desperate.<br>
<input type="radio" name="q1" value="c" class="form" <cfif q1 is "c">checked</cfif>> c. I'd never use these kinds of sites.
</p>


<p>
<span class="quiz_number">2.</span> If the assignment is lame or tedious, why should I have to suffer? I would:
</p>
<p>
<input type="radio" name="q2" value="a" class="form" <cfif q2 is "a">checked</cfif>> a. Find a completed assignment and copy it.<br>
<input type="radio" name="q2" value="b" class="form" <cfif q2 is "b">checked</cfif>> b. Just not do it. It's just a small percentage of my grade anyway.<br>
<input type="radio" name="q2" value="c" class="form" <cfif q2 is "c">checked</cfif>> c. Suck it up and do the assignment.
</p>


<p>
<span class="quiz_number">3.</span> I have way too much to do and not enough time to write my paper&mdash;which is due tomorrow! My plan of action is to...
</p>
<p>
<input type="radio" name="q3" value="a" class="form" <cfif q3 is "a">checked</cfif>> a. Copy and paste from web pages and/or online articles.<br>
<input type="radio" name="q3" value="b" class="form" <cfif q3 is "b">checked</cfif>> b. Start brewin' a strong pot of coffee and just turn in whatever I have done by the deadline.<br>
<input type="radio" name="q3" value="c" class="form" <cfif q3 is "c">checked</cfif>> c. Are you kidding? I'm a pro at managing my time and I'd never get stuck in this situation.<br>
</p>


<div align="center">
<input type="submit" value="Where do I stand?" class="form">
</div>
</form>

<!-- end content -->
</div>
     </td>
    </tr>
    <tr>
     <td><img src="images/05_border_bottom.gif" width="426" height="19"></td>
    </tr>
   </table>
  </td>
  <td width="204" align="left" valign="bottom">
<!-- begin right column -->

<!-- next button -->
<a href="03.cfm"><img src="images/05_next.gif" alt="Next" width="68" height="44" border="0" class="next"></a>

<!-- end right column -->  
   </td>
 </tr>
 <tr>
  <td></td>
  <td align="center"><div class="logo">
<a href="http://www.library.ucla.edu/" target="_blank"><img src="images/05_ucla_logo.gif" alt="UCLA Library" width="86" height="73" border="0" ></a>
</div>
  </td>
  <td></td>
 </tr>
</table>
</body>
</html>
