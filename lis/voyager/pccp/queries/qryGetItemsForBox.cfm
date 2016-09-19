<cfquery name="qryGetItemsForBox" datasource="#DSN#">
	select 
		i.item_barcode
	,	i.display_call_no
	,	i.isbn
	,	i.author
	,	i.title_brief
	,	i.imprint
	,	i.status_date
	from vger_support.powell_zzz_boxes b
	inner join vger_support.powell_zzz_items i on b.box_number = i.box_number
	where b.box_number = #m_box_number#
	order by i.status_date desc
</cfquery>
