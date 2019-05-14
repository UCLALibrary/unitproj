<cfquery name="qryAllStatuses" datasource="#DSN#">
	select distinct project_status
	from vger_support.feddocarc_items
	union all
	select 'ALL' as project_status from dual
	order by project_status
</cfquery>
