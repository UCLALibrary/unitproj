<cfquery name="qryLedgerPeriods" datasource="#DSN#">
	SELECT DISTINCT
		fiscal_period_id,
		ledger_id,
		ltrim(rtrim(ledger_name)) AS ledger_name
	FROM
		ucla_fundledger_vw
	WHERE
		ledger_id IN ( #Form.ledger# )
	ORDER BY ledger_name
</cfquery>

<html>
	<head><title>Acquisitions Fund Lists: Search Results</title></head>
	<body>
		<center>
			<table border="0" width="98%">
				<tr>
					<td>
						<b>Search Terms</b>:<br>
							<cfquery name="qrySearchLedgers" datasource="#DSN#">
								SELECT DISTINCT ledger_name
								FROM ucla_fundledger_vw
								WHERE ledger_id IN ( #Form.ledger# )
								ORDER BY ledger_name
							</cfquery>
							&nbsp;&nbsp;Ledgers:&nbsp;
							<cfoutput query="qrySearchLedgers">
								#qrySearchLedgers.ledger_name#&nbsp;
							</cfoutput>
					</td>
				</tr>
				<tr><td><hr></td></tr>
			</table>
			<table border="0" width="98%">
				<cfoutput query="qryLedgerPeriods">
					<tr>
						<td align="left" valign="bottom"><b>Ledger</b></td>
						<td align="left" valign="bottom"><b>Fund Name</b></td>
						<td align="left" valign="bottom"><b>Fund&nbsp;Code</b></td>
						<td align="left" valign="bottom"><b>&nbsp;</b></td>
					</tr>
					<tr><td colspan="4"><hr size="1"></td></tr>
					<tr>
						<td align="left" valign="bottom">
							<img src="images/green_diamond.gif">
							&nbsp;#Replace(qryLedgerPeriods.ledger_name, ' ', '&nbsp;', "ALL")#
						</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<cfinclude template="funds.cfm">
					<tr><td colspan="4"><hr size="1"></td></tr>
				</cfoutput>
			</table>
			<table border="0" width="98%">
				<tr>
					<td>
						Category Legend:<br>
						<img src="images/red_square.gif">&nbsp;<b>Summary</b><br>
						<img src="images/blue_triangle.gif">&nbsp;<b>Allocated</b><br>
						<img src="images/yellow_circle.gif">&nbsp;<b>Reporting</b><br>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>