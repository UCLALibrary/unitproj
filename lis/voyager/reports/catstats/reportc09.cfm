<cfquery name="qry948" datasource="#DSN#">
-- Valid 948 $e values
SELECT
	bib_id
,	s948e
,	vger_subfields.GetFieldFromSubfields(bib_id, field_seq) AS F948
FROM vger_report.cat_948_base_rpt
WHERE s948e NOT IN (SELECT subfield FROM vger_report.cat_948_valid_values WHERE tag = '948e')
<cfinclude template="criteria.cfm">
ORDER BY bib_id
</cfquery>
