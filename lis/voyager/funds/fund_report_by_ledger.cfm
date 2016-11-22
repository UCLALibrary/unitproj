<cfscript>
	// make sure variables are defined and initialized
	m_fundtype = "";
	m_ledger = "";
	// HTML reset doesn't work with dynamically populated forms, so Reset is an form submit action
	if ( (IsDefined("FORM.reset") eq true) ) {
		m_fundtype = "";
		m_ledger = "";
	}
	else {
		if ( IsDefined("FORM.fundtype") ) {
			m_fundtype = FORM.fundtype;
		}
		if ( IsDefined("FORM.ledger") ) {
			m_ledger = FORM.ledger;
		}
	}
</cfscript>

<cfquery name="qryLedgers" datasource="#DSN#" cachedwithin="#CreateTimeSpan(0, 1, 0, 0)#">
	SELECT Ledger_Name
		FROM Ledger
	ORDER BY Fiscal_Year_ID DESC, Ledger_Name ASC
</cfquery>

<html>
<head>
	<title>Voyager Funds by Ledger</title>
	<link rel="StyleSheet" href="../common/voyager.css" type="text/css" media="screen">

	<script language=Javascript>
	<!--
		var helpWindow = null;

		function showHelp (anchor) {
			if (helpWindow != null) {
		  		window.helpWindow.close();
			}
			var loc = 'fund_definitions.html#' + anchor;
			helpWindow = window.open(loc,'Help','toolbar=no,width=300,height=200,scrollbars=yes,resizable=yes');
			//screenY=100,screenX=200,top=100,left=200,
			window.helpWindow.focus();
		}
	// end function
	-->
	</script>
</head>
<body>
<form action="fund_report_by_ledger.cfm" method="post">
	<select name="ledger">
	<cfoutput query="qryLedgers">
		<option value="#ledger_name#" <cfif m_ledger eq #ledger_name#>selected</cfif>>#ledger_name#</option>
	</cfoutput>
	</select>
	<select name="fundtype">
		<option value="ALL" <cfif m_fundtype eq "all">selected</cfif>>All funds</option>
		<option value="Summary" <cfif m_fundtype eq "summary">selected</cfif>>Summary funds only</option>
	</select>
	<input name="Submit" type="Submit" value="See report">
	<input name="Reset" type="Submit" value="Reset">
</form>

<!--- Show results --->
<cfif m_ledger neq "">
	<cfquery name="qryFunds" datasource="#DSN#">
		SELECT
			fund_name
		,	fund_code
		,	fund_category
		,	original_allocation
		,	current_allocation
		,	commitments
		,	commit_pending
		,	expenditures
		,	expend_pending
		,	percent_spent
		,	cash_balance
		,	avail_balance
		FROM
		(	SELECT
				fl.fund_name
			,	fl.ledger_name
			,	(SELECT fund_code FROM ucladb.fund WHERE fund_id = fl.fund_id AND ledger_id = fl.ledger_id) AS fund_code
			,	fl.fund_category
			,	fl.current_allocation
			,	fl.expenditures
			,	fl.commitments
			,	fl.cash_balance
			,	fl.free_balance as avail_balance
			,	fl.commit_pending
			,	fl.expend_pending
			,	fl.original_allocation
			,	CASE
					WHEN fl.current_allocation != 0 THEN 100 - ((fl.free_balance / fl.current_allocation) * 100)
					ELSE 100
				END AS percent_spent
			,	Decode(fl.fund_category, 'Summary', 2, 'Allocated', 1, 'Reporting', 0) AS fund_type_sort
			,	RPad(VGER_SUPPORT.fundlineage_ucla(fl.fund_id, fl.ledger_id), 250, 'Z') AS fund_sort
			FROM  fundledger_vw fl
			WHERE Upper(fl.ledger_name) = Upper('#m_ledger#')
		<cfif m_fundtype neq "ALL">
			AND fl.fund_category = '#m_fundtype#'
		</cfif>
		) T1
		ORDER BY fund_sort, fund_type_sort
	</cfquery>

	<p>
		Summary funds are <span class="highlight">highlighted</span>.  If the report is too large or too small to read,
		you can adjust by using your browser's <em>View -> Text Size...</em> menu option.
	</p>

	<cfset m_now = Now()>

	<table border="1">
	<cfoutput>
		<caption class="table-caption">
			Fund data for #m_ledger# as of #DateFormat(m_now, "mmmm d, yyyy")# #TimeFormat(m_now, "h:mm tt")#
		</caption>
	</cfoutput>
		<tr class="table-heading">
			<td>Fund Name<a href="javascript:showHelp('fundname')">?</a></td>
			<td>Fund Code<a href="javascript:showHelp('fundcode')">?</a></td>
			<td>Original Allocation<a href="javascript:showHelp('origalloc')">?</a></td>
			<td>Current Allocation<a href="javascript:showHelp('curralloc')">?</a></td>
			<td>Commitments<a href="javascript:showHelp('commit')">?</a></td>
			<td>Pending Commitments<a href="javascript:showHelp('pendcommit')">?</a></td>
			<td>Expenditures<a href="javascript:showHelp('expend')">?</a></td>
			<td>Pending Expenditures<a href="javascript:showHelp('pendexpend')">?</a></td>
			<td>Cash Balance<a href="javascript:showHelp('cashbal')">?</a></td>
			<td>Available Balance<a href="javascript:showHelp('availbal')">?</a></td>
			<td>Percent Spent<a href="javascript:showHelp('percentspent')">?</a></td>
		</tr>
	<cfoutput query="qryFunds">
		<tr class="table-data <cfif fund_category eq 'Summary'>highlight</cfif> <cfif fund_category eq 'Summary' or fund_category eq 'Allocated'>total</cfif>">
			<td>#fund_name#</td>
			<td><cfif fund_code eq "">&nbsp;</cfif>#fund_code#</td>
			<td class="numeric <cfif original_allocation lt 0>negative</cfif>">&nbsp;#DollarFormat(original_allocation)#</td>
			<td class="numeric <cfif current_allocation lt 0>negative</cfif>">&nbsp;#DollarFormat(current_allocation)#</td>
			<td class="numeric <cfif commitments lt 0>negative</cfif>">&nbsp;#DollarFormat(commitments)#</td>
			<td class="numeric <cfif commit_pending lt 0>negative</cfif>">&nbsp;#DollarFormat(commit_pending)#</td>
			<td class="numeric <cfif expenditures lt 0>negative</cfif>">&nbsp;#DollarFormat(expenditures)#</td>
			<td class="numeric <cfif expend_pending lt 0>negative</cfif>">&nbsp;#DollarFormat(expend_pending)#</td>
			<td class="numeric <cfif cash_balance lt 0>negative</cfif>">&nbsp;#DollarFormat(cash_balance)#</td>
			<td class="numeric <cfif avail_balance lt 0>negative</cfif>">&nbsp;#DollarFormat(avail_balance)#</td>
			<td class="numeric <cfif percent_spent ge 100>negative</cfif>">&nbsp;#DecimalFormat(percent_spent)#</td>
		</tr>
	</cfoutput>
	</table>


</cfif>


</body>
</html>

