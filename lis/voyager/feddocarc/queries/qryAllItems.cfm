<cfquery name="qryAllItems" datasource="#DSN#">
	select *
	from vger_support.feddocarc_items
	order by normalized_call_no
</cfquery>
