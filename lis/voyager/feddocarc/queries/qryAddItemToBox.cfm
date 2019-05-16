<cfquery name="qryAddItemToBox" datasource="#DSN#" result="result_AddItemToBox">
	update vger_support.feddocarc_items set
		status_date = sysdate
	,	project_status = 'Packed'
	,	box_number = #m_box_number#
	where item_barcode = '#m_barcode#'
</cfquery>
