<cfquery name="qryPoLines" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		*
	FROM PO_Lines
	WHERE PO_Prefix = '#m_PO_Prefix#'
	AND PO_Number = '#m_PO_Number#'
	AND DBCN = '#m_DBCN#'
	AND Order_ID = '#m_Order_ID#'
	AND Volume = '#m_Volume#'
	AND Variant = #m_Variant#
</cfquery>

<cfquery name="qryPoOrders" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		*
	FROM PO_Orders
	WHERE PO_Prefix = '#m_PO_Prefix#'
	AND PO_Number = '#m_PO_Number#'
	AND DBCN = '#m_DBCN#'
	AND Order_ID = '#m_Order_ID#'
	AND Volume = '#m_Volume#'
	AND Variant = #m_Variant#
</cfquery>

