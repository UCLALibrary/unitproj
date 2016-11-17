<cfoutput>
-- Include 948 $k only if user wants to filter on it
left outer join vger_report.cat_948_subfield s948k
	on r.bib_id = s948k.bib_id
	and r.field_seq = s948k.field_seq
	and s948k.tag = '948k'
</cfoutput>