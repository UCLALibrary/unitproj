	<table border="1">
		<tr align="left" valign="top">
			<th>DBCN</th>
			<th>Author / Title</th>
			<th>Other Info</th>
		</tr>
	<cfoutput query="qryList">
		<tr align="left" valign="top">
			<td><a href="showMarc.cfm?DBCN=#DBCN#">#DBCN#</a></td>
			<td><cfif Author NEQ ""><em>#Author#</em><br></cfif>#Title#</td>
			<td>
				<cfif PO_Lines GT 0>
					<a href="results.cfm?index=POLine&terms=#DBCN#">#PO_Lines#&nbsp;PO&nbsp;line(s)</a>
				<cfelse>
					0 PO lines
				</cfif>
				<br>
				<cfif Inv_Lines GT 0>
					<a href="results.cfm?index=InvLine&terms=#DBCN#">#Inv_Lines#&nbsp;Invoice&nbsp;line(s)</a>
				<cfelse>
					0 Invoice lines
				</cfif>
			</td>
		</tr>
	</cfoutput>
	</table>
