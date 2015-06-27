<cfif IsDefined("URL.FID") is false or IsDefined("URL.SD") is false or IsDefined("URL.ED") is false>
	<cflocation url="archive.cfm">
</cfif>

<cfset m_Fund_ID = URL.FID>
<cfset m_Start_Date = URL.SD>
<cfset m_End_Date = URL.ED>

<cfinclude template="qryFundFull.cfm">

<cfoutput>
<html>
<head>
	<title>Fund Record - #m_Fund_ID#</title>
	<link rel="StyleSheet" href="classic.css" type="text/css" media="screen">
</head>
</cfoutput>

<body>

<p>
	<a href="archive.cfm">Return to search screen</a>
</p>

<table border="1">
<cfoutput query="qryFunds">
	<cfset m_Total_Allocation = Carried_Allocation + Current_Allocation>
	<cfset m_Total_Encumbrance = Carried_Encumbrance + Current_Encumbrance>
	<cfset m_Cash_Balance = m_Total_Allocation - Total_Expended>
	<cfset m_Working_Balance = m_Cash_Balance - m_Total_Encumbrance>
	<cfset m_Current_Deposits = Total_Expended>
	<cfset m_Total_Deposits = Carried_Deposits + m_Current_Deposits>

	<tr>
		<td class="label">Fund ID:&nbsp;</td>
		<td class="data">&nbsp;#Fund_ID#</td>
		<td class="label">Rolled into:&nbsp;</td>
		<td class="data" colspan="3">&nbsp;#Roll_ID#</td>
	</tr>
	<tr>
		<td class="label">Starting Date:&nbsp;</td>
		<td class="data">&nbsp;#DateFormat(Start_Date, "mm/dd/yyyy")#</td>
		<td class="label">Owner:&nbsp;</td>
		<td class="data">&nbsp;#Owning_Loc#</td>
		<td class="label">Block Roll:&nbsp;</td>
		<td class="data">&nbsp;#Block_Roll#</td>
	</tr>
	<tr>
		<td class="label">Ending Date:&nbsp;</td>
		<td class="data">&nbsp;#DateFormat(End_Date, "mm/dd/yyyy")#</td>
		<td class="label">Access:&nbsp;</td>
		<td class="data">&nbsp;#Access#</td>
		<td class="label">Active:&nbsp;</td>
		<td class="data">&nbsp;#Active#</td>
	</tr>
	<tr>
		<td class="label">Fund Type:&nbsp;</td>
		<td class="data">&nbsp;#Fund_Type#</td>
		<td class="label">Scope:&nbsp;</td>
		<td class="data">&nbsp;#Scope#</td>
		<td class="label">Class:&nbsp;</td>
		<td class="data">&nbsp;#Report_Class#</td>
	</tr>
	<tr>
		<td class="label">Alternate ID:&nbsp;</td>
		<td class="data">&nbsp;#Alt_Fund_ID#</td>
		<td class="label">Min Cash Bal:&nbsp;</td>
		<td class="data" colspan="3">&nbsp;#NumberFormat(Min_Cash_Balance, "0.000")#% of alloc</td>
	</tr>
	<tr>
		<td class="label">Gen Ledger No:&nbsp;</td>
		<td class="data">&nbsp;#General_Ledger_Number#</td>
		<td class="label">Min Work Bal:&nbsp;</td>
		<td class="data" colspan="3">&nbsp;#NumberFormat(Min_Working_Balance, "0.000")#% of alloc</td>
	</tr>
	<tr>
		<td class="label">Deposit Acct No:&nbsp;</td>
		<td class="data" colspan="5">&nbsp;#Deposit_Acct_Number#</td>
	</tr>
	<tr>
		<td class="label">Fund Note:&nbsp;</td>
		<td class="data" colspan="5">&nbsp;#Note#</td>
	</tr>
	<tr>
		<td class="data" colspan="6">&nbsp;</td>
	</tr>
