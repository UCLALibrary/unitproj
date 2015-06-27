<cfoutput>
	<p>Summary information for invoice #m_Inv_Number#
		(<a href="showInvoice.cfm?INV=#m_Inv_Number#&SUP=#m_Supplier_ID#&DBCN=#m_DBCN#&MODE=full">Show full header</a>)
	</p>
</cfoutput>
	<table border="1">
	<cfoutput query="qryInvHeaders">
		<tr>
			<td class="label">Invoice Status:&nbsp;</td>
			<td class="data" colspan="2">&nbsp;#DateFormat(Process_Status_Date, "mm/dd/yyyy")# - #Process_Status#</td>
			<td class="label">Acq Status:&nbsp;</td>
			<td class="data" colspan="2">&nbsp;#Acq_Status#</td>
		</tr>
		<tr>
			<td class="label">Date Created:&nbsp;</td>
			<td class="data" colspan="2">&nbsp;#DateFormat(Created_Date, "mm/dd/yyyy")#</td>
			<td class="label">Date Paid:&nbsp;</td>
			<td class="data" colspan="2">&nbsp;#DateFormat(Paid_Date, "mm/dd/yyyy")#</td>
		</tr>
		<tr>
			<td class="label" colspan="4">Total Paid:&nbsp;</td>
			<td class="data" colspan="2">&nbsp;#DollarFormat(Total_Paid)#</td>
		</tr>
		<tr>
			<td class="label">Owning Loc:&nbsp;</td>
			<td class="data">&nbsp;#Owning_Loc#</td>
			<td class="label">Supplier ID:&nbsp;</td>
			<td class="data">&nbsp;<a href="showSupplier.cfm?SUP=#m_Supplier_ID#">#Supplier_ID#</a></td>
			<td class="label">Supplier Acct:&nbsp;</td>
			<td class="data">&nbsp;#Account_ID#</td>
		</tr>
		<tr>
			<td class="label">Invoice Number:&nbsp;</td>
			<td class="data">&nbsp;#Invoice_Number#</td>
			<td class="label">Invoice Date:&nbsp;</td>
			<td class="data">&nbsp;#DateFormat(Invoice_Date, "mm/dd/yyyy")#</td>
			<td class="label">Invoice Type:&nbsp;</td>
			<td class="data">&nbsp;#Invoice_Type#</td>
		</tr>
		<tr>
			<td class="label">Orig. Invoice:&nbsp;</td>
			<td class="data">&nbsp;#Orig_Invoice_Number#</td>
			<td class="label">Currency Code:&nbsp;</td>
			<td class="data">&nbsp;#Currency_Code#</td>
			<td class="label">Due Date:&nbsp;</td>
			<td class="data">&nbsp;#DateFormat(Due_Date, "mm/dd/yyyy")#</td>
		</tr>
		<tr>
			<td class="label">Discount Date:&nbsp;</td>
			<td class="data">&nbsp;#DateFormat(Discount_Date, "mm/dd/yyyy")#</td>
			<td class="label">Number of Lines:&nbsp;</td>
			<td class="data">&nbsp;#Lines#</td>
			<td class="label">Sequence Number:&nbsp;</td>
			<td class="data">&nbsp;#Check_Number#</td>
		</tr>
		<tr>
			<td class="label">Invoice Note:&nbsp;</td>
			<td class="data" colspan="5">&nbsp;#Invoice_Note#</td>
		</tr>
	</cfoutput>
	</table>

	<cfoutput>
	<p>This invoice has #qryInvLineSummary.RecordCount# line(s):</p>
	</cfoutput>

	<cfset m_Currency_Code = Trim(qryInvHeaders.Currency_Code)>

	<table border="0" width="100%">
	<cfoutput query="qryInvLineSummary">
		<tr>
			<td class="counter">
				<a href="showInvLineFull.cfm?INV=#m_Inv_Number#&SUP=#m_Supplier_ID#&LINE=#Line_Number#">
				###Line_Number#.</a>&nbsp;
			</td>
			<td class="data" colspan="6">(<a href="showMarc.cfm?DBCN=#DBCN#">#DBCN#</a>)
					&nbsp;&nbsp;<cfif Author NEQ ""><em>#Author#</em>&nbsp;&nbsp;</cfif>#Title#
			</td>
		</tr>
		<tr>
			<td class="data">&nbsp;</td>
			<td class="label">PO:&nbsp;</td>
			<td class="data">&nbsp;<a href="showPO.cfm?POP=#Trim(PO_Prefix)#&PON=#Trim(PO_Number)#&DBCN=#DBCN#">#FormatPO(PO_Prefix, PO_Number)#</a></td>
			<td class="label">Volume:&nbsp;</td>
			<td class="data">&nbsp;#Volume#</td>
			<td class="label">Quantity:&nbsp;</td>
			<td class="data">&nbsp;#Qty_Invoiced#</td>
		</tr>
		<tr>
			<td class="data">&nbsp;</td>
			<td class="label">Fund(s):&nbsp;</td>
			<td class="data">&nbsp;#Fund_1#
				<cfif Percent_1 LT 100>&nbsp;(#NumberFormat(Percent_1, "99.999")#%)</cfif>
				<cfif Trim(Fund_2) NEQ ""><br>&nbsp;#Fund_2#&nbsp;(#NumberFormat(Percent_2, "99.999")#%)</cfif>
				<cfif Trim(Fund_3) NEQ ""><br>&nbsp;#Fund_3#&nbsp;(#NumberFormat(100 - Percent_1 - Percent_2, "99.999")#%)</cfif>
			</td>
			<td class="label">Prepaid:&nbsp;</td>
			<td class="data">
				<table cellspacing="1" cellpadding="0">
					<tr>
						<td>(USD)</td>
						<td align="right">#DecimalFormat(Conv_Amt_Prepaid)#</td>
					</tr>
				<cfif m_Currency_Code NEQ "">
					<tr>
						<td>(#m_Currency_Code#)</td>
						<td align="right">#DecimalFormat(Amt_Prepaid)#</td>
					</tr>
				</cfif>
				</table>
			</td>
			<td class="label">Expended:&nbsp;</td>
			<td class="data">
				<table cellspacing="1" cellpadding="0">
					<tr>
						<td>(USD)</td>
						<td align="right">#DecimalFormat(Conv_Amt_To_Expend)#</td>
					</tr>
				<cfif m_Currency_Code NEQ "">
					<tr>
						<td>(#m_Currency_Code#)</td>
						<td align="right">#DecimalFormat(Amt_To_Expend)#</td>
					</tr>
				</cfif>
				</table>
			</td>
		</tr>
<!---
--->
		<tr>
			<td class="data" colspan="7">&nbsp;</td>
		</tr>
	</cfoutput>
	</table>
