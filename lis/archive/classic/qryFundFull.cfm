<cfquery name="qryFunds" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		*
	FROM Funds
	WHERE Fund_ID = '#m_Fund_ID#'
	AND Start_Date = '#m_Start_Date#'
	AND End_Date = '#m_End_Date#'
</cfquery>
