<cfquery name="qryStatus" datasource="#DSN#">
	select
		project_status
	,	count(*) as items
	from vger_support.feddocarc_items
	group by project_status
	order by project_status
</cfquery>
