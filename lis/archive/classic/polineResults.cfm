<cfinclude template="formatPO.cfm">

<!--- At this point, m_Terms still contains the DBCN used to find the related POs; assign to m_DBCN to help us remember that... --->
<cfset m_DBCN = m_Terms>

	<table border="1">
		<tr align="left" valign="top">
			<th>Owning Loc</th>
			<th>PO Number</th>
			<th>Supplier ID</th>
			<th>Status</th>
			<th>Lines</th>
		</tr>
	<cfoutput query="qryList">
		<tr align="left" valign="top">
			<td>&nbsp;#Owning_Loc#</td>
			<td>&nbsp;<a href="showPO.cfm?POP=#Trim(PO_Prefix)#&PON=#Trim(PO_Number)#&DBCN=#m_DBCN#">#FormatPO(PO_Prefix, PO_Number)#</a></td>
			<td>&nbsp;<a href="showSupplier.cfm?SUP=#Supplier_ID#">#Supplier_ID#</a></td>
			<td>&nbsp;#Process_Status#</td>
			<td align="right">#Line_Count#</td>
		</tr>
	</cfoutput>
	</table>
