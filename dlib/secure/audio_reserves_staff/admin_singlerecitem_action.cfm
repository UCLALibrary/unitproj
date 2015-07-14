<cfif isdefined("form.audioOK")>
	<cfset audioOK=1>
<cfelse>
	<cfset audioOK=0>
</cfif>
<cfquery name="upd" datasource="#dsn#">
update items set audioOK=#variables.audioOK# where itemid=#form.itemid#
</cfquery>

<cflocation url="checkAudio.cfm?ited=no&itemid=0&start=#form.start#&typ=#form.typ#" addtoken="No">