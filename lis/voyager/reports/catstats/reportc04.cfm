<cfquery name="qry948" datasource="#DSN#" cachedwithin="#CreateTimespan(0, 1, 0, 0)#">
-- Missing and incorrect subfields
SELECT
	bib_id
,	'Empty subfield: ' || Replace(tag, ' ', '[BLANK]') AS message
,	vger_subfields.GetFieldFromSubfields(bib_id, field_seq) AS F948
FROM vger_report.cat_948_subfield
WHERE subfield IS NULL
AND deleted = 'N'
UNION ALL
SELECT
	bib_id
,	'Invalid subfield code: ' || Replace(tag, ' ', '[BLANK]') AS message
,	vger_subfields.GetFieldFromSubfields(bib_id, field_seq) AS F948
FROM vger_report.cat_948_subfield
WHERE tag NOT BETWEEN '948a' AND '948k'
AND deleted = 'N'
UNION ALL
SELECT DISTINCT
	bib_id
,	'Missing 948 $a' AS message
,	vger_subfields.GetFieldFromSubfields(bib_id, field_seq) AS F948
FROM vger_report.cat_948_subfield s
WHERE tag != '948a'
AND NOT EXISTS (SELECT * FROM vger_report.cat_948_subfield WHERE bib_id = s.bib_id AND field_seq = s.field_seq AND tag = '948a')
AND deleted = 'N'
UNION ALL
SELECT
	bib_id
,	'Missing 948 $b' AS message
,	vger_subfields.GetFieldFromSubfields(bib_id, field_seq) AS F948
FROM vger_report.cat_948_subfield s
WHERE tag = '948a'
AND NOT EXISTS (SELECT * FROM vger_report.cat_948_subfield WHERE bib_id = s.bib_id AND field_seq = s.field_seq AND tag = '948b')
AND deleted = 'N'
UNION ALL
SELECT
	bib_id
,	'Missing 948 $c' AS message
,	vger_subfields.GetFieldFromSubfields(bib_id, field_seq) AS F948
FROM vger_report.cat_948_subfield s
WHERE tag = '948a'
AND NOT EXISTS (SELECT * FROM vger_report.cat_948_subfield WHERE bib_id = s.bib_id AND field_seq = s.field_seq AND tag = '948c')
AND deleted = 'N'
UNION ALL
SELECT
	bib_id
,	'Missing 948 $d' AS message
,	vger_subfields.GetFieldFromSubfields(bib_id, field_seq) AS F948
FROM vger_report.cat_948_subfield s
WHERE tag = '948a'
AND NOT EXISTS (SELECT * FROM vger_report.cat_948_subfield WHERE bib_id = s.bib_id AND field_seq = s.field_seq AND tag = '948d')
AND deleted = 'N'
ORDER BY bib_id, message
</cfquery>
