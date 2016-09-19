<!--- Set defaults for call numbers so users can leave those boxes empty on search form --->
<!--- Set here so these defaults don't automatically show on search form --->
<cfif m_cn_start eq "">
  <cfset m_cn_start = "A">
</cfif>

<cfif m_cn_end eq "">
  <cfset m_cn_end = "ZZZ9999.9999">
</cfif>

<cfquery name="qryListItems" datasource="#DSN#">
	select *
	from vger_support.powell_zzz_items
	where normalized_call_no >= vger_support.NormalizeCallNumber('#m_cn_start#')
	and normalized_call_no <= vger_support.NormalizeCallNumber('#m_cn_end#')
<cfif m_status neq "ALL">
	and project_status = '#m_status#'
</cfif>
	order by normalized_call_no, item_enum, copy_number
</cfquery>
