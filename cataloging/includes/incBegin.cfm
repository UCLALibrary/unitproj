<cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>UCLA Library | Cataloging and Meta Data Center<cfif pageTitle neq ""> | #pageTitle#</cfif></title>
<link href="http://www.library.ucla.edu/css/global<cfif prt>_print</cfif>.css" rel="stylesheet" type="text/css">
<link href="http://www.library.ucla.edu/css/wht.css" rel="stylesheet" type="text/css">
<link href="/css/index.css" rel="stylesheet" type="text/css" hreflang="en">
<script language="JavaScript" src="http://www.library.ucla.edu/javascript/index.js" type="text/javascript"></script>
<script language="JavaScript" src="http://www.library.ucla.edu/javascript/questions.js" type="text/javascript"></script>
</head>
<body>
<div id="header">

<cfif not prt>
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td width="600">
</cfif>

<div><a href="http://www.library.ucla.edu">
<img src="http://www.library.ucla.edu/images/logo_<cfif prt>wht_bar<cfelse>blu_bar</cfif>.gif"
alt="UCLA Library" width="150" height="35" border="0"></a><a href="<cfif CGI.PATH_INFO DOES NOT CONTAIN "cataloging/index.cfm">../</cfif>index.cfm">
<img src="http://www.library.ucla.edu/images/b_cataloging<cfif prt>_prt</cfif>.gif"
width="229" height="35" border="0" alt="Cataloging and Metadata Center"></a></div>

<cfif not prt>
		</td>
		<td width="150"><a href="http://www.library.ucla.edu/questions/index.cfm"
		onmouseout="turnOff('questions')" onmouseover="turnOn('questions')">
		<img src="http://www.library.ucla.edu/images/b_questions_0.gif"
		alt="Questions? Ask Us!" name="image1" width="150" height="35" border="0" id="questions"></a></td>
	 </tr>
</table>
</cfif>
</div>
<cfif not prt>


<script language="JavaScript1.2" type="text/javascript">
<!--
dqm__codebase = "http://www.library.ucla.edu/menus/script/" //script folder location
//-->
</script>
<script language="JavaScript1.2" src="http://www.library.ucla.edu/menus/data_Global.js" type="text/javascript"></script>
<script language="JavaScript1.2" src="http://www.library.ucla.edu/menus/script/dqm_loader.js" type="text/javascript"></script>



<div id="menu_global">
<!---	changed table width below from 750 to 770 to allow cell with menu items to fit.
		temporary fix - would be more appropriate to use javascript menus which open automatically,
		as on www2.
		2006-04-05 akohler
--->


<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
	 <tr>
		  <td align="center"><a href="http://www.library.ucla.edu/search/index.cfm">
		  <img src="http://www.library.ucla.edu/images/m_Search_blk.gif"
		  alt="Search and Find" name="menu0" width="150" height="25" border="0"
id="menu0"></a><a href="http://www.library.ucla.edu/service/index.cfm"><img
src="http://www.library.ucla.edu/images/m_Services_blk.gif"
  alt="Services" name="menu1" width="150" height="25" border="0" id="menu1"></a>
  <a href="http://www.library.ucla.edu/libraries/index.cfm">
  <img src="http://www.library.ucla.edu/images/m_Libraries_blk.gif"
  alt="Libraries and Collections" name="menu2" width="150" height="25" border="0" id="menu2"></a>
  <a href="http://www.library.ucla.edu/about/index.cfm">
  <img src="http://www.library.ucla.edu/images/m_About_blk.gif"
  alt="About" name="menu3" width="150" height="25" border="0" id="menu3"></a>
  <a href="http://www.library.ucla.edu/news/index.cfm"><img src="http://www.library.ucla.edu/images/m_News_blk.gif"
  alt="News, Events, Exhibits" name="menu4" width="150" height="25" border="0" id="menu4"></a>
  </td>
	</tr>
</table>


<!-- 
<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr>

<td align="center"><a href="/search/index.cfm"><img src="http://www.library.ucla.edu/images/m_Search_blk.gif" alt="Search and Find" name="menu0" width="150" height="25" border="0"
id="menu0" onMouseOver="showMenu(event)" onMouseOut="hideMenu(event)"></a>

<a href="http://www.library.ucla.edu/service/index.cfm"><img
src="http://www.library.ucla.edu/images/m_Services_blk.gif" alt="Services" name="menu1" width="150" height="25" border="0" id="menu1"
onMouseOver="showMenu(event)" onMouseOut="hideMenu(event)"></a>

<a href="/libraries/index.cfm"><img
src="http://www.library.ucla.edu/images/m_Libraries_blk.gif" alt="Libraries and Collections" name="menu2" width="150" height="25" border="0" id="menu2"
onMouseOver="showMenu(event)" onMouseOut="hideMenu(event)"></a>

<a href="/about/index.cfm"><img
src="http://www.library.ucla.edu/images/m_About_blk.gif" alt="About" name="menu3" width="150" height="25" border="0" id="menu3"
onMouseOver="showMenu(event)" onMouseOut="hideMenu(event)"></a>

<a href="/news/index.cfm"><img
src="http://www.library.ucla.edu/images/m_News_blk.gif" alt="News, Events, Exhibits" name="menu4" width="150" height="25" border="0" id="menu4"
onMouseOver="showMenu(event)" onMouseOut="hideMenu(event)"></a></td>
 </tr>
</table>
-->

</div>
<div id="live_area">
<!-- begin live area -->
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td width="750" height="50" class="b0010">
</cfif>
		<h1><cfif pageTitle neq "">#pageTitle#<cfelse>
		#sectionTitle#
		</cfif></h1>
<cfif not prt>
		</td>
	</tr>
</table>
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr valign="top">
		<td width="150" class="b0100">
			<table width="149" border="0" cellpadding="0" cellspacing="0">
				<tr valign="top">
					<td width="149" height="20" align="left"><cfif not Find("cataloging/index.cfm", PATH_INFO)>
					<a href="../index.cfm"><img src="http://www.library.ucla.edu/images/i_up_level_0.gif"
					alt="Go up one level" width="7" height="7" border="0" hspace="10"></a></cfif>&nbsp;
					</td>
				</tr>
			</table>
<cfinclude template="incNavLinks.cfm">

	  </td>
  		<td width="600">
 <a href="#SCRIPT_NAME#?prt=1" target="_blank">
 <img src="http://www.library.ucla.edu/images/i_print_blk.gif"
 alt="Printer-friendly page" width="13" height="12" hspace="0" vspace="6" border="0" align="right"></a>
</cfif>
<div class="copy">
</cfoutput>







