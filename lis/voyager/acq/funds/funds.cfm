<cfquery name="qryFunds" datasource="#DSN#">
	SELECT	 fundline,
			 fund_id,
			 ledger_id,
			 fiscal_period_name,
			 ledger_name,
			 policy_name,
			 fund_type,
			 fund_category,
			 decode(fund_category,
			 		'Summary', 'images/red_square.gif',
			 		'Allocated', 'images/blue_triangle.gif',
			 		'Reporting', 'images/yellow_circle.gif') AS category_image,
			 ( ( length( fundline ) / 25 ) - 1 ) * 20 AS indents,
			 fund_code,
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
	WHERE    fiscal_period_id = #qryLedgerPeriods.fiscal_period_id#
			 AND ledger_id = #qryLedgerPeriods.ledger_id#
	ORDER BY ledger_name, fundline
</cfquery>

<cfoutput query="qryFunds">
	<!---cfset list_form=REReplace("#fundline#","Z{2,}",",","ALL")>
	<cfset indents=(ListLen(list_form) - 1 ) * 20--->

	<!---cfset indents=0>
	<cfset temp_name=fundline>
	<cfloop condition="Len(temp_name) GT 25">
		<cfset temp_name=Mid(temp_name,26,Len(temp_name)-25)>
		<cfset indents=indents + 1>
	</cfloop>
	<cfset indents=indents * 20--->
	<!---cfset indents=(Len(fundline) \ 25) * 20--->
	<tr>
		<td align="left" valign="bottom">&nbsp;</td>
		<td align="left" valign="bottom">
			<img src="images/1pix.gif" hspace="#indents#" height="1" width="1" border="0">
			<img src="#category_image#">
			&nbsp;#Replace(fund_name, ' ', '&nbsp;', "ALL")#
		</td>
		<td align="left" valign="bottom">&nbsp;#Replace(fund_code, ' ', '&nbsp;', "ALL")#</td>
		<td align="left" valign="bottom"><a href="funddetails.cfm?fund_id=#fund_id#&ledger_id=#ledger_id#" target="_blank">Details</a></td>
	</tr>
</cfoutput>