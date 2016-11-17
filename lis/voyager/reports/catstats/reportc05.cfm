<cfquery name="qry948" datasource="#DSN#" cachedwithin="#CreateTimespan(0, 1, 0, 0)#">
-- No 948 field, for records created after 948 usage began
with bibs as (
  select bib_id
  from ucladb.bib_history
  where operator_id = 'uclaloader'
  and action_type_id = 1 --create
  and action_date >= to_date('20070702', 'YYYYMMDD') -- records created 7/1/2007 or later; load happens the following day
  minus
  select distinct record_id
  from vger_subfields.ucladb_bib_subfield
  where tag like '948%'
)
select
  bib_id
, 'No 948 field' as message
, (select subfield from vger_subfields.ucladb_bib_subfield where record_id = b.bib_id and tag = '910a' and rownum < 2) as f910a
from bibs b
order by bib_id
</cfquery>
