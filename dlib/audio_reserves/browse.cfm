<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Audio, Search</title>
</head>

<cfset session.reservelist="no">
<cfif #form.bfield# is "composer">
	<cfset bfieldlabel="Composer">
<cfelseif #form.bfield# is "title">
	<cfset bfieldlabel="Title">
<cfelseif #form.bfield# is "performers">
	<cfset bfieldlabel="Performers">
<cfelseif #form.bfield# is "label">
	<cfset bfieldlabel="Label">
<cfelseif #form.bfield# is "labelnumber">
	<cfset bfieldlabel="Label number">
<cfelseif #form.bfield# is "librarycallnumber">
	<cfset bfieldlabel="Library call number">
<cfelseif #form.bfield# is "classinfo">
	<cfset bfieldlabel="Class-specific info.">
	<cfset session.reservelist="yes">
</cfif>

<cfquery name="browse" datasource="#dsn#">
	select works.#form.bfield# from works, items
		where not #form.bfield#=''
			and items.EncFormat=7
			and works.workid=items.workid
			<!--- and 
			(
			left(works.librarycallnumber,3)='CDA'
			or left(works.librarycallnumber,2)='LP'
			) --->
		group by works.#form.bfield#
		order by works.#form.bfield#
</cfquery>
<body bgcolor="ffffff">

<cfinclude template="staffuseonly.cfm">

<form action="result2.cfm" method="post">

<table border="2" cellpadding="15" bgcolor="#C0C0C0" width="100%"><tr><td>

<table border="0" cellspacing="5" cellpadding="5" bgcolor="#C0C0C0">
<tr><td><cfoutput><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>#ucase(bfieldlabel)#</b></font></td>
</tr><tr><td>
<input type="hidden" name="bfield" value="#form.bfield#"></cfoutput>
<select name="bsearch">
	<cfoutput query="browse">
	<cfif form.bfield is "composer">
	<option value="#left(browse.composer,50)#">#left(browse.composer,50)#</option>
	<cfelseif form.bfield is "title">
	<option value="#left(browse.title,50)#">#left(browse.title,50)#</option>
	<cfelseif form.bfield is "label">
	<option value="#browse.label#">#browse.label#</option>
	<cfelseif form.bfield is "labelnumber">
	<option value="#browse.labelnumber#">#browse.labelnumber#</option>
	<cfelseif form.bfield is "librarycallnumber">
	<option value="#browse.librarycallnumber#">#browse.librarycallnumber#</option>
	<cfelseif form.bfield is "classinfo">
	<option value="#left(browse.classinfo,50)#">#left(browse.classinfo,50)#</option>
	</cfif>
	</cfoutput>
</select>
</td><td>
<input type="submit" value="Choose"><br>
</td></tr><tr><td>
<input type="checkbox" name="libr" value="yes" checked><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">Limit search to Library-owned materials</font>
</td></tr></table>

</td></tr></table>

</form>

</body>
</html>