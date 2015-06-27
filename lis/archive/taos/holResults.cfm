	<table border="1">
		<tr align="left" valign="top">
			<th>DBCN</th>
			<th>Call Number</th>
			<th>Location</th>
		</tr>
	<cfoutput query="qryList">
		<tr align="left" valign="top">
			<td>&nbsp;<a href="showMarc.cfm?DBCN=#DBCN#">#DBCN#</a></td>
			<td>&nbsp;#Display_Call_Number#</td>
			<td>&nbsp;#Location#</td>
		</tr>
	</cfoutput>
	</table>
