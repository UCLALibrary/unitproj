<cfquery name="upd" datasource="#dsn#">
update departments
	set department='#form.department#'
    where id=#form.id#
</cfquery>

<cflocation url="depts.cfm" addtoken="No">