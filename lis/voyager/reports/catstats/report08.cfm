<cfquery name="qry948" datasource="#DSN#">
-- New titles by format & record source
SELECT /*+ ORDERED */
	CASE WHEN r.format IS NULL THEN 'Total' ELSE r.format END AS format
,	Sum(CASE WHEN r.f040a = 'CLU' THEN 1 ELSE 0 END) AS CLU
,	Sum(CASE WHEN r.f040a IN ('DLC', 'DLC-R', 'DNLM/DLC') THEN 1 ELSE 0 END) AS DLC
,	Sum(CASE WHEN r.f040a IN ('DNLM', 'NLM') THEN 1 ELSE 0 END) AS NLM
,	Sum(CASE WHEN r.f040a = 'UKM' THEN 1 ELSE 0 END) AS UKM
,	Sum(CASE WHEN r.f040a IS NULL THEN 1 ELSE 0 END) AS NONE
,	Sum(CASE WHEN r.f040a NOT IN ('CLU', 'DLC', 'DLC-R', 'DNLM/DLC', 'DNLM', 'NLM', 'UKM') AND r.f040a IS NOT NULL THEN 1 ELSE 0 END) AS OTHER
,	Count(*) AS Total
FROM vger_report.cat_948_base_rpt r
INNER JOIN vger_report.cat_948_subfield s
	ON r.bib_id = s.bib_id
	AND r.field_seq = s.field_seq
	AND s.tag = '948d'
<cfif m_948k neq "">
	<cfinclude template="join_948k.cfm">
</cfif>
WHERE s.subfield IN (SELECT subfield FROM vger_report.cat_948_valid_values WHERE tag = '948d' AND note = 'new')
<cfinclude template="criteria.cfm">
GROUP BY CUBE(r.format)
-- Force 'Total' row to bottom based on column contents
ORDER BY
	CASE WHEN format != 'Total' THEN format ELSE 'zzzzz' END
</cfquery>
