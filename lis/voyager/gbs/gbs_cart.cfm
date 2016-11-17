<html>
<head>
	<title>GBS Cart Details</title>
</head>
<body>

<cfset p_cart_id = URL.cart_id>
<cfset catalog_url = "http://catalog.library.ucla.edu/cgi-bin/Pwebrecon.cgi?DB=local&BBID=">

<cfquery name="qryCart" datasource="#DSN#" cachedwithin="#CreateTimeSpan(0, 0, 1, 0)#">
select
  bib_id
, title
, cart_seq
, charge_date
, item_enum
, item_barcode
, oclc
from vger_support.gbs_master_view
where cart_id = '#p_cart_id#'
order by cart_seq
</cfquery>

<cfoutput>
<p>#p_cart_id# has #qryCart.RecordCount# item(s).</p>
</cfoutput>

<cfif qryCart.RecordCount GT 0>
	<table border="1">
		<tr align="right">
			<th>Title</th>
			<th>Sequence</th>
			<th>Charge Date</th>
			<th>Enumeration</th>
			<th>Barcode</th>
			<th>OCLC#</th>
		</tr>
		<cfoutput query="qryCart">
		<tr align="right">
			<td><a href="#catalog_url##bib_id#">#title#</a></td>
			<td>#cart_seq#</td>
			<td>&nbsp;#DateFormat(charge_date, "YYYY-MM-DD")#</td>
			<td>&nbsp;#item_enum#</td>
			<td>&nbsp;#item_barcode#</td>
			<td>&nbsp;#oclc#</td>
		</tr>
		</cfoutput>
	</table>
</cfif>
</body>
</html>

