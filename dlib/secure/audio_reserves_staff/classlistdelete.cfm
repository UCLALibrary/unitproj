<cfquery name="deletefromlist" datasource="#dsn#">
delete from link where classid=#url.classid# and workid=#url.workid#
</cfquery>
<cflocation url="classrec.cfm?t=view&classid=#url.classid#&listadd=no" addtoken="No">