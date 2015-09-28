<cfparam name="mdle" default="0">
<cfparam name="nam" default="">
<cfset ThisDateTime = DateFormat(Now(), "mmmm d, yyyy")>


<cfif nam is "">
 <cflocation url="form.cfm?mdle=#mdle#" addtoken="No">
<cfelse>

<cfinclude template="module_names.cfm">

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>Certificate of Completion</title>

<link rel="stylesheet" type="text/css" href="css/0100.css">
<style type="text/css">	<!--
	body {
		margin : 0px;
	}
	#letter_head {
		top : 0;
		left : 0;
		width : 600px;
		height : 250px;
		z-index : -1;	
	}
	#live_area {
		top : 80px;
		left : 48px;
		width : 350px;
		height : 250px;
	}
	.main_copy {
		margin : 1.5em;
	}
	-->
</style>
<script language="JavaScript">
<!--
if (window.print) {
    window.print();
}
//-->
</script>
</head>

<body>
<cfoutput>
<div id="letter_head"><img src="images/bg_certificate.gif" alt="Certificate of Completion" width="600" height="250" border="0"></div>

<div id="live_area">
<div class="main_copy">
<!-- begin main page content -->
<div align="center">
<p>
Be it hereby known that<br><br>

<strong>
#nam#
</strong><br><br>

<p>
has completed the&nbsp;

<strong>
#module#
</strong>

&nbsp;module of Bruin Success with Less Stress on #ThisDateTime#.
 


</p>
</div>



</p>




<!-- end main page content -->
</div>

<!-- footer -->
<div id="footer">

&nbsp;

</div>

</div>


</cfoutput>
</body>
</html>

</cfif>