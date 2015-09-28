<cfif not FindNoCase("mail_form", HTTP_REFERER)>
  <cfset status = -1>
</cfif>
<cfset FieldValue = StructNew()>
<cfloop collection="#Form#" item="VarName">
  <cfif not FindNoCase("fieldnames", LCase(VarName))>
    <cfset val = StructInsert(FieldValue, "#VarName#", "#Form[VarName]#")>
  </cfif>
</cfloop>
<cfif not isDefined("FORM.na") or
      not isDefined("FORM.email") or
	  not isDefined("FORM.tipTitle") or
	  not isDefined("FORM.tip")>
  <cfset status = -1>
<cfelse>
  <cfif FORM.na is "" or
        FORM.email is "" or
	    FORM.tipTitle is "" or
	    FORM.tip is "">
    <cfset status = -1>
  <cfelse>
    <cfset status = 1>
  </cfif>
</cfif>

<cfif status gt 0>
 <cfmail to="simonlee83@library.ucla.edu" from="#FORM.email#" subject="New Tip in Bruin Success with Less Stress">Simon:

A new tip has been submitted. Please review. Send Stephen any necessary changes.

 

Submitted on: #DateFormat(Now(), "mmm dd, yyyy")# at #TimeFormat(Now(), "hh:mm tt")#
  </cfmail>

  <cfquery name="insertTip" datasource = #dsn_np#>
INSERT INTO Tips (
    <cfset i = 1>
    <cfloop collection="#FieldValue#" item="Value">
      <cfoutput>
      <cfif i gt 1>, </cfif>#Value#
        <cfset i = i + 1>
      </cfoutput>
    </cfloop>
)
VALUES (
    <cfset i = 1>
    <cfloop collection="#FieldValue#" item="Value">
      <cfoutput>
      <cfif i gt 1>, </cfif>'#Replace(FieldValue[Value], "'", "''")#'
        <cfset i = i + 1>
      </cfoutput>
    </cfloop>
)
  </cfquery>
  <cflocation url="tip_confirm.cfm?no_tip=0" addtoken="No">
<cfelse>
<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Submit a Tip Confirmation</title>
<link rel="stylesheet" type="text/css" href="css/0400.css">
<link rel="stylesheet" type="text/css" href="../css/global.css">
<style type="text/css">	<!--
	BODY {
		background-image: url(images/04_background2.gif);
	}
	#live_area {
		top : 96px;
		background-image : url(images/04_border.gif);
		background-repeat : repeat-y;
	}
	.main_copy {
		margin : 1.5em;
	}
	-->
</style>
</head>
<body>
<cfinclude template="navigation.cfm">
<div id="live_area">
<div id="border_top"></div>
<div class="main_copy">
<!-- begin main page content -->

<h2>Error</h2>

<p>
One or more of the required fields were left blank in the form you submitted. Make sure you include the following information:
</p>

<ul>
<li>Your name</li>
<li>Your email address</li>
<li>The title of your tip</li>
<li>Your tip</li>
</ul>
<cfoutput>
<div align="center">  
<form action="tip_form.cfm" method="post">
<input type="submit" value="Return to form" class="form">
  <cfloop collection="#FieldValue#" item="VarName">
<input type="hidden" name="#VarName#" value="#FieldValue[VarName]#">  
    </cfloop>
</form>
</div>
</cfoutput>

<!-- end main page content -->
</div>
<div id="border_bottom"></div>
<!-- footer -->
<div id="footer">
&nbsp;
</div>
</div>
</body>
</html>


  
  
</cfif>
  


  