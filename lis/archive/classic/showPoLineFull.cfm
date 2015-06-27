<cfif IsDefined("URL.POP") is false or IsDefined("URL.PON") is false or IsDefined("URL.DBCN") is false
	or IsDefined("URL.OID") is false or IsDefined("URL.VOL") is false or IsDefined("URL.VAR") is false
>
	<cflocation url="archive.cfm">
</cfif>

<cfset m_PO_Number = URL.PON>
<cfset m_PO_Prefix = URL.POP>
<cfset m_DBCN = URL.DBCN>
<cfset m_Order_ID = URL.OID>
<cfset m_Volume = URL.VOL>
<cfset m_Variant = URL.VAR>

<cfinclude template="qryPoLinesFull.cfm">

<html>
<head>
	<title>PO line/order details</title>
</head>

<body>

<cfoutput>
	<p>Full PO <a href="##lines">line</a> & <a href="##orders">order</a> details for requested line
		(<a href="showPO.cfm?POP=#m_PO_Prefix#&PON=#m_PO_Number#&DBCN=#m_DBCN#&MODE=brief">Show summary</a>)
	</p>
</cfoutput>

<hr>

<p><a name="lines">Line details</a></p>

<cfoutput query="qryPoLines">
<table border="1">
<cfloop list="#qryPoLines.columnList#" index="ColumnName">
	<tr>
		<td>#ColumnName#</td>
		<td>&nbsp;#qryPoLines[ColumnName][CurrentRow]#</td>
	</tr>
</cfloop>
</table>
</cfoutput>

<hr>

<p><a name="orders">Order details</a></p>

<cfoutput query="qryPoOrders">
<table border="1">
<cfloop list="#qryPoOrders.columnList#" index="ColumnName">
	<tr>
		<td>#ColumnName#</td>
		<td>&nbsp;#qryPoOrders[ColumnName][CurrentRow]#</td>
	</tr>
</cfloop>
</table>
</cfoutput>

</body>
</html>
