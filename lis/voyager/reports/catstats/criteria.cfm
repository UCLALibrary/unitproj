<cfoutput>
<cfif m_cataloger neq "">
	AND s948b LIKE '%#m_cataloger#%'
</cfif>
<cfif m_catcenter neq "ALL">
	AND s948a LIKE '#m_catcenter#%'
</cfif>
<cfif m_language neq "">
	AND language = '#m_language#'
</cfif>
<!--- Support fiscal years --->
<cfif Mid(m_month, 7, 1) eq "-">
	AND s948c BETWEEN '#Mid(m_month, 1, 6)#' AND '#Mid(m_month, 8, 6)#'
<cfelseif m_month neq "ALL">
	AND s948c LIKE '#m_month#%'
</cfif>
<cfif m_placecode neq "">
	AND place_code LIKE '#m_placecode#'
</cfif>
<cfif m_948k neq "">
	AND Upper(s948k.subfield) LIKE Upper('%#m_948k#%')
</cfif>
</cfoutput>