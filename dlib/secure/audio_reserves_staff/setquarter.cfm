<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Set quarter</title></title>
</head>

<cfquery name="currentquarter" datasource="#dsn#">
select year, quarter from currentquarter
</cfquery>
<cfset currentq=currentquarter.quarter>
<cfset currenty=currentquarter.year>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">

<h3>Set current quarter</h3>

<p><cfif isdefined("url.m")>
	<cfif url.m eq "done">
		<font color="#FF0000">Quarter changed.</font>
	</cfif>
</cfif>
Quarter currently set to: <strong><cfoutput>#currentq# #currenty#</cfoutput></strong></p>

<p>Changing the current quarter will change the classes that
display on the public website.</p>

<form action="setquarter_action.cfm" method="post">
<p>Change the current quarter to:&nbsp;&nbsp;&nbsp;
<select name="newquarter">
<option value="Fall-<cfoutput>#year(now())#</cfoutput>"<cfif currentq is "Summer"> selected</cfif>>Fall&nbsp;&nbsp;&nbsp;<cfoutput>#year(now())#</cfoutput></option>
<option value="Winter-<cfoutput>#year(now())#</cfoutput>">Winter&nbsp;&nbsp;&nbsp;<cfoutput>#year(now())#</cfoutput></option>
<option value="Spring-<cfoutput>#year(now())#</cfoutput>"<cfif currentq is "Winter"> selected</cfif>>Spring&nbsp;&nbsp;&nbsp;<cfoutput>#year(now())#</cfoutput></option>
<option value="Summer-<cfoutput>#year(now())#</cfoutput>"<cfif currentq is "Spring"> selected</cfif>>Summer&nbsp;&nbsp;&nbsp;<cfoutput>#year(now())#</cfoutput></option>
<option value="Fall-<cfoutput>#year(now())+1#</cfoutput>">Fall&nbsp;&nbsp;&nbsp;<cfoutput>#year(now())+1#</cfoutput></option>
<option value="Winter-<cfoutput>#year(now())+1#</cfoutput>"<cfif currentq is "Fall"> selected</cfif>>Winter&nbsp;&nbsp;&nbsp;<cfoutput>#year(now())+1#</cfoutput></option>
<option value="Spring-<cfoutput>#year(now())+1#</cfoutput>">Spring&nbsp;&nbsp;&nbsp;<cfoutput>#year(now())+1#</cfoutput></option>
<option value="Summer-<cfoutput>#year(now())+1#</cfoutput>">Summer&nbsp;&nbsp;&nbsp;<cfoutput>#year(now())+1#</cfoutput></option>
</select>&nbsp;&nbsp;&nbsp;
<input type="submit" value="Select">
</form>

<cfinclude template="foot.cfm">

</body>
</html>
