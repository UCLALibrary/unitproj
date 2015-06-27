<!--- At this point, m_Terms still contains the DBCN used to find the related POs; assign to m_DBCN to help us remember that... --->
<cfset m_DBCN = m_Terms>

	<table border="0">
		<tr align="left" valign="top">
			<th width="25%">Supplier ID</th>
			<th width="50%">Supplier Name</th>
		</tr>
	<cfoutput query="qryList">
		<tr align="left" valign="top">
			<td>&nbsp;<a href="showSupplier.cfm?SUP=#Supplier_ID#">#Supplier_ID#</a></td>
			<td>&nbsp;#Supplier_Name#</td>
		</tr>
	</cfoutput>
	</table>
