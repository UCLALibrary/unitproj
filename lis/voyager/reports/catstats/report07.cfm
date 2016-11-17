<!---
	Get values to use to build dynamic crosstab in main query.
	Many errors in encoding level values: some are upper case, some lower case,
	so force to upper case for grouping and comparison.
--->
<cfquery name="qryelvl" datasource="#DSN#">
	SELECT DISTINCT Upper(enc_lvl) AS enc_lvl
	FROM vger_report.cat_948_base_rpt
	ORDER BY enc_lvl
</cfquery>

<cfquery name="qry948" datasource="#DSN#">
-- New titles by format & enc level
SELECT /*+ ORDERED */
	CASE WHEN r.format IS NULL THEN 'Total' ELSE r.format END AS format
<cfoutput query="qryelvl">
,	Sum(CASE WHEN Upper(r.enc_lvl) = '#enc_lvl#' THEN 1 ELSE 0 END) AS "#enc_lvl#"
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
<cfinclude template="criteria.cfm">
GROUP BY CUBE(r.format)
-- Force 'Total' row to bottom based on column contents
ORDER BY
	CASE WHEN format != 'Total' THEN format ELSE 'zzzzz' END

</cfquery>
