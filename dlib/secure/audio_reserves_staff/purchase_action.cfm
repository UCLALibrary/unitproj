<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Send purchase order</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<cfquery name="ordred" datasource="#dsn#">
update works
	set liborder=1
	where workid=#form.workid#
</cfquery>

<cfmail to="music-tech@library.ucla.edu"
        from="sdavison@library.ucla.edu"
        subject="DIGITAL AUDIO RESERVES PURCHASE REQUEST"
        cc="gtheil@library.ucla.edu,dgilbert@library.ucla.edu,sdavison@library.ucla.edu"
        server="em2.ad.ucla.edu">To: Music Library Technical Services
From: Digital Audio Reserves

Please purchase the following sound recording (compact disc) for the
#form.collection#. It is needed for audio reserves for the current quarter.

CHARGE TO: #form.collection#
LABEL/NUMBER: #label# #labelnumber#
COMPOSER: #form.composer#
TITLE: #form.title#
PERFORMERS: #form.performers#
NOTE: #form.note1#
NOTE: #form.note2#</cfmail>

<body>

<cfinclude template="head.cfm">

<table border="1" cellspacing="0" cellpadding="15"><tr><td>
<h3>PURCHASE REQUEST SENT:</h3>

<p><strong>To:</strong> Music Library Technical Services &lt;music-tech@library.ucla.edu&gt;<br>
<strong>From:</strong> Digital Audio Reserves</p>
<cfoutput>
<p><strong>Please purchase the following sound recording (compact disc) for the
#form.collection#. It is needed for audio reserves for the current quarter.</strong></p>

<table cellspacing="10" width="100%">
<tr><th align="right" width="120">Charge to:</th>
<td>#form.collection#</td></tr>
<tr><th align="right" width="120">Label &amp; Number:</th>
<td>#form.label# #form.labelnumber#</td></tr>
<tr><th align="right" width="120">Composer:</th>
<td>#form.composer#</td></tr>
<tr><th align="right" width="120">Title:</th>
<td>#form.title#</td></tr>
<tr><th align="right" width="120">Performers:</th>
<td>#form.performers#</td></tr>
<tr><th align="right" width="120">Note:</th>
<td>#form.note1#</td></tr>
<tr><th align="right" width="120">Note:</th>
<td>#form.note2#</td></tr>
<tr><td>&nbsp;</td><td></td></tr>
<tr><td></td><td></td></tr>
</table>
<a href="singlerec.cfm?ed=no&ited=no&id=#form.workid#" class="go2">RETURN</a>
</td></tr>
</table>
</cfoutput>



<cfinclude template="foot.cfm">

</body>
</html>
