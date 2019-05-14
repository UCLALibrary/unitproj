<cfquery name="qryBoxes" datasource="#DSN#">
	select box_number
	from vger_support.feddocarc_items
	order by box_number desc
</cfquery>
