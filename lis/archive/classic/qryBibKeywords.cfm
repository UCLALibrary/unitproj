<cfset m_Words = ListToArray(m_Terms, " ")>
<cfset m_Words_Count = ArrayLen(m_Words)>

<cfquery name="qryList" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		DBCN
	,	Author
	,	Title
	,	(SELECT COUNT(*) FROM PO_Lines WHERE DBCN = BT.DBCN) AS PO_Lines
	,	(SELECT COUNT(*) FROM Inv_Lines WHERE DBCN = BT.DBCN) AS Inv_Lines
	FROM Bib_Text BT
	WHERE EXISTS
	(	SELECT *
		FROM Keywords K1
<cfloop index="counter" from="2" to="#m_Words_Count#">
	<cfset prevcounter = counter - 1>

	<cfoutput>
		INNER JOIN Keywords K#counter# ON K#prevcounter#.DBCN = K#counter#.DBCN
	</cfoutput>
</cfloop>
		WHERE K1.DBCN = BT.DBCN
<cfloop index="counter" from="1" to="#m_Words_Count#">
	<cfoutput>
		AND (K#counter#.Keyword LIKE '#m_Words[counter]#' <cfif m_Index_Code NEQ "">AND K#counter#.Index_Code = '#m_Index_Code#'</cfif>)
	</cfoutput>
</cfloop>
	)
	ORDER BY COALESCE(Author, '') + Title
</cfquery>
