<cfquery name="qryInvLines" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		*
	FROM Inv_Lines
	WHERE Invoice_Number = '#m_Inv_Number#'
	AND Supplier_ID = '#m_Supplier_ID#'
	AND Line_Number = #m_Line_Number#
</cfquery>

<cfquery name="qryInvLocs" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		*
	FROM Inv_Locs
	WHERE Invoice_Number = '#m_Inv_Number#'
	AND Supplier_ID = '#m_Supplier_ID#'
	AND Line_Number = #m_Line_Number#
</cfquery>

