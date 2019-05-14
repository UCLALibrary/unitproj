<html>
<head>
	<title>Federal Document Archive Project</title>
</head>
<body>
<p>This is the summary page for the Federal Document Archive Project.  <a href="https://jira.library.ucla.edu/browse/VBT-1302">Specs</a>.</p>

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
