<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Classes</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">

<cfquery name="srch" datasource="#dsn#">
select instructors.*, classes.* from instructors, classes
where classes.instructorID=instructors.instructorID
<cfif url.ord is "in">
order by instructors.instructor,department,classnumber
<cfelseif url.ord is "cl">
order by department,classnumber,title
<cfelseif url.ord is "yr">
order by year desc,quarter,instructors.instructor,department,classnumber
<cfelseif url.ord is "qr">
order by quarter,year,department,classnumber
<cfelseif url.ord is "ti">
order by title
<cfelse>
order by classid
</cfif>
</cfquery>

<h4>CLASS LISTENING LISTS</h4>

<p>Click on column headings to sort.</p>
<cfif trim(session.acctype) neq "readonly">
<p><a href="classrec.cfm?t=new&listadd=no" class="go2">NEW CLASS</a></p>
</cfif>
<table border="1"
       cellspacing="0"
       cellpadding="2">

<tr>
	<th><a href="classes.cfm?ord=id" class="head">ID</th>
	<th><a href="classes.cfm?ord=yr" class="head">Year</th>
	<th><a href="classes.cfm?ord=qr" class="head">Quarter</th>
	<th><a href="classes.cfm?ord=in" class="head">Owner</th>
	<th><a href="classes.cfm?ord=cl" class="head">Department/No.</th>
	<th><a href="classes.cfm?ord=ti" class="head">Title</th>
	<th>Password</th>
</tr>

<cfoutput query="srch">

<tr>
	<td><a href="classrec.cfm?t=view&classid=#classid#&listadd=no">#classid#</a></td>
	<td>#year#</td>
	<td>#quarter#</td>
	<td>#instructor#</td>
	<td>#department# #classnumber#</td>
	<td><a href="classrec.cfm?t=view&classid=#classid#&listadd=no">#title#</a></td>
	<td><cfif len(#password#) and ((trim(session.acctype) neq "readonly") or (session.user eq UCLA_ID) or (ListContainsNoCase(TAs,session.user)))>#password#<cfelse>&nbsp;</cfif></td>
</tr>

</cfoutput>

</table>

<cfinclude template="foot.cfm">

</body>
</html>
