<cfquery name="qryFundTransactions" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		Transaction_Date
	,	Created_Date
	,	Record_Type
	,	Transaction_Type
	,	Currency_Code
	,	Username
	,	Base_Amount
	,	Foreign_Amount
	,	DBCN
	,	Order_Loc
	,	Supplier_ID
	,	Account_ID
	,	PO_Prefix
	,	PO_Number
	,	Invoice_Number
	,	Description
	FROM Fund_Transactions
	WHERE Fund_ID = '#m_Fund_ID#'
	AND Fund_Start_Date = '#m_Start_Date#'
	AND Fund_End_Date = '#m_End_Date#'
<cfif m_TT NEQ "ALL">
	AND Record_Type = '#Mid(m_TT, 1, 1)#'
	AND Transaction_Type = '#Mid(m_TT, 2, 2)#'
</cfif>
	ORDER BY Created_Date, Record_Type, Transaction_Type
</cfquery>
