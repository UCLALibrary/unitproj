<cfparam name="mdle" default="0">

<cfinclude template="module_names.cfm">

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>Certificate of Completion</title>

<link rel="stylesheet" type="text/css" href="css/0100.css">
<style type="text/css">	<!--
	BODY {
		margin : 0px;
		background-image : url(images/bg_form.gif);
		background-repeat : no-repeat;
	}
	#live_area {
		top : 24px;
		left : 0;
		width : 600px;
		height : 226px;
	}
	.main_copy {
		margin : 1.5em;
	}
	-->
</style>
<script language="javascript" src="../javascript/certificate_form.js"></script>
</head>

<body>

<div id="live_area">
<div class="main_copy">
<!-- begin main page content -->

<cfoutput>
<p align="center">
<strong>Congratulations!</strong>  You have completed the&nbsp;<strong>#module#</strong>&nbsp;module.  Please enter your name below as you would like it to appear on your certificate.
<form action="certificate.cfm" method="post" name="CertificateGenerator" id="CertificateGenerator" onSubmit="return validateForm(this)">
<input type="text" name="nam" size="32" maxlength="100"><br><br>
<input type="hidden" name="mdle" value="#mdle#">
<input type="submit" value="Print my Certificate" class="form">
</form>
</p>
</cfoutput>

<!-- end main page content -->
</div>

<!-- footer -->
<div id="footer">

&nbsp;

</div>

</div>



</body>
</html>
