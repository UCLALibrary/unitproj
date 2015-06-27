<cfoutput>
	<p>Full PO header for #FormatPO(m_PO_Prefix, m_PO_Number)#
		(<a href="showPO.cfm?POP=#m_PO_Prefix#&PON=#m_PO_Number#&DBCN=#m_DBCN#&MODE=brief">Show header/line summary</a>)
	</p>
</cfoutput>

<!---
<table border="1">
<cfoutput query="qryPOHeaders">
	<tr>
		<td class="label">Placed:&nbsp;</td>
		<td class="data" colspan="5">&nbsp;#DateFormat(Order_Date, "mm/dd/yyyy")#</td>
	</tr>
	<tr>
		<td class="label">Last Pay:&nbsp;</td>
		<td class="data" colspan="5">&nbsp;#DateFormat(Last_Receipt_Date, "mm/dd/yyyy")#</td>
	</tr>
	<tr>
		<td class="label">Process:&nbsp;</td>
		<td class="data" colspan="5">&nbsp;#DateFormat(Process_Status_Date, "mm/dd/yyyy")# - #Process_Status#</td>
	</tr>
	<tr>
		<td class="label">Elec:&nbsp;</td>
		<td class="data">&nbsp;#Elec_Status#&nbsp;
			<cfif Elec_Ack_Date EQ "">(No date)
			<cfelse>#DateFormat(Elec_Ack_Date, "mm/dd/yyyy")#
			</cfif>
		</td>
		<td class="label">Conf Num:&nbsp;</td>
		<td class="data">&nbsp;#Elec_Conf_Number#</td>
		<td class="label">Ackn Num:&nbsp;</td>
		<td class="data">&nbsp;#Elec_Vendor_Ack_Number#</td>
	</tr>
	<tr>
		<td class="label">Acq Status:&nbsp;</td>
		<td class="data" colspan="5">&nbsp;
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
		<td class="label">Owning Location:&nbsp;</td>
		<td class="data" colspan="2">&nbsp;#Owning_Loc#</td>
		<td class="label">Prepaid:&nbsp;</td>
		<td class="data" colspan="2">&nbsp;#Prepay#</td>
	</tr>
	<tr>
		<td class="label">Order Type:&nbsp;</td>
		<td class="data" colspan="2">&nbsp;#Order_Type#</td>
		<td class="label">PO Type:&nbsp;</td>
		<td class="data" colspan="2">&nbsp;#PO_Type#</td>
	</tr>
	<tr>
		<td class="label">PO Prefix:&nbsp;</td>
		<td class="data" colspan="2">&nbsp;#PO_Prefix#</td>
		<td class="label">Encumber:&nbsp;</td>
		<td class="data" colspan="2">&nbsp;#Encumber#</td>
	</tr>
	<tr>
		<td class="label">PO Number:&nbsp;</td>
		<td class="data" colspan="2">&nbsp;#PO_Number#</td>
		<td class="label">Rush:&nbsp;</td>
		<td class="data" colspan="2">&nbsp;#Rush#</td>
	</tr>
	<tr>
		<td class="label">Supplier ID:&nbsp;</td>
		<td class="data" colspan="2">&nbsp;#Supplier_ID#</td>
		<td class="label">Bill To:&nbsp;</td>
		<td class="data" colspan="2">&nbsp;#Bill_To#</td>
	</tr>
	<tr>
		<td class="label">Supplier Acct:&nbsp;</td>
		<td class="data" colspan="2">&nbsp;#Account_ID#</td>
		<td class="label">Ship To:&nbsp;</td>
		<td class="data" colspan="2">&nbsp;#Ship_To#</td>
	</tr>
	<tr>
		<td class="label">Currency Code:&nbsp;</td>
		<td class="data" colspan="2">&nbsp;#Currency_Code#</td>
		<td class="label">Renew Date:&nbsp;</td>
		<td class="data" colspan="2">&nbsp;#DateFormat(Renewal_Date, "mm/dd/yyyy")#</td>
	</tr>
	<tr>
		<td class="label">Operator:&nbsp;</td>
		<td class="data" colspan="2">&nbsp;#Operator#</td>
		<td class="label">Expire Date:&nbsp;</td>
		<td class="data" colspan="2">&nbsp;#DateFormat(Expiration_Date, "mm/dd/yyyy")#</td>
	</tr>
	<tr>
		<td class="label">Approved:&nbsp;</td>
		<td class="data" colspan="5">&nbsp;
			<cfif PO_Approved_Date EQ "">(No date)
			<cfelse>#DateFormat(PO_Approved_Date, "mm/dd/yyyy")#
			</cfif>
	</tr>
	<tr>
		<td class="label">Alert Date:&nbsp;</td>
		<td class="data" colspan="5">&nbsp;#DateFormat(Alert_Date, "mm/dd/yyyy")#</td>
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
--->
<cfoutput query="qryPOHeaders">
<table border="1">
<cfloop list="#qryPOHeaders.columnList#" index="ColumnName">
	<tr>
		<td>#ColumnName#</td>
		<td>&nbsp;#qryPOHeaders[ColumnName][CurrentRow]#</td>
	</tr>
</cfloop>
</table>
</cfoutput>
