<html>
<head>
	<title>GBS Shipment Details</title>
</head>
<body>

<cfset p_shipment_number = URL.shipment_number>
<cfquery name="qryCarts" datasource="#DSN#" cachedwithin="#CreateTimeSpan(0, 0, 1, 0)#">
select
  gs.shipment_number
, gs.collection
, gs.shipment_date
, gmv.cart_id
, gmv.cart_barcode
, count(*) as items
from vger_support.gbs_master_view gmv
inner join vger_support.gbs_shipment gs 
  on gmv.cart_id between gs.cart_id_start and gs.cart_id_end
  and gmv.charge_date between gs.min_charge_date and gs.shipment_date
where gs.shipment_number = #p_shipment_number#
group by gs.shipment_number, gs.collection, gs.shipment_date, gmv.cart_id, gmv.cart_barcode
order by shipment_number, cart_id
</cfquery>

<cfquery name="qryTotal" dbtype="query">
select sum(items) as total_items from qryCarts
</cfquery>

<cfset total_items = iif(qryTotal.total_items gt 0, qryTotal.total_items, 0)>

<cfoutput>
<p>#qryCarts.RecordCount# cart(s) currently are in use, totaling #total_items# items.</p>
</cfoutput>

<cfif qryCarts.RecordCount GT 0>
	<!--- Create pdf file for this shipment so it's ready if someone wants it - quick enough to do --->
	<cfset manifest_name = #qryCarts.collection# & "_" & DateFormat(qryCarts.shipment_date, "YYYYMMDD") & ".txt">
	<cfset gbs_slip_filename = #qryCarts.collection# & "_gbs_cart_slips.pdf">
	<cfdocument format="PDF" pagetype="letter" filename="#gbs_slip_filename#" overwrite="yes">
	<cfset slip_number = 1>
	<cfset slip_count = qryCarts.RecordCount>
	<cfoutput query="qryCarts">
		<table border="1" width="100%">
			<tr>
				<th colspan="2">CART ROUTING SHEET</th>
			</tr>
			<tr>
				<td>Date:</td>
				<td>#DateFormat(shipment_date, "YYYY-MM-DD")#</td>
			</tr>
			<tr>
				<td>Pick-Up Library:</td>
				<td>#collection#</td>
			</tr>
			<tr>
				<td>Quantity:</td>
				<td>#items#</td>
			</tr>
			<tr>
				<td>Cart ID:</td>
				<td>#cart_id#</td>
			</tr>
			<tr>
				<td>Manifest ##:</td>
				<td>#manifest_name#</td>
			</tr>
			<tr>
				<td>Return Library:</td>
				<td>#collection#</td>
			</tr>
		</table>
		<p></p>
		<p></p>
		<p></p>
		<p></p>
		<p></p>
		<p></p>
		<p></p>
		<p></p>
		<p></p>
		<p></p>
		<p></p>
		<p></p>
		<p></p>
		<p></p>
		<p></p>
		<p></p>
		<cfif slip_number MOD 2 EQ 0 And slip_number LT slip_count>
			<cfdocumentitem type="pagebreak"/>
		</cfif>
		<cfset slip_number = slip_number + 1>
	</cfoutput>
	</cfdocument>

	<cfoutput>
	<p><a href="#gbs_slip_filename#">Print cart routing sheets for this shipment</a></p>
	</cfoutput>
	<table border="1">
		<tr align="right">
			<th>Shipment#</th>
			<th>Shipment Date</th>
			<th>Cart ID</th>
			<th>Cart Barcode</th>
			<th>Items</th>
		</tr>
		<cfoutput query="qryCarts">
		<tr align="right">
			<td>#shipment_number#</td>
			<td>#DateFormat(shipment_date, "YYYY-MM-DD")#</td>
			<td><a href="gbs_cart.cfm?cart_id=#cart_id#">#cart_id#</a></td>
			<td>#cart_barcode#</td>
			<td>#items#</td>
		</tr>
		</cfoutput>
	</table>
</cfif>

</body>
</html>
