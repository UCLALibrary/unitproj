<cfquery name="qry948" datasource="#DSN#">
-- Invalid 948 $d
-- 20090115 akohler: per slayne, added '1+', '2+, '3+', '4+' and variants
SELECT
	s948d.bib_id
,	s948d.subfield AS s948d
,	vger_subfields.GetFieldFromSubfields(s948d.bib_id, s948d.field_seq) AS F948
FROM vger_report.cat_948_base_rpt r
INNER JOIN vger_report.cat_948_subfield s948d
	ON r.bib_id = s948d.bib_id
	AND r.field_seq = s948d.field_seq
	AND s948d.tag = '948d'
WHERE s948d.subfield NOT IN (SELECT subfield FROM vger_report.cat_948_valid_values WHERE tag = '948d')
AND s948d.deleted = 'N'
<cfinclude template="criteria.cfm">
ORDER BY bib_id
</cfquery>
