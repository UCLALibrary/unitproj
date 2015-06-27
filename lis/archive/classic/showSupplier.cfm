<cfif IsDefined("URL.SUP") is false>
	<cflocation url="archive.cfm">
</cfif>

<cfset m_Supplier_ID = Trim(URL.SUP)>

<cfinclude template="qrySuppFull.cfm">

<cfoutput>
<html>
<head>
	<title>Supplier Record - #m_Supplier_ID#</title>
	<link rel="StyleSheet" href="classic.css" type="text/css" media="screen">
</head>
</cfoutput>

<body>

<p>
	<a href="archive.cfm">Return to search screen</a>
</p>

<table border="1">
<cfoutput query="qrySuppHeaders">
	<tr>
		<td class="label">Supplier Name:&nbsp;</td>
		<td class="data" colspan="3">&nbsp;#Supplier_Name#</td>
	</tr>
	<tr>
		<td class="label">Distributor:&nbsp;</td>
		<td class="data">&nbsp;#Distributor#</td>
		<td class="label">Phone ##:&nbsp;</td>
		<td class="data">&nbsp;#Phone#</td>
	</tr>
	<tr>
		<td class="label">BIP Code:&nbsp;</td>
		<td class="data">&nbsp;#BIP_Code#</td>
		<td class="label">Fax ##:&nbsp;</td>
		<td class="data">&nbsp;#Fax#</td>
	</tr>
	<tr>
		<td class="label">Supplier ISAN:&nbsp;</td>
		<td class="data">&nbsp;#ISAN#</td>
		<td class="label">SAN Suffix:&nbsp;</td>
		<td class="data">&nbsp;#SAN_Suffix#</td>
	</tr>
	<tr>
		<td class="label">ISBN Only E/O:&nbsp;</td>
		<td class="data">&nbsp;#ISBN_Only#</td>
		<td class="label">E/O Relaxed Mode:&nbsp;</td>
		<td class="data">&nbsp;#Elec_Order_Mode#</td>
	</tr>
	<tr>
		<td class="label">Dialup Phone:&nbsp;</td>
		<td class="data">&nbsp;#Dialup_Phone#</td>
		<td class="label">Prepay Reqd:&nbsp;</td>
		<td class="data">&nbsp;#Prepay_Reqd#</td>
	</tr>
	<tr>
		<td class="label">Note:&nbsp;</td>
		<td class="data" colspan="3">&nbsp;#Note#</td>
	</tr>
	<tr>
		<td class="data" colspan="4">&nbsp;</td>
	</tr>
</cfoutput>

<cfset m_Addr_Claim = qrySuppHeaders.Claim_Address>
<cfset m_Addr_Order = qrySuppHeaders.Order_Address>
<cfset m_Addr_Pay = qrySuppHeaders.Pay_Address>
<cfset m_Addr_Return = qrySuppHeaders.Return_Address>

<cfoutput query="qrySuppAddresses">
	<tr>
		<td class="label">Address ###Address_Type#:&nbsp;</td>
		<td class="data" colspan="3">
			<cfif Address_Type EQ m_Addr_Claim>&nbsp;Claim</cfif>
			<cfif Address_Type EQ m_Addr_Order>&nbsp;Order</cfif>
			<cfif Address_Type EQ m_Addr_Pay>&nbsp;Pay</cfif>
			<cfif Address_Type EQ m_Addr_Return>&nbsp;Return</cfif>
		</td>
	</tr>
	<tr>
		<td class="label">Email Address:&nbsp;</td>
		<td class="data" colspan="3">&nbsp;#Email#</td>
	</tr>
	<tr>
		<td class="label">Contact:&nbsp;</td>
		<td class="data" colspan="3">&nbsp;#Contact#</td>
	</tr>
	<tr>
		<td class="label">Phone ##:&nbsp;</td>
		<td class="data">&nbsp;#Phone#</td>
		<td class="label">Ext:&nbsp;</td>
		<td class="data">&nbsp;#Extension#</td>
	</tr>
	<tr>
		<td class="label">Address (1):&nbsp;</td>
		<td class="data" colspan="3">&nbsp;#Address_1#</td>
	</tr>
	<tr>
		<td class="label">Address (2):&nbsp;</td>
		<td class="data" colspan="3">&nbsp;#Address_2#</td>
	</tr>
	<tr>
		<td class="label">City:&nbsp;</td>
		<td class="data">&nbsp;#City#</td>
		<td class="label">State:&nbsp;</td>
		<td class="data">&nbsp;#State#</td>
	</tr>
	<tr>
		<td class="label">Countryy:&nbsp;</td>
		<td class="data">&nbsp;#Country#</td>
		<td class="label">Postal Code:&nbsp;</td>
		<td class="data">&nbsp;#Postal_Code#</td>
	</tr>
	<tr>
		<td class="data" colspan="4">&nbsp;</td>
	</tr>
