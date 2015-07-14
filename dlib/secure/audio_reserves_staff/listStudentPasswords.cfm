<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Classes</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">

<cfquery name="currentquarter" datasource="#dsn#">
select year, quarter from currentquarter
</cfquery>
<cfset currentq=currentquarter.quarter>
<cfset currenty=currentquarter.year>

<cfquery name="srch" datasource="#dsn#">
select * from classes
where year='#currenty#' and quarter='#currentq#'
order by department,classnumber,title
</cfquery>

<h4>CURRENT LISTENING LISTS</h4>

<h3><cfoutput>#currentq# #currenty#</cfoutput></h3>

<table border="1"
       cellspacing="0"
       cellpadding="2">

<tr>
	<th>Instructor</th>
	<th>Department/No.</th>
	<th>Title</th>
	<th>Password</th>
</tr>

<cfoutput query="srch">

<tr>
	<td>#instructor#</td>
	<td>#department# #classnumber#</td>
	<td>#title#</td>
	<td>#password#</td>
</tr>

</cfoutput>

</table>



<cfinclude template="foot.cfm">

</body>
</html>
