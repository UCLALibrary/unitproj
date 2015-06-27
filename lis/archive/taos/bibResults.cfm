	<table border="1">
		<tr align="left" valign="top">
			<th>DBCN</th>
			<th>Author / Title</th>
		</tr>
	<cfoutput query="qryList">
		<tr align="left" valign="top">
			<td><a href="showMarc.cfm?DBCN=#DBCN#">#DBCN#</a></td>
			<td><cfif Author NEQ ""><em>#Author#</em><br></cfif>#Title#</td>
		</tr>
	</cfoutput>
	</table>
