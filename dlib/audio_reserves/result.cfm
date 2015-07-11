<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Audio, Results</title>
</head>
<body bgcolor="ffffff">

<cfif form.searchterm1 is "" and form.searchterm2 is "">
	<cflocation url="search.cfm" addtoken="No">
</cfif>

<cfif #form.indexname1# is "composer">
	<cfset idx1="Composer">
<cfelseif #form.indexname1# is "title">
	<cfset idx1="Title">
<cfelseif #form.indexname1# is "performers">
	<cfset idx1="Performers">
<cfelseif #form.indexname1# is "label">
	<cfset idx1="Label">
<cfelseif #form.indexname1# is "labelnumber">
	<cfset idx1="Label number">
<cfelseif #form.indexname1# is "librarycallnumber">
	<cfset idx1="Library call number">
<cfelseif #form.indexname1# is "classinfo">
	<cfset idx1="Class-specific info.">
	<cfset session.reservelist="yes">
</cfif>
<cfif #form.indexname2# is "composer">
	<cfset idx2="Composer">
<cfelseif #form.indexname2# is "title">
	<cfset idx2="Title">
<cfelseif #form.indexname2# is "performers">
	<cfset idx2="Performers">
<cfelseif #form.indexname2# is "label">
	<cfset idx2="Label">
<cfelseif #form.indexname2# is "labelnumber">
	<cfset idx2="Label number">
<cfelseif #form.indexname2# is "librarycallnumber">
	<cfset idx2="Library call number">
<cfelseif #form.indexname2# is "classinfo">
	<cfset idx1="Class-specific info.">
	<cfset session.reservelist="yes">
</cfif>

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
		and 
		<cfif form.searchterm2 is not "">
			(
		</cfif>
		<cfif form.searchterm1 is not "">
			works.#form.indexname1# like 
			<CFIF form.evaltype1 is "contains">
				'%#form.searchterm1#%' 
			<CFELSE>
				'#form.searchterm1#%'
			</CFIF>
		</cfif>
		<cfif form.searchterm2 is not "">
			<cfif form.searchterm1 is not "">
				#form.connector#
			</cfif>
			works.#form.indexname2# like
			<CFIF form.evaltype2 is "contains">
				'%#form.searchterm2#%'
			<CFELSE>
				'#form.searchterm2#%'
			</CFIF>
			)
		</cfif>
	<cfif form.listorder is "title">
		order by works.title, works.composer, items.itemID
	<cfelseif form.listorder is "comp">
		order by works.composer, works.title, items.itemID
	<cfelseif form.listorder is "lcn">
		order by works.librarycallnumber, works.composer, works.title, items.itemID
	<cfelse>
		order by works.workid, items.itemid
	</cfif>
</cfquery>

<cfinclude template="staffuseonly.cfm">

<p><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><B>Your query:</B> 
<CFOUTPUT>
<cfif form.searchterm1 is not "">
	#idx1# #evaltype1# "#form.searchterm1#"
</cfif>
<cfif form.searchterm1 is not "" and form.searchterm2 is not "">
	#form.connector# 
</cfif>
<cfif form.searchterm2 is not "">
	#idx2# #form.evaltype2# "#form.searchterm2#"
</cfif> 
</CFOUTPUT><br>
<cfif reslist.recordcount is "0">
	No records match your search criteria.</font></p>
<cfelse>
	<cfoutput>
	#reslist.recordcount# <CFIF #reslist.recordcount# is "1">track<CFELSE>tracks</CFIF>
	<cfif form.listorder is "none">
		[unsorted]:
	<cfelseif form.listorder is "title.title">
		[listed alphabetically by Title]:
	<cfelseif form.listorder is "composer.comp">
		[listed alphabetically by Composer]:
	<cfelseif form.listorder is "lcn">
		[listed by Library call number]:
	</cfif>
	</font>
	</cfoutput></p>
	
<cfinclude template="audio_res_list.cfm">

</cfif>

</body>
</html>
