<cfquery name="qryLedgers" datasource="#DSN#">
	SELECT	 *
	FROM	 ledger
	ORDER BY fiscal_year_id DESC, normal_ledger_name
</cfquery>

<html>
	<head><title>Search Acquisitions Fund Lists</title></head>
	<body>
		<center>
			<cfform action="fundlistresults.cfm" method="post">
				<table border="0" width="98%">
					<tr bgcolor="#CCCC99">
						<td>Please select one or more ledgers to view fund information.
						Use ctrl-click to select multiple ledgers.</td>
					</tr>
					<tr>
						<td>Ledger Name</td>
					</tr>
					<tr>
						<td align="left">
							<cfselect name="ledger"
								query="qryLedgers"
								value="ledger_id"
								display="ledger_name"
								required="Yes"
								multiple="Yes"
								size="15">
							</cfselect>
						</td>
					</tr>
					<tr>
						<td align="left">
							<input type="submit" name="submit" value="Search">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="Reset">
						</td>
					</tr>
				</table>
			</cfform>
		</center>
	</body>
</html>