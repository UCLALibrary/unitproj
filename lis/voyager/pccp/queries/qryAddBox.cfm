<cfquery name="qryAddBox" datasource="#DSN#">
	insert into vger_support.powell_zzz_boxes (box_number)
	select coalesce(max(box_number) , 0)+ 1 from vger_support.powell_zzz_boxes
</cfquery>
