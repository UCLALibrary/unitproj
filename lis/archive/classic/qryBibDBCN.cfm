<!--- If user didn't enter a dash between letters & numbers, put one in --->
<cfif REFindNoCase("[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9]", m_Terms, 1) EQ 1>
	<cfset m_Terms = Mid(m_Terms, 1, 3) & "-" & Mid(m_Terms, 4, 4)>
</cfif>

<cfquery name="qryList" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		DBCN
	,	Author
	,	Title
	,	(SELECT COUNT(*) FROM PO_Lines WHERE DBCN = BT.DBCN) AS PO_Lines
	,	(SELECT COUNT(*) FROM Inv_Lines WHERE DBCN = BT.DBCN) AS Inv_Lines
	FROM Bib_Text BT
	WHERE DBCN = '#m_Terms#'
	ORDER BY Author, Title
</cfquery>
