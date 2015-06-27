<cfquery name="qryList" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		PH.PO_Prefix
	,	PH.PO_Number
	,	PH.Owning_Loc
	,	PH.Supplier_ID
	,	PH.Process_Status
	,	COUNT(*) AS Line_Count
	FROM PO_Lines PL
	INNER JOIN PO_Headers PH
		ON PL.PO_Prefix = PH.PO_Prefix
		AND PL.PO_Number = PH.PO_Number

<cfswitch expression=#m_Index#>
	<cfcase value="PoLine">
		WHERE PL.DBCN = '#m_Terms#'
	</cfcase>
	<cfcase value="PoNumber">
		WHERE PH.Full_PO = '#m_Terms#'
	</cfcase>
	<cfcase value="PoSuppID">
		WHERE PH.Supplier_ID = '#m_Terms#'
	</cfcase>
	<cfcase value="PoSuppName">
		WHERE PH.Supplier_ID IN (SELECT Supplier_ID FROM Suppliers WHERE Supplier_Name LIKE '%#m_Terms#%')
	</cfcase>
</cfswitch>

	GROUP BY PH.Owning_Loc, PH.PO_Prefix, PH.PO_Number, PH.Supplier_ID, PH.Process_Status
	ORDER BY PH.Owning_Loc, PH.PO_Prefix, PH.PO_Number
</cfquery>
