<cfquery name="qryList" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		Invoice_Number
	,	Supplier_ID
	,	Owning_Loc
	,	Invoice_Date
	,	Process_Status
	FROM Inv_Headers
<cfswitch expression=#m_Index#>
	<cfcase value="InvNumber">
		WHERE Invoice_Number = '#m_Terms#'
	</cfcase>
	<cfcase value="InvSeq">
		WHERE Check_Number = '#m_Terms#'
	</cfcase>
	<cfcase value="InvSuppID">
		WHERE Supplier_ID = '#m_Terms#'
	</cfcase>
	<cfcase value="InvSuppName">
		WHERE Supplier_ID IN (SELECT Supplier_ID FROM Suppliers WHERE Supplier_Name LIKE '%#m_Terms#%')
	</cfcase>
</cfswitch>
	ORDER BY Owning_Loc, Supplier_ID, Invoice_Date
</cfquery>
