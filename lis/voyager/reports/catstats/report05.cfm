<cfquery name="qry948" datasource="#DSN#">
-- National contributions
SELECT /*+ ORDERED */
	s948h.subfield AS Value
,	Count(*) AS Count
FROM vger_report.cat_948_base_rpt r
INNER JOIN vger_report.cat_948_subfield s948h
	ON r.bib_id = s948h.bib_id
	AND r.field_seq = s948h.field_seq
	AND s948h.tag = '948h'
<cfif m_948k neq "">
	<cfinclude template="join_948k.cfm">
</cfif>
WHERE 1 = 1
<cfinclude template="criteria.cfm">
GROUP BY s948h.subfield
ORDER BY Value
</cfquery>
