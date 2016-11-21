<cfquery name="qryDetails" datasource="#DSN#">
	SELECT	 fund_type,
			 fund_name,
			 institution_fund_id,
			 original_allocation,
			 current_allocation,
			 cash_balance,
			 free_balance,
			 expenditures,
			 commitments,
			 commit_pending,
			 expend_pending
	FROM	 ucla_fundledger_vw
	WHERE    fund_id = #URL.fund_id#
			 and ledger_id = #URL.ledger_id#
</cfquery>

<html>
<head><title>Acquisitions Fund Lists: Fund Details</title></head>
<body>
<center>
<table border="1" cellpadding="4" cellspacing="4" width="98%">
<cfoutput query="qryDetails">
<tr>
<td align="center" valign="bottom" colspan="10"><b>#fund_name#</b></td>
</tr>
<tr>
<td align="left" valign="bottom"><b>Fund Type</b></td>
<td align="left" valign="bottom"><b>Institutional Fund ID</b></td>
<td align="right" valign="bottom"><b>Original Allocation</b></td>
<td align="right" valign="bottom"><b>Current Allocation</b></td>
<td align="right" valign="bottom"><b>Cash Balance</b></td>
<td align="right" valign="bottom"><b>Free Balance</b></td>
<td align="right" valign="bottom"><b>Expenditures</b></td>
<td align="right" valign="bottom"><b>Commitments</b></td>
<td align="right" valign="bottom"><b>Pending Commitments</b></td>
<td align="right" valign="bottom"><b>Pending Expenditures</b></td>
</tr>
<!--tr><td colspan="10"><hr size="1"></td></tr-->
<tr>
<td align="left" valign="bottom">&nbsp;#Replace(fund_type, ' ', '&nbsp;', "ALL")#</td>
<td align="left" valign="bottom">&nbsp;#Replace(institution_fund_id, ' ', '&nbsp;', "ALL")#</td>
<td align="right" valign="bottom">&nbsp;#DollarFormat(original_allocation)#</td>
<td align="right" valign="bottom">&nbsp;#DollarFormat(current_allocation)#</td>
<td align="right" valign="bottom">&nbsp;#DollarFormat(cash_balance)#</td>
<td align="right" valign="bottom">&nbsp;#DollarFormat(free_balance)#</td>
<td align="right" valign="bottom">&nbsp;#DollarFormat(expenditures)#</td>
<td align="right" valign="bottom">&nbsp;#DollarFormat(commitments)#</td>
<td align="right" valign="bottom">&nbsp;#DollarFormat(commit_pending)#</td>
<td align="right" valign="bottom">&nbsp;#DollarFormat(expend_pending)#</td>
</tr>
</cfoutput>
</table>
</center>
</body>
</html>