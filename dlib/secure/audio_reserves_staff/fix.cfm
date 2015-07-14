<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Fix Classes</title>
    <style type="text/css">
<!--
.red {color: #FF0000}
-->
    </style>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">

<cfquery name="instructors" datasource="#dsn#">
select * from instructors order by instructor
</cfquery>

<cfloop query="instructors">
<cfset teacher["#instructor#"]=ID>
</cfloop>

<cfquery name="classes" datasource="#dsn#">
select * from classes
</cfquery>

<cfset good=true>

<h4>Use Instructor ID instead of name</h4>
<cfloop query="classes">
<cfoutput>For class #ClassID#, I will replace <cfif len(instructor)>#instructor#<cfelse><cfset good=false><span class="red">nobody</span></cfif> with <cfif structKeyExists(teacher,"#instructor#")>#teacher["#instructor#"]#<cfelse><cfset good=false><span class="red">undefined</span></cfif><br></cfoutput>
<!--- <cfquery name="upd" datasource="#dsn#">
update classes
			set 
				instructor=#teacher["#instructor#"]#
			where 
				ClassID=#classes.ClassID#
</cfquery> --->

</cfloop>

<h1><cfif good>Looks good<cfelse><span class="red">You might want to fix things first</span></cfif></h1>

<cfinclude template="foot.cfm">

</body>
</html>
