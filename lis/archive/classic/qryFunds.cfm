<cfquery name="qryList" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
SELECT
	Fund_ID
,	Note AS Fund_Name
,	Start_Date
,	End_Date
FROM Funds
<cfif m_Index EQ "FundID">
	WHERE Fund_ID LIKE '#m_Terms#'
</cfif>
<cfif m_Index EQ "FundName">
	WHERE Note LIKE '%#m_Terms#%'
</cfif>
ORDER BY Fund_ID, Start_Date, End_Date
</cfquery>
