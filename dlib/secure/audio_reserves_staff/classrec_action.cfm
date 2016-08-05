<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Class record</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">

<cfset missing=false>
<cfset Redirect="classrec.cfm?t=edit&classid=#form.classid#&listadd=no">
<cfif form.instructorID eq " "><cfset missing=true><cfset Redirect=Redirect&"&needinst"></cfif>
<cfif form.department eq " "><cfset missing=true><cfset Redirect=Redirect&"&needdept"></cfif>
<cfif missing><cflocation url="#Redirect#" addtoken="no"></cfif>

<cfquery name="check" datasource="#dsn#">
	select classes.instructorID, TAs, instructors.UCLA_ID from classes, instructors
	where classid=#form.classid#
	and classes.instructorID=instructors.instructorID
</cfquery>

<cfquery name="instructors" datasource="#dsn#">
	select instructors.UCLA_ID from instructors
	where instructorID=#form.instructorID#
</cfquery>

<cfset looper=1>
<cfset TAs=ArrayNew(1)>
<cfloop condition="structKeyExists(form,'TA#looper#')">
<cfif len(form["TA#looper#"])><cfscript>ArrayAppend(TAs,form["TA#looper#"]);</cfscript></cfif>
<cfset looper=looper+1>
</cfloop>

<cfif not structKeyExists(form,"confirmed")>
<cfif ((check.UCLA_ID eq session.user or ListContainsNoCase(check.TAs,session.user)) and (instructors.UCLA_ID neq session.user and not ListContainsNoCase(ArrayToList(TAs),session.user)))>
<form action="classrec_action.cfm" method="post">
<input type="hidden" name="confirmed">
<cfoutput>
<cfloop collection="#form#" item="looper">
<input type="hidden" name="#looper#" value="#form["#looper#"]#">
</cfloop>
<table><tr><td>
<h3>Please confirm that you want to remove yourself from this class. You will no longer be able to edit this class.</h3></td></tr>
<tr align="center"><td><input type="submit" value="OK"></td></tr></table>
</cfoutput>
</form>
<cfexit>
</cfif>
</cfif>

<cfquery name="upd" datasource="#dsn#">
update classes
	set
		instructorID='#form.instructorID#',
		department='#form.department#',
		classnumber='#form.classnumber#',
		srs='#form.srs#',
		title='#form.title#',
		year='#form.year#',
		quarter='#quarter#',
		password='#form.password#',
		facultyNote='#form.facultyNote#',
		TAs='#ArrayToList(TAs)#'
	where
		classid=#form.classid#
</cfquery>
<cflocation url="classrec.cfm?t=view&classid=#form.classid#&listadd=no" addtoken="No">

<cfinclude template="foot.cfm">

</body>
</html>