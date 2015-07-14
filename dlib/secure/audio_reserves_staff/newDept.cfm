<cfquery name="ins" datasource="#dsn#">
insert into departments(department) values('')
</cfquery>
<cfquery name="srch" datasource="#dsn#">
select id from departments order by id
</cfquery>
<cflocation url="depts.cfm?ed=1&id=#srch.id[srch.recordCount]#&newid=1">