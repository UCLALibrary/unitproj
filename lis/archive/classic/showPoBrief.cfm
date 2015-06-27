<cfoutput>
	<p>Summary information for #FormatPO(m_PO_Prefix, m_PO_Number)#
		(<a href="showPO.cfm?POP=#m_PO_Prefix#&PON=#m_PO_Number#&DBCN=#m_DBCN#&MODE=full">Show full header</a>)
	</p>
</cfoutput>
	<table border="1">
	<cfoutput query="qryPOHeaders">
		<tr>
			<td class="label">Placed:&nbsp;</td>
			<td class="data" colspan="2">&nbsp;#DateFormat(Order_Date, "mm/dd/yyyy")#</td>
			<td class="label">Last Pay:&nbsp;</td>
			<td class="data" colspan="2">&nbsp;#DateFormat(Last_Receipt_Date, "mm/dd/yyyy")#</td>
		</tr>
		<tr>
			<td class="label">PO Status:&nbsp;</td>
			<td class="data" colspan="2">&nbsp;#DateFormat(Process_Status_Date, "mm/dd/yyyy")# - #Process_Status#</td>
			<td class="label">Acq Status:&nbsp;</td>
			<td class="data" colspan="2">&nbsp;
				<cfif PO_Status_Date EQ "">(No date)
				<cfelse>#DateFormat(PO_Status_Date, "mm/dd/yyyy")#
				</cfif>
				- #PO_Status#
			</td>
		</tr>
		<tr>
			<td class="data" colspan="6">&nbsp;</td>
		</tr>
		<tr>
			<td class="label">Owning Loc:&nbsp;</td>
			<td class="data">&nbsp;#Owning_Loc#</td>
			<td class="label">PO Prefix:&nbsp;</td>
			<td class="data">&nbsp;#PO_Prefix#</td>
			<td class="label">PO Number:&nbsp;</td>
			<td class="data">&nbsp;#PO_Number#</td>
		</tr>
		<tr>
			<td class="label">Supplier ID:&nbsp;</td>
			<td class="data">&nbsp;<a href="showSupplier.cfm?SUP=#Supplier_ID#">#Supplier_ID#</a></td>
			<td class="label">Supplier Acct:&nbsp;</td>
			<td class="data">&nbsp;#Account_ID#</td>
			<td class="label">Currency Code:&nbsp;</td>
			<td class="data">&nbsp;#Currency_Code#</td>
		</tr>
		<tr>
			<td class="label">Order Type:&nbsp;</td>
			<td class="data">&nbsp;#Order_Type#</td>
			<td class="label">PO Type:&nbsp;</td>
			<td class="data">&nbsp;#PO_Type#</td>
			<td class="label">Operator:&nbsp;</td>
			<td class="data">&nbsp;#Operator#</td>
		</tr>
		<tr>
			<td class="label">Prepaid:&nbsp;</td>
			<td class="data">&nbsp;#Prepay#</td>
			<td class="label">Encumber:&nbsp;</td>
			<td class="data">&nbsp;#Encumber#</td>
			<td class="label">Rush:&nbsp;</td>
			<td class="data">&nbsp;#Rush#</td>
		</tr>
		<tr>
			<td class="label">Bill To:&nbsp;</td>
			<td class="data">&nbsp;#Bill_To#</td>
			<td class="label">Ship To:&nbsp;</td>
			<td class="data">&nbsp;#Ship_To#</td>
			<td class="label">&nbsp;</td>
			<td class="data">&nbsp;</td>
		</tr>
		<tr>
			<td class="label">Renew Date:&nbsp;</td>
			<td class="data">&nbsp;#DateFormat(Renewal_Date, "mm/dd/yyyy")#</td>
			<td class="label">Expire Date:&nbsp;</td>
			<td class="data">&nbsp;#DateFormat(Expiration_Date, "mm/dd/yyyy")#</td>
			<td class="label">Alert Date:&nbsp;</td>
			<td class="data">&nbsp;#DateFormat(Alert_Date, "mm/dd/yyyy")#</td>
		</tr>
		<tr>
			<td class="label">Alert Note:&nbsp;</td>
			<td class="data" colspan="5">&nbsp;#Alert_Note#</td>
		</tr>
		<tr>
			<td class="label">Library Note:&nbsp;</td>
			<td class="data" colspan="5">&nbsp;#Library_Note#</td>
		</tr>
		<tr>
			<td class="label">Supplier Note:&nbsp;</td>
			<td class="data" colspan="5">&nbsp;#Supplier_Note#</td>
		</tr>
		<tr>
			<td class="label">Checkinfo Note:&nbsp;</td>
			<td class="data" colspan="5">&nbsp;#Check_Note#</td>
		</tr>
	</cfoutput>
	</table>


	<cfoutput>
	<p>This PO has #qryPoLineSummary.RecordCount# line(s):</p>
	</cfoutput>


	<table border="0">
	<cfoutput query="qryPoLineSummary">
		<tr>
			<td class="counter">
				<a href="showPoLineFull.cfm?POP=#m_PO_Prefix#&PON=#m_PO_Number#&DBCN=#DBCN#&OID=#Trim(Order_ID)#&VOL=#Trim(Volume)#&VAR=#Variant#">
				###qryPoLineSummary.CurrentRow#.</a>&nbsp;
			</td>
			<td class="data" colspan="6">(<a href="showMarc.cfm?DBCN=#DBCN#">#DBCN#</a>)
					&nbsp;&nbsp;<cfif Author NEQ ""><em>#Author#</em>&nbsp;&nbsp;</cfif>#Title#
			</td>
		</tr>
		<tr>
			<td class="data">&nbsp;</td>
			<td class="label">Volume:&nbsp;</td>
			<td class="data">&nbsp;#Volume#</td>
			<td class="label">Order ID:&nbsp;</td>
			<td class="data">&nbsp;#Order_ID#</td>
			<td class="label">Status:&nbsp;</td>
			<td class="data" colspan="3">
				&nbsp;#Process_Status#<cfif Trim(Acq_Status) NEQ "NoStatus"> / #Acq_Status#</cfif>
				- #DateFormat(Process_Status_Date, "mm/dd/yyyy")#
			</td>
		</tr>
		<tr>
			<td class="data">&nbsp;</td>
			<td class="label">Invoice:&nbsp;</td>
			<td class="data">&nbsp;<a href="showInvoice.cfm?INV=#Trim(Invoice_Number)#&SUP=#Trim(Supplier_ID)#">#Invoice_Number#</a></td>
			<td class="label">Fund(s):&nbsp;</td>
			<td class="data">&nbsp;#Fund_1#
				<cfif Percent_1 LT 100>&nbsp;(#NumberFormat(Percent_1, "99.999")#%)</cfif>
				<cfif Trim(Fund_2) NEQ ""><br>&nbsp;#Fund_2#&nbsp;(#NumberFormat(Percent_2, "99.999")#%)</cfif>
				<cfif Trim(Fund_3) NEQ ""><br>&nbsp;#Fund_3#&nbsp;(#NumberFormat(100 - Percent_1 - Percent_2, "99.999")#%)</cfif>
			</td>
			<td class="label">Encumbered:&nbsp;</td>
			<td class="data">
				<table cellspacing="1" cellpadding="0">
					<tr>
						<td>(USD)</td>
						<td align="right">#DecimalFormat(Conv_Encumbered)#</td>
					</tr>
				<cfif Trim(Currency_Code) NEQ "">
					<tr>
						<td>(#Currency_Code#)</td>
						<td align="right">#DecimalFormat(Encumbered)#</td>
					</tr>
				</cfif>
				</table>
			</td>
			<td class="label">Prepaid:&nbsp;</td>
			<td class="data">
				<table cellspacing="1" cellpadding="0">
					<tr>
						<td>(USD)</td>
						<td align="right">#DecimalFormat(Conv_Amount_Prepaid)#</td>
					</tr>
				<cfif Trim(Currency_Code) NEQ "">
					<tr>
						<td>(#Currency_Code#)</td>
						<td align="right">#DecimalFormat(Amount_Prepaid)#</td>
					</tr>
				</cfif>
				</table>
			</td>
<!---
			<td class="label">Expended:&nbsp;</td>
			<td class="data">
				<table cellspacing="1" cellpadding="0">
					<tr>
						<td>(USD)</td>
						<td align="right">#DecimalFormat(Conv_Expended)#</td>
					</tr>
				<cfif Trim(Currency_Code) NEQ "">
					<tr>
						<td>(#Currency_Code#)</td>
						<td align="right">#DecimalFormat(Expended)#</td>
					</tr>
				</cfif>
				</table>
			</td>
--->
		</tr>
		<tr>
			<td class="data" colspan="7">&nbsp;</td>
		</tr>
	</cfoutput>
	</table>
