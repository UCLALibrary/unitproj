<cfquery name="qryList" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		IH.Invoice_Number
	,	IH.Supplier_ID
	,	IH.Owning_Loc
	,	IH.Invoice_Date
	,	IH.Paid_Date
	,	IH.Process_Status
	,	IH.Currency_Code
	,	ILI.Line_Number
	,	ILI.DBCN
	,	ILO.Conv_Amt_To_Expend
	,	ILO.Volume
<!---
	,	(SELECT COUNT(*) FROM Inv_Lines WHERE Invoice_Number = IH.Invoice_Number AND Supplier_ID = IH.Supplier_ID) AS Total_Lines
	,	ILO.PO_Prefix
	,	ILO.PO_Number
	,	ILO.Order_Loc
	,	ILO.Order_ID
	,	ILO.Fund_1
	,	ILO.Fund_2
	,	ILO.Fund_3
	,	ILO.Percent_1
	,	ILO.Percent_2
	,	ILO.Amt_To_Expend
	,	ILO.Amt_Prepaid
	,	ILO.Conv_Amt_Prepaid
--->
	FROM Inv_Headers IH
	INNER JOIN Inv_Lines ILI
		ON IH.Invoice_Number = ILI.Invoice_Number
		AND IH.Supplier_ID = ILI.Supplier_ID
	INNER JOIN Inv_Locs ILO
		ON ILI.Invoice_Number = ILO.Invoice_Number
		AND ILI.Supplier_ID = ILO.Supplier_ID
		AND ILI.Line_Number = ILO.Line_Number
	WHERE ILO.Order_Loc != ''
	AND ILI.DBCN = '#m_Terms#'
	ORDER BY IH.Owning_Loc ASC, IH.Invoice_Date DESC, ILI.Line_Number DESC
</cfquery>
