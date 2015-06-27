	<table border="1">
		<tr align="left" valign="top">
			<th>Owning Loc</th>
			<th>Invoice Number</th>
			<th>Supplier ID</th>
			<th>Invoice Date</th>
			<th>Status</th>
		</tr>
	<cfoutput query="qryList">
		<cfset m_Invoice_Number = Trim(Invoice_Number)>
		<cfset m_Supplier_ID = Trim(Supplier_ID)>
		<tr align="left" valign="top">
			<td>&nbsp;#Owning_Loc#</td>
			<td>&nbsp;<a href="showInvoice.cfm?INV=#m_Invoice_Number#&SUP=#m_Supplier_ID#">#Invoice_Number#</a></td>
			<td>&nbsp;<a href="showSupplier.cfm?SUP=#m_Supplier_ID#">#Supplier_ID#</a></td>
			<td>&nbsp;#DateFormat(Invoice_Date, "mm/dd/yyyy")#</td>
			<td>&nbsp;#Process_Status#</td>
		</tr>
	</cfoutput>
	</table>
