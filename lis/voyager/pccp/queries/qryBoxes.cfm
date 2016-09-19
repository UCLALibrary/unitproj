<cfquery name="qryBoxes" datasource="#DSN#">
	select box_number
	from vger_support.powell_zzz_boxes
	order by box_number desc
</cfquery>
