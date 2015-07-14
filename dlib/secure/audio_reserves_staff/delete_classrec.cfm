<cfquery name="delete_classrec" datasource="#dsn#">
delete from classes where classid=#url.classid#
</cfquery>

<cflocation url="classes.cfm?ord=id" addtoken="No">