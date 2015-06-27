<cfquery name="qryBibRecord" datasource="#DSN#">
	SELECT
		Record
	FROM Bib_Records
	WHERE DBCN = '#m_DBCN#'
</cfquery>
