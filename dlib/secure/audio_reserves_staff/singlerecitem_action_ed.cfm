<cfif isdefined("form.audioOK")>
	<cfset audioOK=1>
<cfelse>
	<cfset audioOK=0>
</cfif>
<cfif form.ordr is "">
	<cfset m_ordr=1>
<cfelse>
	<cfset m_ordr=val(form.ordr)>
</cfif>
<!--- <cfif isdefined("form.pf")>
	<cfset m_pf=1>
<cfelse>
	<cfset m_pf=0>
</cfif> --->
<cfquery name="upd" datasource="#dsn#">
update items
			set 
				ordr=#m_ordr#,
				volume='#form.volume#',
				disc='#form.disc#',
				side='#form.side#',
				track='#form.track#',
				<!--- parfilefullpath=#variables.m_pf#, --->
				parfile='#form.parfile#',
				caption='#form.caption#',
				audioOK=#variables.audioOK#
			where 
				itemid=#form.itemid#
</cfquery>

<cflocation url="singlerec.cfm?ed=no&ited=no&id=#form.workid#" addtoken="No">