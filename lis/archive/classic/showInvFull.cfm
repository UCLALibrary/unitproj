<cfoutput>
	<p>Full Invoice header for invoice #m_Inv_Number#
		(<a href="showInvoice.cfm?INV=#m_Inv_Number#&SUP=#m_Supplier_ID#&DBCN=#m_DBCN#&MODE=brief">Show header/line summary</a>)
	</p>
</cfoutput>

<cfoutput query="qryInvHeaders">
<table border="1">
<cfloop list="#qryInvHeaders.columnList#" index="ColumnName">
	<tr>
		<td>#ColumnName#</td>
		<td>&nbsp;#qryInvHeaders[ColumnName][CurrentRow]#</td>
	</tr>
</cfloop>
</table>
</cfoutput>
