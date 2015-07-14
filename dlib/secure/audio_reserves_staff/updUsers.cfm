<cfquery name="upd" datasource="#dsn#">
update login
	set username='#form.username#',
    	name='#form.name#'
    where id=#form.id#
</cfquery>

<cflocation url="users.cfm" addtoken="No">