<cfquery name="qryAllItems" datasource="#DSN#">
	select *
	from vger_support.powell_zzz_items
	order by normalized_call_no
</cfquery>
