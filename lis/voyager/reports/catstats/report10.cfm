<cfquery name="qry948" datasource="#DSN#">
-- Maintenance (details)
SELECT /*+ ORDERED */
	s948g.subfield AS Value
,	Count(*) AS Count
FROM vger_report.cat_948_base_rpt r
INNER JOIN vger_report.cat_948_subfield s948g
	ON r.bib_id = s948g.bib_id
	AND r.field_seq = s948g.field_seq
	AND s948g.tag = '948g'
<cfif m_948k neq "">
	<cfinclude template="join_948k.cfm">
</cfif>
WHERE 1 = 1
<cfinclude template="criteria.cfm">
GROUP BY s948g.subfield
ORDER BY Value
</cfquery>