<!--- Allocations and Expenditures (or Deposits/Receipts) --->
<cfif Trim(Fund_Type) EQ "DEPOSIT">
	<tr>
		<td class="label">Carried Alloc:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(Carried_Allocation)#</td>
		<td class="label">Carried Deposits:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(Carried_Deposits)#</td>
		<td class="data" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td class="label">Current Alloc:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(Current_Allocation)#</td>
		<td class="label">Current Deposits:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(m_Current_Deposits)#</td> <!--- for deposit accounts, total_expended = current deposits --->
		<td class="data" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td class="label">Total Alloc:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(m_Total_Allocation)#</td>
		<td class="label">% of Allocation:&nbsp;</td>
		<cfif m_Total_Allocation NEQ 0>
			<cfset num = 100 * Total_Expended / m_Total_Allocation>
		<cfelse>
			<cfset num = 0>
		</cfif>
		<td class="money">&nbsp;#NumberFormat(num, "9999.0")#%</td>
		<td class="data" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td class="data" colspan="2">&nbsp;</td>
		<td class="label">Items Received:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(Deposit_Items_Received)#</td>
		<td class="data" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td class="data" colspan="2">&nbsp;</td>
		<td class="label">% of Allocation:&nbsp;</td>
		<cfif m_Total_Allocation NEQ 0>
			<cfset num = 100 * Deposit_Items_Received / m_Total_Allocation>
		<cfelse>
			<cfset num = 0>
		</cfif>
		<td class="money">&nbsp;#NumberFormat(num, "9999.0")#%</td>
		<td class="data" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td class="label">Carried Encum:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(Carried_Encumbrance)#</td>
		<td class="label">Allocation Balance:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(m_Total_Allocation - m_Current_Deposits)#</td>
		<td class="data" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td class="label">Current Encum:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(Current_Encumbrance)#</td>
		<td class="label">Cash Balance:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(m_Total_Deposits - Deposit_Items_Received)#</td>
		<td class="data" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td class="label">Total Encum:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(m_Total_Encumbrance)#</td>
		<td class="label">Working Balance:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(m_Total_Deposits - Deposit_Items_Received - m_Total_Encumbrance)#</td>
		<td class="data" colspan="2">&nbsp;</td>
	</tr>
<cfelse> <!--- Expenditures --->
	<tr>
		<td class="label">Carried Alloc:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(Carried_Allocation)#</td>
		<td class="label">Total Expended:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(Total_Expended)#</td>
		<td class="data" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td class="label">Current Alloc:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(Current_Allocation)#</td>
		<td class="label">% of Allocation:&nbsp;</td>
		<cfif m_Total_Allocation NEQ 0>
			<cfset num = 100 * Total_Expended / m_Total_Allocation>
		<cfelse>
			<cfset num = 0>
		</cfif>
		<td class="money">&nbsp;#NumberFormat(num, "9999.0")#%</td>
		<td class="data" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td class="label">Total Alloc:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(m_Total_Allocation)#</td>
		<td class="data" colspan="4">&nbsp;</td>
	</tr>
	<tr>
		<td class="label">Carried Encum:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(Carried_Encumbrance)#</td>
		<td class="label">Cash Balance:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(m_Cash_Balance)#</td>
		<td class="data" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td class="label">Current Encum:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(Current_Encumbrance)#</td>
		<td class="label">% of Allocation:&nbsp;</td>
		<cfif m_Total_Allocation NEQ 0>
			<cfset num = 100 * m_Cash_Balance / m_Total_Allocation>
		<cfelse>
			<cfset num = 0>
		</cfif>
		<td class="money">&nbsp;#NumberFormat(num, "9999.0")#%</td>
		<td class="data" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td class="label">Total Encum:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(m_Total_Encumbrance)#</td>
		<td class="label">Working Balance:&nbsp;</td>
		<td class="money">&nbsp;#DollarFormat(m_Working_Balance)#</td>
		<td class="data" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td class="label">% of Allocation:&nbsp;</td>
		<cfif m_Total_Allocation NEQ 0>
			<cfset num = 100 * m_Total_Encumbrance / m_Total_Allocation>
		<cfelse>
			<cfset num = 0>
		</cfif>
		<td class="money">&nbsp;#NumberFormat(num, "9999.0")#%</td>
		<td class="label">% of Allocation:&nbsp;</td>
		<cfif m_Total_Allocation NEQ 0>
			<cfset num = 100 * m_Working_Balance / m_Total_Allocation>
		<cfelse>
			<cfset num = 0>
		</cfif>
		<td class="money">&nbsp;#NumberFormat(num, "9999.0")#%</td>
		<td class="data" colspan="2">&nbsp;</td>
	</tr>
</cfif>
</cfoutput>
</table>

<hr>

<cfif IsDefined("URL.TT") is true>
	<cfset m_TT = URL.TT>
<cfelse>
	<cfset m_TT = "NON">
</cfif>

