<cfquery name="del" datasource="#dsn#">
<cfif structKeyExists(url,"annotate")>
delete from itemannot where itemannotid=#url.itemid#
<cfelse>
delete from items where itemid=#url.itemid#
</cfif>
</cfquery>

<cflocation url="singlerec.cfm?ed=no&ited=no&id=#url.workid#" addtoken="No"> --->