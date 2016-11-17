<cfquery name="qry948" datasource="#DSN#">
-- Valid 948 $g values
-- 20080810 akohler: Documentation lists the values by format, but Sara Layne doesn't care about that level of validation; just check the 948 $g values
SELECT
	s948g.bib_id
,	s948g.subfield AS s948g
,	vger_subfields.GetFieldFromSubfields(s948g.bib_id, s948g.field_seq) AS F948
FROM vger_report.cat_948_base_rpt r
INNER JOIN vger_report.cat_948_subfield s948g
	ON r.bib_id = s948g.bib_id
	AND r.field_seq = s948g.field_seq
	AND s948g.tag = '948g'
WHERE s948g.subfield NOT IN (SELECT subfield FROM vger_report.cat_948_valid_values WHERE tag = '948g')
AND s948g.deleted = 'N'
<cfinclude template="criteria.cfm">
ORDER BY bib_id
</cfquery>
