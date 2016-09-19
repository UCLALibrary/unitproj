<cfquery name="qryStatus" datasource="#DSN#">
	select
		project_status
	,	count(*) as items
	from vger_support.powell_zzz_items
	group by project_status
	order by project_status
</cfquery>
