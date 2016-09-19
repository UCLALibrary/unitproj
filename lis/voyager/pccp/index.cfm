<html>
<head>
	<title>Powell Collection Consolidation Project (PCCP)</title>
</head>
<body>
<p>This is the summary page for the Powell Collection Consolidation Project (PCCP).  <a href="https://docs.library.ucla.edu/x/VoR4Bw">Project charter</a> and <a href="https://docs.library.ucla.edu/x/YIR4Bw">specs</a>.</p>

<cfinclude template="queries/qryStatus.cfm">
<table border="1">
	<caption>Item summary</caption>
	<thead>
		<tr>
			<th>Status</th>
			<th>Items</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="qryStatus">
		<tr>
			<td>#project_status#</td>
			<td>#items#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>

<p><a href="itemlist.cfm">List items</a></p>
<p><a href="boxitems.cfm">Pack items</a></p>

</body>
</html>