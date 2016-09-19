<cfquery name="qryAddItemToBox" datasource="#DSN#" result="result_AddItemToBox">
	update vger_support.powell_zzz_items set
		status_date = sysdate
	,	project_status = 'Packed'
	,	box_number = #m_box_number#
	where item_barcode = '#m_barcode#'
	and project_status in ('Deleted', 'Packed')
</cfquery>
