<!--- Called from showMarc.cfm, only when showMarc is handling a bib record --->

<cfstoredproc procedure="usp_Get_Summary_Holdings" datasource="#DSN#">
	<cfprocresult name=qrySummaryHoldings>
	<cfprocparam type="IN" cfsqltype="CF_SQL_CHAR" value="#m_DBCN#" dbvarname="@DBCN">
</cfstoredproc>

<cfif qrySummaryHoldings.RecordCount GT 0>
<hr>
<p>Summary Holdings:</p>
<table border="1">
	<tr valign="top">

		<th>DBCN</th>
		<th>Location</th>
		<th>Call Number</th>
		<th>Summary</th>
	</tr>
<cfoutput query="qrySummaryHoldings">
	<tr valign="top">
		<td><a href="showMarc.cfm?DBCN=#Hol_DBCN#">#Hol_DBCN#</a></td>
		<td>&nbsp;#Location#&nbsp;</td>
		<td>
			&nbsp;#Call_Number#
			<cfif Copy_Number NEQ "">
				&nbsp;#Replace(Copy_Number, " ", "&nbsp;", "ALL")#
			</cfif>
			&nbsp;
		</td>
		<td>&nbsp;#Replace(Summary, ")", ") ", "ALL")#&nbsp;</td> <!--- add space after right-parens, to allow browser to wrap text --->
	</tr>
</cfoutput>
</table>
</cfif>