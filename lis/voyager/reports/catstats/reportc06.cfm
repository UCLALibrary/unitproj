<cfquery name="qry948" datasource="#DSN#">
-- Repeated nonrepeatable subfields: 948 a b c e f g
WITH problems AS (
SELECT
	bib_id
,	field_seq
,	tag
FROM vger_report.cat_948_subfield
WHERE tag IN ('948a', '948b', '948c', '948e', '948f', '948g')
AND deleted = 'N'
GROUP BY bib_id, field_seq, tag
HAVING Count(*) > 1
)
SELECT DISTINCT
	p.bib_id
,	'Repeated subfield: ' || tag AS message
,	vger_subfields.GetFieldFromSubfields(p.bib_id, p.field_seq) AS F948
FROM vger_report.cat_948_base_rpt r
INNER JOIN problems p
	ON r.bib_id = p.bib_id
	AND r.field_seq = p.field_seq
WHERE 1=1
<cfinclude template="criteria.cfm">
ORDER BY p.bib_id
</cfquery>
