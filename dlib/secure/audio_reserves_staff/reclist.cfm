<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>List</title>
</head>

<!--- 
Listtype: 	1=select by composer
			2=select by title
			3=select by label & labelnumber
			4=select by librarycallnumber
--->

<cfset listtype=url.listtype>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">

<cfquery name="srch" datasource="#dsn#">
select * from works
where
	<cfif listtype is "1">
		works.composer='#url.composer#'
	<cfelseif listtype is "2">
		works.title='#url.title#'
	<cfelseif listtype is "3">
		works.label='#url.label#'
		and works.labelnumber='#url.labelnumber#'
	<cfelseif listtype is "31">
		works.label='#url.label#'
	<cfelseif listtype is "4">
		works.librarycallnumber='#url.librarycallnumber#'
	<cfelseif listtype is "5">
		works.performers='#url.performer#'
	<cfelseif listtype is "6">
		works.baseaddress='#url.filename#'
	<cfelseif listtype is "7">
		works.classinfo='#url.class#'
	</cfif>
	order by works.composer,works.title
</cfquery>

<p><cfoutput>#srch.recordCount#</cfoutput>  <cfif srch.recordCount is 1> record<cfelse> records</cfif></p>

<ol>
<cfoutput query="srch">
<li>#composer# <a href="singlerec.cfm?ed=no&ited=no&id=#workid#" class="go2">#title#</a>
<cfif classinfo neq "">[#classinfo#]</cfif>
<cfif librarycallnumber is not "">
[#librarycallnumber#]
</cfif>
</cfoutput>
</ol>



<cfinclude template="foot.cfm">

</body>
</html>
