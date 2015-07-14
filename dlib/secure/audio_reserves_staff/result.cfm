<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Audio, Results</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<body bgcolor="ffffff">

<cfinclude template="head.cfm">

<cfif form.searchterm1 is "" and form.searchterm2 is "">
	<cflocation url="search.cfm" addtoken="No">
</cfif>

<cfif #form.indexname1# is "composer">
	<cfset idx1="Composer">
<cfelseif #form.indexname1# is "title">
	<cfset idx1="Title">
<cfelseif #form.indexname1# is "performers">
	<cfset idx1="Performers">
<cfelseif #form.indexname1# is "caption">
	<cfset idx1="Track title">	
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
<cfelseif #form.indexname2# is "caption">
	<cfset idx2="Track title">	
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
	from works<cfif form.indexname1 is "caption" or form.indexname2 is "caption">,items</cfif>
	where
		<cfif form.indexname1 is "caption" or form.indexname2 is "caption">works.workid=items.workid AND</cfif>
	<cfif form.searchterm2 is not "">
		(
	</cfif>
	<cfif form.searchterm1 is not "">
		<cfif #form.indexname1# is "caption">items<cfelse>works</cfif>.#form.indexname1# like 
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
		<cfif form.indexname2 is "caption">items<cfelse>works</cfif>.#form.indexname2# like
		<CFIF form.evaltype2 is "contains">
			'%#form.searchterm2#%'
		<CFELSE>
			'#form.searchterm2#%'
		</CFIF>
		)
	</cfif>
	<cfif isdefined("form.libr")>
		<cfif form.libr is "yes"> 
			and (status=1 or status=2 or status=3)
		</cfif>
	</cfif>
	<cfif form.listorder is "title">
		order by works.title, works.composer
	<cfelseif form.listorder is "comp">
		order by works.composer, works.title
	<cfelseif form.listorder is "lcn">
		order by works.librarycallnumber, works.composer, works.title
	<cfelse>
		order by works.workid
	</cfif>
</cfquery>
<p><strong>Your query: </strong>
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
</CFOUTPUT></p>
<cfif reslist.recordcount is "0">
	<p>No records match your search criteria.</p>
<cfelse>
	<p>
	<cfoutput>
	#reslist.recordcount# <CFIF #reslist.recordcount# is "1">record<CFELSE>records</CFIF>
	<cfif form.listorder is "none">
		[unsorted]:
	<cfelseif form.listorder is "title.title">
		[listed alphabetically by Title]:
	<cfelseif form.listorder is "composer.comp">
		[listed alphabetically by Composer]:
	<cfelseif form.listorder is "lcn">
		[listed by Library call number]:
	</cfif>
	</cfoutput>
	</p>
</cfif>

<ol>
<cfset lastid=-1>
<cfoutput query="reslist">
<cfif lastid neq workid>
<cfif lastid neq -1 and (form.indexname1 is "caption" or form.indexname2 is "caption")></ul></cfif>
<li>#composer# <a href="singlerec.cfm?ed=no&ited=no&id=#workid#" class="go2">#title#</a>
<cfif classinfo neq "">[#classinfo#]</cfif>
<cfif librarycallnumber is not "">
[#librarycallnumber#]
</cfif>
</li>
<cfif form.indexname1 is "caption" or form.indexname2 is "caption"><ul></cfif>
</cfif>
<cfif form.indexname1 is "caption" or form.indexname2 is "caption">
<li>#caption#</li>
</cfif>
<cfset lastid=workid>
</cfoutput>
<cfif lastid neq -1 and (form.indexname1 is "caption" or form.indexname2 is "caption")></ul></cfif>
</ol>

<cfinclude template="foot.cfm">

</body>
</html>
