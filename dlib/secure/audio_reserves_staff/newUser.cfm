<cfquery name="ins" datasource="#dsn#">
insert into login(username,name,loginType) values('','','admin')
</cfquery>
<cfquery name="srch" datasource="#dsn#">
select id from login order by id
</cfquery>
<cflocation url="users.cfm?ed=1&id=#srch.id[srch.recordCount]#&newid=1">