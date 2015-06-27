<cfquery name="qryPoHeaders" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		*
	FROM PO_Headers
	WHERE PO_Prefix = '#m_PO_Prefix#'
	AND PO_Number = '#m_PO_Number#'
</cfquery>

<cfquery name="qryPoLineSummary" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
SELECT
	IL.Invoice_Number
,	IL.Supplier_ID
,	PL.DBCN
,	PL.Order_ID
,	PL.Volume
,	PL.Variant
,	PL.Process_Status
,	PL.Process_Status_Date
,	PL.Acq_Status
,	PL.Acq_Status_Date
,	PO.Fund_1
,	PO.Percent_1
,	PO.Fund_2
,	PO.Percent_2
,	PO.Fund_3
,	PO.Encumbered
,	PO.Conv_Encumbered
,	PO.Expended
,	PO.Conv_Expended
,	PO.Amount_Prepaid
,	PO.Conv_Amount_Prepaid
,	PH.Currency_Code
,	BT.Author
,	BT.Title
FROM PO_Lines PL
LEFT OUTER JOIN PO_Orders PO
	ON PL.PO_Prefix = PO.PO_Prefix
	AND PL.PO_Number = PO.PO_Number
	AND PL.DBCN = PO.DBCN
	AND PL.Order_ID = PO.Order_ID
	AND PL.Volume = PO.Volume
	AND PL.Variant = PO.Variant
LEFT OUTER JOIN Inv_Locs IL
	ON PL.PO_Prefix = IL.PO_Prefix
	AND PL.PO_Number = IL.PO_Number
	AND PL.DBCN = IL.DBCN
	AND PL.Order_ID = IL.Order_ID
	AND PL.Volume = IL.Volume
INNER JOIN Bib_Text BT
	ON PL.DBCN = BT.DBCN
INNER JOIN PO_Headers PH
	ON PL.PO_Prefix = PH.PO_Prefix
	AND PL.PO_Number = PH.PO_Number
WHERE PL.PO_Prefix = '#m_PO_Prefix#'
AND PL.PO_Number = '#m_PO_Number#'
ORDER BY PL.Order_ID, PL.Volume, PL.Variant
</cfquery>
