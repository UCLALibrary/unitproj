<!--- Get values to use to build dynamic crosstab in main query --->
<cfquery name="qry948d" datasource="#DSN#">
	SELECT DISTINCT subfield AS s948d
	FROM vger_report.cat_948_subfield
	WHERE tag = '948d'
	AND subfield IN (SELECT subfield FROM vger_report.cat_948_valid_values WHERE tag = '948d' AND note = 'new')
	ORDER BY s948d
</cfquery>

<cfquery name="qry948" datasource="#DSN#">
-- New titles by 948 $e & difficulty
SELECT /*+ ORDERED */
	CASE WHEN r.s948e IS NULL THEN 'Total' ELSE r.s948e END AS format
<cfoutput query="qry948d">
,	Sum(CASE WHEN s948d.subfield = '#s948d#' THEN 1 ELSE 0 END) AS "#s948d#"
</cfoutput>
,	Count(*) AS Total
FROM vger_report.cat_948_base_rpt r
INNER JOIN vger_report.cat_948_subfield s948d
	ON r.bib_id = s948d.bib_id
	AND r.field_seq = s948d.field_seq
	AND s948d.tag = '948d'
<cfif m_948k neq "">
	<cfinclude template="join_948k.cfm">
</cfif>
WHERE s948d.subfield IN (SELECT subfield FROM vger_report.cat_948_valid_values WHERE tag = '948d' AND note = 'new')
AND r.s948e IS NOT NULL
<cfinclude template="criteria.cfm">
GROUP BY CUBE(r.s948e)
-- Force 'Total' row to bottom based on column contents
ORDER BY
	CASE WHEN format != 'Total' THEN format ELSE 'zzzzz' END
</cfquery>
