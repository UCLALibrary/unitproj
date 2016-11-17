<cfquery name="qry948" datasource="#DSN#">
-- Valid 948 $h values
SELECT
	s948h.bib_id
,	s948h.subfield AS s948h
,	vger_subfields.GetFieldFromSubfields(s948h.bib_id, s948h.field_seq) AS F948
FROM vger_report.cat_948_base_rpt r
INNER JOIN vger_report.cat_948_subfield s948h
	ON r.bib_id = s948h.bib_id
	AND r.field_seq = s948h.field_seq
	AND s948h.tag = '948h'
WHERE s948h.subfield NOT IN (SELECT subfield FROM vger_report.cat_948_valid_values WHERE tag = '948h')
AND s948h.deleted = 'N'
<cfinclude template="criteria.cfm">
ORDER BY bib_id
</cfquery>
