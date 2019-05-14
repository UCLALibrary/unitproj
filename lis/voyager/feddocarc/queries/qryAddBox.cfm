<cfquery name="qryAddBox" datasource="#DSN#">
	insert into vger_support.feddocarc_boxes (box_number)
	select coalesce(max(box_number) , 0)+ 1 from vger_support.feddocarc_boxes
</cfquery>
