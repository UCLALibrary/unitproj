<cfquery name="qryInvHeaders" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		*
	FROM Inv_Headers
	WHERE Invoice_Number = '#m_Inv_Number#'
	AND Supplier_ID = '#m_Supplier_ID#'
</cfquery>

<cfquery name="qryInvLineSummary" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		ILI.Line_Number
	,	ILI.DBCN
	,	ILO.PO_Prefix
	,	ILO.PO_Number
	,	ILO.Order_Loc
	,	ILO.Order_ID
	,	ILO.Volume
	,	ILO.Fund_1
	,	ILO.Fund_2
	,	ILO.Fund_3
	,	ILO.Percent_1
	,	ILO.Percent_2
	,	ILO.Amt_To_Expend
	,	ILO.Conv_Amt_To_Expend
	,	ILO.Amt_Prepaid
	,	ILO.Conv_Amt_Prepaid
	,	ILO.Qty_Invoiced
	,	BT.Author
	,	BT.Title
	FROM Inv_Lines ILI
	INNER JOIN Inv_Locs ILO
		ON ILI.Invoice_Number = ILO.Invoice_Number
		AND ILI.Supplier_ID = ILO.Supplier_ID
		AND ILI.Line_Number = ILO.Line_Number
	INNER JOIN Bib_Text BT
		ON ILI.DBCN = BT.DBCN
	WHERE ILO.Order_Loc != ''
	AND ILI.Invoice_Number = '#m_Inv_Number#'
	AND ILI.Supplier_ID = '#m_Supplier_ID#'
	ORDER BY ILI.Line_Number
</cfquery>
