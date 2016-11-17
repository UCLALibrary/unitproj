<cfquery name="qry948" datasource="#DSN#">
-- Invalid 948 $c values; valid ones are YYYYMMDD, starting 20070701
SELECT
	bib_id
,	s948c
,	vger_subfields.GetFieldFromSubfields(bib_id, field_seq) AS F948
FROM vger_report.cat_948_base_rpt
-- Started 20070701, no dates should be less than that or greater than today
WHERE (	s948c NOT BETWEEN '20070701' AND To_Char(SYSDATE, 'YYYYMMDD')
	-- Should also be 8 digits, starting with '20'
	OR	not regexp_like(s948c, '^20[0-9]{6}$')
)
<cfinclude template="criteria.cfm">
ORDER BY bib_id
</cfquery>
