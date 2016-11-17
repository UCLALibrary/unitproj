<cfquery name="qry948" datasource="#DSN#">
-- Maintenance (broad)
SELECT /*+ ORDERED */
	s948d.subfield AS Value
,	Count(*) AS Count
FROM vger_report.cat_948_base_rpt r
INNER JOIN vger_report.cat_948_subfield s948d
	ON r.bib_id = s948d.bib_id
	AND r.field_seq = s948d.field_seq
	AND s948d.tag = '948d'
<cfif m_948k neq "">
	<cfinclude template="join_948k.cfm">
</cfif>
WHERE s948d.subfield IN (SELECT subfield FROM vger_report.cat_948_valid_values WHERE tag = '948d' AND note = 'maintenance')
<cfinclude template="criteria.cfm">
GROUP BY s948d.subfield
ORDER BY Value
</cfquery>
