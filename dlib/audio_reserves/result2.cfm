<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Audio, Results</title>
<cfset session.classid="none">
<cfset session.usern="none">
</head>
<body bgcolor="ffffff">

<cfquery name="reslist" datasource="#dsn#">
	select *
	from works, items
	where works.workID=items.workID 
		and items.EncFormat=7
		<cfif isdefined("form.libr")>
		<cfif form.libr is "yes"> 
		and (
			left(works.librarycallnumber,3)='CDA' 
				or left(works.librarycallnumber,2)='LP'
			)
		</cfif>
		</cfif>
		and works.#form.bfield# like '%#form.bsearch#%'
		order by #form.bfield#, items.itemID
</cfquery>

<cfinclude template="staffuseonly.cfm">

<p><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><B>Your query:</B> 
<CFOUTPUT>
#form.bfield# contains "#form.bsearch#"
</CFOUTPUT><br>
<cfif reslist.recordcount is "0">
	No records match your search criteria.</font></p>
<cfelse>
	<cfoutput>
	#reslist.recordcount# <CFIF #reslist.recordcount# is "1">track<CFELSE>tracks</CFIF>
		[listed alphabetically by #form.bfield#]:</font>
	</cfoutput></p>
	
<cfinclude template="audio_res_list.cfm">

</cfif>

</body>
</html>
