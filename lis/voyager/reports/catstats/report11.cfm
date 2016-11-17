<!--- Get values to use to build dynamic crosstab in main query --->
<cfquery name="qry948h" datasource="#DSN#">
	SELECT DISTINCT subfield AS s948h
	FROM vger_report.cat_948_subfield
	WHERE tag = '948h'
	AND subfield IN (SELECT subfield FROM vger_report.cat_948_valid_values WHERE tag = '948h')
	ORDER BY s948h
</cfquery>

<cfquery name="qry948" datasource="#DSN#">
-- National contributions by format
SELECT /*+ ORDERED */
	CASE WHEN r.format IS NULL THEN 'Total' ELSE r.format END AS format
<cfoutput query="qry948h">
,	Sum(CASE WHEN s948h.subfield = '#s948h#' THEN 1 ELSE 0 END) AS "#s948h#"
</cfoutput>
,	Count(*) AS Total
FROM vger_report.cat_948_base_rpt r
INNER JOIN vger_report.cat_948_subfield s948h
	ON r.bib_id = s948h.bib_id
	AND r.field_seq = s948h.field_seq
	AND s948h.tag = '948h'
<cfif m_948k neq "">
	<cfinclude template="join_948k.cfm">
</cfif>
WHERE s948h.subfield IN (SELECT subfield FROM vger_report.cat_948_valid_values WHERE tag = '948h')
<cfinclude template="criteria.cfm">
GROUP BY CUBE(r.format)
-- Force 'Total' row to bottom based on column contents
ORDER BY
	CASE WHEN format != 'Total' THEN format ELSE 'zzzzz' END
</cfquery>
