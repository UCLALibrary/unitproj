<cfquery name="srch1" datasource="#dsn#">
select * from link
where items<>''
</cfquery>
<cfloop query="srch1">
<cfquery name="srch2" datasource="#dsn#">
select itemid from items
where workid=#workid#
</cfquery>
<cfset inverted="">
<cfoutput query="srch2"><cfif not ListContains(srch1.items[srch1.currentRow],itemid)><cfset inverted=ListAppend(inverted,itemid)></cfif></cfoutput>
<cfoutput>#srch1.items[srch1.currentRow]# is inverted to #inverted#<br></cfoutput>
<!--<cfquery name="updateLinks" datasource="#dsn#">
update link
set
	items='#inverted#'
where id='#srch1.id[srch1.currentRow]#'
</cfquery>
 -->
</cfloop>

