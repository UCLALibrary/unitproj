<cfquery name="test" datasource="#dsn#">
select * from link where workid=#form.workid# and classid=#form.classid#
</cfquery>
<cfif test.recordcount eq 0>
	<cfquery name="upd" datasource="#dsn#">
	insert into 
		link(workid,classid)
		values(#form.workid#,#form.classid#)
	</cfquery>
</cfif>
<cflocation url="classrec.cfm?t=view&classid=#form.classid#&listadd=no" addtoken="No">