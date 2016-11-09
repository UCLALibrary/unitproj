<cfscript>
	if (FORM.cc_email neq "[list emails separated by commas]")
	{
		cc_email = FORM.cc_email;
	}
	else
	{
		cc_email = "";
	}
</cfscript>

<html>
<head>
<title>Thank You</title>
</head>
<body>
<center>
<h1>Thank You For Filling Out This Form</h1>
</center>
Below is what you submitted to erdb-newcat@library.ucla.edu on
<cfoutput>#DateFormat(Now(), "dddd, mmmm d, yyyy")#,
#TimeFormat(Now(), "HH:mm:ss")#</cfoutput>
<p>
<hr size=7 width=75%>
<p>
<cfoutput>
<strong>Your email:</strong> #FORM.email#<p>
<strong>Ordering unit:</strong> #FORM.unit#<p>
<strong>Other recipient(s):</strong> #FORM.cc_email#<p>

<strong>Title:</strong> #FORM.title#<p>
<strong>URL:</strong> #FORM.address#<p>
<strong>Voyager BIB ID:</strong> #FORM.bibid#<p>
<strong>Purchase Order ##:</strong> #FORM.po_num#<p>
<strong>Coverage/Edition/Date:</strong> #FORM.edition#<p>
<strong>ISSN/ISBN:</strong> #FORM.isbn#<p>
<strong>SFX Object ID:</strong> #FORM.sfx_id#<p>
<strong>Serials Solutions ID:</strong> #FORM.serials_id#<p>
<strong>Selector(s):</strong> #FORM.selectors#<p>
<strong>Package Title:</strong> #FORM.package#<p>

<strong>Resource type:</strong> #FORM.type#<p>
<strong>Priority:</strong> #FORM.priority#<p>
<strong>Notes:</strong> #FORM.summary#<p>

</cfoutput>
<!-- this sends the email version of the output -->
<cftry>
	<cfmail
		to="#FORM.email#"
		cc="#cc_email#"
		from="UCLA Library <no-reply@library.ucla.edu>"
		subject="#FORM.zsubject#"
		type="text/html">
Below is the result of your feedback form.  It was submitted on #DateFormat(Now(), "dddd, mmmm d, yyyy")#, #TimeFormat(Now(), "HH:mm:ss")#
<hr size=7 width=75%>
<strong>Your email:</strong> #FORM.email#<p>
<strong>Ordering unit:</strong> #FORM.unit#<p>
<strong>Other recipient(s):</strong> #FORM.cc_email#<p>
<strong>Title:</strong> #FORM.title#<p>
<strong>URL:</strong> #FORM.address#<p>
<strong>Voyager BIB ID:</strong> #FORM.bibid#<p>
<strong>Purchase Order ##:</strong> #FORM.po_num#<p>
<strong>Coverage/Edition/Date:</strong> #FORM.edition#<p>
<strong>ISSN/ISBN:</strong> #FORM.isbn#<p>
<strong>SFX Object ID:</strong> #FORM.sfx_id#<p>
<strong>Serials Solutions ID:</strong> #FORM.serials_id#<p>
<strong>Selector(s):</strong> #FORM.selectors#<p>
<strong>Package Title:</strong> #FORM.package#<p>
<strong>Resource type:</strong> #FORM.type#<p>
<strong>Priority:</strong> #FORM.priority#<p>
<strong>Notes:</strong> #FORM.summary#<p>
<hr size=7 width=75%>
	</cfmail>

	<cfmail
		to="#FORM.zrecipient#"
		from="UCLA Library <no-reply@library.ucla.edu>"
		subject="#FORM.zsubject#"
		type="text/html">
Below is the result of your feedback form.  It was submitted on #DateFormat(Now(), "dddd, mmmm d, yyyy")#, #TimeFormat(Now(), "HH:mm:ss")#
<hr size=7 width=75%>
<strong>Submitter email:</strong> #FORM.email#<p>
<strong>Ordering unit:</strong> #FORM.unit#<p>
<strong>Other recipient(s):</strong> #FORM.cc_email#<p>
<strong>Title:</strong> #FORM.title#<p>
<strong>URL:</strong> #FORM.address#<p>
<strong>Voyager BIB ID:</strong> #FORM.bibid#<p>
<strong>Purchase Order ##:</strong> #FORM.po_num#<p>
<strong>Coverage/Edition/Date:</strong> #FORM.edition#<p>
<strong>ISSN/ISBN:</strong> #FORM.isbn#<p>
<strong>SFX Object ID:</strong> #FORM.sfx_id#<p>
<strong>Serials Solutions ID:</strong> #FORM.serials_id#<p>
<strong>Selector(s):</strong> #FORM.selectors#<p>
<strong>Package Title:</strong> #FORM.package#<p>
<strong>Resource type:</strong> #FORM.type#<p>
<strong>Priority:</strong> #FORM.priority#<p>
<strong>Notes:</strong> #FORM.summary#<p>
<hr size=7 width=75%>
	</cfmail>

	<cfcatch type="Any">
		<span>Error!</span>
		<div>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr valign="top">
					<td class="first">Certificate information email send failure.</td>
				</tr>
			</table>
		</div>
	</cfcatch>
</cftry>

<!---cffile
    action = "upload"
    destination = "f:\Inetpub\Development\unitproj\cataloging\erc_general\uploads\"
    fileField = "#FORM.upfile#"--->
<p>
<hr size=7 width=75%>
<p>
</body>
</html>