</cfoutput>
<cfoutput query="qrySuppAccounts">
	<tr>
		<td class="label">Account ID:&nbsp;</td>
		<td class="data">&nbsp;#Account_ID#</td>
		<td class="label">Account Number:&nbsp;</td>
		<td class="data">&nbsp;#Account_Number#</td>
	</tr>
	<tr>
		<td class="label">Account Type:&nbsp;</td>
		<td class="data">&nbsp;#Account_Type#</td>
		<td class="label">Flat Discount:&nbsp;</td>
		<td class="data">&nbsp;<cfif Flat_Discount NEQ 0>#Flat_Discount#</cfif></td>
	</tr>
	<tr>
		<td class="label">Order From ID:&nbsp;</td>
		<td class="data">&nbsp;#Order_From#</td>
		<td class="label">Sliding Scale:&nbsp;</td>
		<td class="data">&nbsp;#Sliding_Scale#</td>
	</tr>
	<tr>
		<td class="label">Other ID:&nbsp;</td>
		<td class="data">&nbsp;#Other_ID#</td>
		<td class="label">Days To Claim:&nbsp;</td>
		<td class="data">&nbsp;<cfif Days_To_Claim EQ -1>Blocked<cfelse>#Days_To_Claim#</cfif></td>
	</tr>
	<tr>
		<td class="label">Lib SAN Suffix:&nbsp;</td>
		<td class="data">&nbsp;#Lib_San_Suffix#</td>
		<td class="label">Days To Cancel:&nbsp;</td>
		<td class="data">&nbsp;<cfif Days_To_Cancel EQ -1>Blocked<cfelse>#Days_To_Cancel#</cfif></td>
	</tr>
	<tr>
		<td class="label">Dialup Account:&nbsp;</td>
		<td class="data">&nbsp;#Dialup_Account#</td>
		<td class="label">Currency Code:&nbsp;</td>
		<td class="data">&nbsp;#Currency_Code#</td>
	</tr>
	<tr>
		<td class="label">Dialup Password:&nbsp;</td>
		<td class="data">&nbsp;#Dialup_Password#</td>
		<td class="label">Payment Terms:&nbsp;</td>
		<td class="data">&nbsp;#Payment_Terms#</td>
	</tr>
	<tr>
		<td class="label">Ship Instruct:&nbsp;</td>
		<td class="data">&nbsp;#Ship_Instructions#</td>
		<td class="label">Report Class:&nbsp;</td>
		<td class="data">&nbsp;#Class#</td>
	</tr>
	<tr>
		<td class="label">PO Note:&nbsp;</td>
		<td class="data" colspan="3">&nbsp;#Note#</td>
	</tr>
	<tr>
		<td class="data" colspan="4">&nbsp;</td>
	</tr>
</cfoutput>
</table>

</body>
</html>

<!---
CREATE TABLE Accounts (
,	Account_ID VARCHAR(12) NOT NULL
,	Account_Type VARCHAR(9) NOT NULL DEFAULT ''
,	Other_ID VARCHAR(12) NOT NULL DEFAULT ''
,	Account_Number VARCHAR(25) NOT NULL DEFAULT ''
,	Dialup_Account VARCHAR(25) NOT NULL DEFAULT ''
,	Dialup_Password VARCHAR(25) NOT NULL DEFAULT ''
,	Lib_San_Suffix VARCHAR(5) NOT NULL DEFAULT ''
,	Sliding_Scale VARCHAR(8) NOT NULL DEFAULT ''
,	Flat_Discount NUMERIC(5,3) NOT NULL DEFAULT 0
,	Days_To_Claim INT NOT NULL DEFAULT 0
,	Days_To_Cancel INT NOT NULL DEFAULT 0
,	Payment_Terms VARCHAR(8) NOT NULL DEFAULT ''
,	Currency_Code VARCHAR(3) NOT NULL DEFAULT ''
,	Class VARCHAR(8) NOT NULL DEFAULT ''
,	Order_From VARCHAR(12) NOT NULL DEFAULT ''
,	Ship_Instructions VARCHAR(25) NOT NULL DEFAULT ''
,	Note VARCHAR(60) NOT NULL DEFAULT ''
)
GO

--->