<html>
<head>
	<title>GBS Shipments</title>
</head>
<body>
<p>Google shipments.  Shipment number is UCLA-assigned, for our reference.  Latest shipments are listed first.</p>

<cfquery name="qryShipments" datasource="#DSN#" cachedwithin="#CreateTimeSpan(0, 0, 1, 0)#">
select
  shipment_number
, collection
, shipment_date
, shipment_return_date
, cart_id_start
, cart_id_end
from vger_support.gbs_shipment
order by shipment_number desc, cart_id_start desc
</cfquery>

<cfif qryShipments.RecordCount GT 0>
	<table border="1">
		<tr>
			<th>Shipment#</th>
			<th>Collection</th>
			<th>Shipment Date</th>
			<th>Return Date</th>
			<th>Cart Numbers</th>
		</tr>
		<cfoutput query="qryShipments" group="shipment_number">
		<tr align="right" valign="top">
			<td><a href="gbs_shipment_details.cfm?shipment_number=#shipment_number#">#shipment_number#</a></td>
			<td>#collection#</td>
			<td>#DateFormat(shipment_date, "YYYY-MM-DD")#</td>
			<td>#DateFormat(shipment_return_date, "YYYY-MM-DD")#</td>
			<td>
			<cfoutput>
				#cart_id_start# - #cart_id_end#<br>
			</cfoutput>
			</td>
		</tr>
		</cfoutput>
	</table>
</cfif>

</body>
</html>