<cfoutput>
<form method="GET" action="showFund.cfm">
	<input type="hidden" name="FID" value="#m_Fund_ID#">
	<input type="hidden" name="SD" value="#m_Start_Date#">
	<input type="hidden" name="ED" value="#m_End_Date#">
	<select name="TT">
		<option value="NON" <cfif m_TT EQ "NON">selected</cfif>>Don't show transactions</option>
		<option value="ALL" <cfif m_TT EQ "ALL">selected</cfif>>All transactions</option>
		<option value="CEN" <cfif m_TT EQ "CEN">selected</cfif>>Currency encumbrance change</option>
		<option value="IDE" <cfif m_TT EQ "IDE">selected</cfif>>Invoice expenditure (deposit)</option>
		<option value="IEX" <cfif m_TT EQ "IEX">selected</cfif>>Invoice expenditure (regular)</option>
		<option value="MCA" <cfif m_TT EQ "MCA">selected</cfif>>Manual allocation (carried)</option>
		<option value="MAL" <cfif m_TT EQ "MAL">selected</cfif>>Manual allocation (current)</option>
		<option value="MCD" <cfif m_TT EQ "MCD">selected</cfif>>Manual deposit (carried)</option>
		<option value="MDE" <cfif m_TT EQ "MDE">selected</cfif>>Manual deposit items received</option>
		<option value="MCE" <cfif m_TT EQ "MCE">selected</cfif>>Manual encumbrance (carried)</option>
		<option value="MEN" <cfif m_TT EQ "MEN">selected</cfif>>Manual encumbrance (current)</option>
		<option value="MEX" <cfif m_TT EQ "MEX">selected</cfif>>Manual expenditure</option>
		<option value="PCE" <cfif m_TT EQ "PCE">selected</cfif>>PO encumbrance (carried)</option>
		<option value="PEN" <cfif m_TT EQ "PEN">selected</cfif>>PO encumbrance (current)</option>
		<option value="PEX" <cfif m_TT EQ "PEX">selected</cfif>>PO expenditure</option>
		<option value="RCA" <cfif m_TT EQ "RCA">selected</cfif>>Roll allocation (carried)</option>
		<option value="RAL" <cfif m_TT EQ "RAL">selected</cfif>>Roll allocation (current)</option>
		<option value="RCD" <cfif m_TT EQ "RCD">selected</cfif>>Roll deposit (carried)</option>
		<option value="RCE" <cfif m_TT EQ "RCE">selected</cfif>>Roll encumbrance (carried)</option>
	</select>
	<input type="submit" name="submit" value="Show transactions">
</form>
</cfoutput>

<cfif m_TT NEQ "NON">
	<cfinclude template="formatPO.cfm">

	<cfinclude template="qryFundTransactions.cfm">
	<table border="1">
	<cfoutput query="qryFundTransactions">
		<tr>
			<td class="label">Type:&nbsp;</td>
			<td class="data">&nbsp;#Record_Type##Transaction_Type#</td>
			<td class="label">Date:&nbsp;</td>
			<td class="data">&nbsp;#DateFormat(Transaction_Date, "mm/dd/yyyy")#</td>
			<td class="label">Created:&nbsp;</td>
			<td class="data">&nbsp;#DateFormat(Created_Date, "mm/dd/yyyy")# #TimeFormat(Created_Date, "HH:mm:ss")#</td>
			<td class="label">User:&nbsp;</td>
			<td class="data">&nbsp;#Username#</td>
		</tr>
		<tr>
			<td class="label">PO:&nbsp;</td>
			<td class="data">&nbsp;<a href="showPO.cfm?POP=#Trim(PO_Prefix)#&PON=#Trim(PO_Number)#&DBCN=#DBCN#">#FormatPO(PO_Prefix, PO_Number)#</a></td>
			<td class="label">Invoice:&nbsp;</td>
			<td class="data">&nbsp;<a href="showInvoice.cfm?INV=#Trim(Invoice_Number)#&SUP=#Trim(Supplier_ID)#">#Invoice_Number#</a></td>
			<td class="label">Supplier:&nbsp;</td>
			<td class="data">&nbsp;<a href="showSupplier.cfm?SUP=#Supplier_ID#">#Supplier_ID#</a></td>
			<td class="label">Account:&nbsp;</td>
			<td class="data">&nbsp;#Account_ID#</td>
		</tr>
		<tr>
			<td class="label">Loc:&nbsp;</td>
			<td class="data">&nbsp;#Order_Loc#</td>
			<td class="label">DBCN:&nbsp;</td>
			<td class="data">&nbsp;<a href="showMarc.cfm?DBCN=#DBCN#">#DBCN#</a></td>
			<td class="label">Base amt:&nbsp;</td>
			<td class="data">&nbsp;#DollarFormat(Base_Amount)#</td>
			<td class="label">Foreign amt:&nbsp;</td>
			<td class="data">&nbsp;<cfif Currency_Code NEQ "USD">(#Currency_Code#)#NumberFormat(Foreign_Amount, "9999999.99")#</cfif></td>
		</tr>
	<cfif Description NEQ ''>
		<tr>
			<td class="label">Desc:&nbsp;</td>
			<td class="data" colspan="7">&nbsp;#Description#</td>
		</tr>
	</cfif>
		<tr>
			<td class="data" colspan="8">&nbsp;</td>
		</tr>
	</cfoutput>
	</table>
</cfif>
</body>
</html>
