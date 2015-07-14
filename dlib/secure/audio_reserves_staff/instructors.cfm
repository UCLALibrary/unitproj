<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Instructor record</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">

<cfif url.t is "list">

	<p>
	
	<cfif url.msg is 1>
	<font color="red">INSTRUCTOR NAME IS BLANK: NO ACTION TAKEN</font></p>
	<p>
	</cfif>

	<cfquery name="instr" datasource="#dsn#">
	select * from instructors
	order by instructor
	</cfquery>

	<cfoutput query="instr">
	<a href="instructors.cfm?t=view&id=#instructorID#">#instructor#</a><br>
	</cfoutput>

	<br>
	<cfif trim(session.acctype) neq "readonly">
	<a href="instructors.cfm?t=new" class="go2">ADD NEW INSTRUCTOR</a>
	</cfif>
	</p>
	
<cfelse>

	<cfif url.t is "view" or url.t is "edit">
		<cfquery name="selinstr" datasource="#dsn#">
		select * from instructors
		where instructorID=#url.id#
		</cfquery>
		<cfoutput query="selinstr">
			<cfset variables.instructor=selinstr.instructor>
			<cfset variables.id=selinstr.instructorID>
			<cfset variables.UCLA_ID=selinstr.UCLA_ID>
		</cfoutput>
	<cfelseif url.t is "new">
		<cfset variables.instructor="">
		<cfset variables.UCLA_ID="">
	</cfif>

	<cfif url.t neq "view">
	<form action="instructor_action.cfm"
	      method="post">
	</cfif>

	<cfif structKeyExists(url,"msg")>
		<cfif url.msg is 2>
			<font color="red">USERNAME ALREADY IN USE: NO ACTION TAKEN</font></p>
			<p>
		</cfif>
	</cfif>

	<h4>INSTRUCTOR INFORMATION</h4>

	<cfoutput>

	<table border="0"
	       cellspacing="2"
	       cellpadding="2">
	<tr valign="top">
		<th align="right">Instructor:</th>
		<td>
		<cfif url.t is "view">
			#variables.instructor#
		<cfelse>
			<input type="text" name="instructor" value="#variables.instructor#" size="100" maxlength="100">
			<input type="hidden" name="t" value="#url.t#">
			<cfif url.t is "edit">
			<input type="hidden" name="id" value="#variables.id#">
			</cfif>
		</cfif>
		</td></tr>
		<tr valign="top">
		<th align="right">UCLA ID:</th>
		<td>
		<cfif url.t is "view">
			#variables.UCLA_ID#
		<cfelse>
			<input type="text" name="username" value="#variables.UCLA_ID#" size="100" maxlength="50">
		</cfif>
		</td>
		</th>
	</tr>
	<tr><td>&nbsp;</td><td></td></tr>
	<tr valign="top">
		<td colspan="2">
			<cfif url.t is "view">
			<cfif trim(session.acctype) neq "readonly" or trim(session.user) eq trim(variables.UCLA_ID)><a href="instructors.cfm?t=edit&id=#variables.id#" class="go2">EDIT RECORD<a></cfif>
			<cfelse>
			<input type="submit" value="SAVE RECORD">
			</cfif>
		</td>
	</tr>
	</table>

	</cfoutput>
	
	<cfif url.t neq "view">
		</form>
	</cfif>

</cfif>

<cfinclude template="foot.cfm">

</body>
</html>
