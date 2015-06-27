<!---
<cfinclude template="formatPO.cfm">
--->

<!--- At this point, m_Terms still contains the DBCN used to find the related invoices; assign to m_DBCN to help us remember that... --->
<cfset m_DBCN = m_Terms>

	<table border="0" width="100%">
		<tr align="left" valign="top">
			<th>Owning Loc</th>
			<th>Invoice Number</th>
			<th>Supplier ID</th>
			<th>Invoice Date</th>
			<th>Status</th>
			<th>Volume</th>
			<th align="right">Amount</th>
		</tr>
	<cfoutput query="qryList">
		<tr align="left" valign="top">
			<td>#Owning_Loc#</td>
			<td><a href="showInvoice.cfm?INV=#Trim(Invoice_Number)#&SUP=#Trim(Supplier_ID)#&DBCN=#m_DBCN#&LINE=#Line_Number#">#Invoice_Number#</a></td>
			<td><a href="showSupplier.cfm?SUP=#Supplier_ID#">#Supplier_ID#</a></td>
			<td>#DateFormat(Invoice_Date, "mm/dd/yyyy")#</td>
			<td>#Process_Status#</td>
			<td>#Volume#</td>
			<td align="right">#DollarFormat(Conv_Amt_To_Expend)#</td>
		</tr>
	</cfoutput>
	</table>
