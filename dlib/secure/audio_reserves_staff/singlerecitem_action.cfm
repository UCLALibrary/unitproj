<cfif structKeyExists(form,"ItemAnnot")>
<cfquery name="upd" datasource="#dsn#">
<cfif structKeyExists(form,"NewAnnot")>
insert into itemannot
	(
	id,
	itemid,
	itemannotation
	)
	values
	( 
	#form.id#,
	#form.itemid#,
	'#form.itemannotation#'
	)
<cfelse>
update itemannot
			set 
				id=#form["id"]#,
				itemannotation='#form["itemannotation"]#'
			where 
				itemannotid=#form["itemannotid"]#
</cfif>
</cfquery>
<cfelse>
<cfset form_num=1>
<cfloop condition="StructKeyExists(form,'ItemID#form_num#')">
<cfif isdefined("form.audioOK#form_num#")>
	<cfset audioOK=1>
<cfelse>
	<cfset audioOK=0>
</cfif>
<cfif form["ordr#form_num#"] is "">
	<cfset m_ordr=1>
<cfelse>
	<cfset m_ordr=val(form["ordr#form_num#"])>
</cfif>
<cfquery name="upd" datasource="#dsn#">
update items
			set 
				ordr=#m_ordr#,
				volume='#form["volume#form_num#"]#',
				disc='#form["disc#form_num#"]#',
				side='#form["side#form_num#"]#',
				track='#form["track#form_num#"]#',
				parfile='#form["parfile#form_num#"]#',
				caption='#form["caption#form_num#"]#',
				audioOK=#variables.audioOK#
			where 
				itemid=#form["itemid#form_num#"]#
</cfquery>
<cfset form_num=form_num+1>
</cfloop>
</cfif>
<cflocation url="singlerec.cfm?ed=no&ited=no&id=#form.workid#" addtoken="No">