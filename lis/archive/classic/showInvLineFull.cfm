<cfif IsDefined("URL.INV") is false or IsDefined("URL.SUP") is false or IsDefined("URL.LINE") is false>
	<cflocation url="archive.cfm">
</cfif>

<cfif IsDefined("URL.DBCN") is true>
	<cfset m_DBCN = URL.DBCN>
<cfelse>
	<cfset m_DBCN = "">
</cfif>

<cfset m_Inv_Number = Trim(URL.INV)>
<cfset m_Supplier_ID = Trim(URL.SUP)>
<cfset m_Line_Number = URL.LINE>

<cfinclude template="qryInvLinesFull.cfm">

<html>
<head>
	<title>Invoice line/loc details</title>
</head>
<body>
<cfoutput>
	<p>Full invoice <a href="##lines">line</a> & <a href="##locs">location</a> details for requested line
		(<a href="showInvoice.cfm?INV=#m_Inv_Number#&SUP=#m_Supplier_ID#&DBCN=#m_DBCN#&MODE=brief">Show header/line summary</a>)
	</p>
</cfoutput>

<hr>

<p><a name="lines">Line details</a></p>

<cfoutput query="qryInvLines">
<table border="1">
<cfloop list="#qryInvLines.columnList#" index="ColumnName">
	<tr>
		<td>#ColumnName#</td>
		<td>&nbsp;#qryInvLines[ColumnName][CurrentRow]#</td>
	</tr>
</cfloop>
</table>
</cfoutput>

<hr>

<p><a name="locs">Location details</a></p>

<cfoutput query="qryInvLocs">
<cfif RecordCount GT 1>
	<p>Location ###CurrentRow#</p>
</cfif>
<table border="1">
<cfloop list="#qryInvLocs.columnList#" index="ColumnName">
	<tr>
		<td>#ColumnName#</td>
		<td>&nbsp;#qryInvLocs[ColumnName][CurrentRow]#</td>
	</tr>
</cfloop>
</table>
</cfoutput>

</body>
</html>
