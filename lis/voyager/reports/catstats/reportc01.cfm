<cfquery name="qry948" datasource="#DSN#">
-- Invalid 948 $a
SELECT
	bib_id
,	s948a
,	vger_subfields.GetFieldFromSubfields(bib_id, field_seq) AS F948
FROM vger_report.cat_948_base_rpt
WHERE s948a NOT IN (SELECT subfield FROM vger_report.cat_948_valid_values WHERE tag = '948a')
<cfinclude template="criteria.cfm">
ORDER BY bib_id
</cfquery>
