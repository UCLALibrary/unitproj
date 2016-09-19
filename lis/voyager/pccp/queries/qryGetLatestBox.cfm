<cfquery name="qryGetLatestBox" datasource="#DSN#">
	select max(box_number) as box_number from vger_support.powell_zzz_boxes
</cfquery>
