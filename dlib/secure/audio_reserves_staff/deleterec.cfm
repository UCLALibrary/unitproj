<cfquery name="del" datasource="#dsn#">
delete from items where workid=#url.workid#
delete from works where workid=#url.workid#
</cfquery>

<cflocation url="index.cfm" addtoken="No">