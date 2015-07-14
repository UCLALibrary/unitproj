<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Instructor record</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<body>

<cfset checklog=false>

<cfinclude template="head.cfm">

<cfif form.instructor eq "">

<cflocation url="instructors.cfm?t=list&msg=1" addtoken="No">

<cfelse>

<cfif form.t is "new">
	<cfif checklog>
		<cfquery name="checklogin" datasource="#dsn#">
		select UCLA_ID from instructors
		where UCLA_ID='#form.username#'
		</cfquery>
		<cfif checklogin.recordCount><cflocation url="instructors.cfm?t=#form.t#&msg=2" addtoken="No"></cfif>
	</cfif>
	<cfquery name="newinstr" datasource="#dsn#">
	insert into instructors(instructor, UCLA_ID) values('#ucase(form.instructor)#','#lcase(form.username)#')
	</cfquery>
<cfelse>
	<cfif checklog>
		<cfquery name="checklogin" datasource="#dsn#">
		select UCLA_ID from instructors
		where (id<>#form.id# and UCLA_ID='#form.username#')
		</cfquery>
		<cfif checklogin.recordCount><cflocation url="instructors.cfm?t=#form.t#&id=#form.id#&msg=2" addtoken="No"></cfif>
	</cfif>
	<cfif not structKeyExists(form,"confirmed")>
		<cfquery name="instructors" datasource="#dsn#">
			select instructors.UCLA_ID from instructors
			where instructorID=#form.id#
		</cfquery>
		<cfif (instructors.UCLA_ID eq session.user and form.username neq session.user)>
			<form action="instructor_action.cfm" method="post">
			<input type="hidden" name="confirmed">
			<cfoutput>
			<cfloop collection="#form#" item="looper">
				<input type="hidden" name="#looper#" value="#form["#looper#"]#">
			</cfloop>
			<table><tr><td>
			<h3>Please confirm that you want to no longer be associated with this instructor.</h3></td></tr>
			<tr align="center"><td><input type="submit" value="OK"></td></tr></table>
			</cfoutput>
			</form>
			<cfexit>
		</cfif>
	</cfif>
	
	<cfquery name="updinstr" datasource="#dsn#">
	update instructors
		set
			instructor='#ucase(form.instructor)#',
			UCLA_ID='#lcase(form.username)#'
		where
			instructorID=#form.id#
	</cfquery>
</cfif>

<cflocation url="instructors.cfm?t=list&msg=0" addtoken="No">

</cfif>

<cfinclude template="foot.cfm">

</body>
</html>