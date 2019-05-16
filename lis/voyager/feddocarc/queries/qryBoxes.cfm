<cfquery name="qryBoxes" datasource="#DSN#">
	select box_number
	from vger_support.feddocarc_boxes
	order by box_number desc
</cfquery>
