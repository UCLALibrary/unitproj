<cfquery name="qry948" datasource="#DSN#">
-- Authority contributions
SELECT /*+ ORDERED */
	s948ij.subfield AS Value
,	Count(*) AS Count
FROM vger_report.cat_948_base_rpt r
INNER JOIN vger_report.cat_948_subfield s948ij
	ON r.bib_id = s948ij.bib_id
	AND r.field_seq = s948ij.field_seq
	AND s948ij.tag IN ('948i', '948j')
<cfif m_948k neq "">
	<cfinclude template="join_948k.cfm">
</cfif>
WHERE 1 = 1
<cfinclude template="criteria.cfm">
GROUP BY s948ij.subfield
ORDER BY Value
</cfquery>
