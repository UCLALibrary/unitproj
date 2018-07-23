<cfquery name="qryInsertLCAS" datasource="LCAS">
	<!--- List of values to insert.  First ones are static, the ones starting with Q are from the submitted form --->
	insert into lcas_responses_2018 (session_id
	<cfloop index="m_fieldname" list="#Form.fieldnames#">
		<cfif Left(m_fieldname, 1) EQ "Q" AND Len(Form[m_fieldname])>
			, #m_fieldname#
		</cfif>
	</cfloop>
	<!--- Closing parens from the column list --->
	)
	<!--- Now the value list, matching the above.  Must loop again --->
	values (
		  <cfqueryparam value="#m_survsession_id#" cfsqltype="cf_sql_varchar">
	<cfloop index="m_fieldname" list="#Form.fieldnames#">
		<cfif Left(m_fieldname, 1) EQ "Q" AND Len(Form[m_fieldname])>
			, <cfqueryparam value="#Form[m_fieldname]#" cfsqltype="cf_sql_varchar">
		</cfif>
	</cfloop>
	<!--- Closing parens from the value list --->
	)
</cfquery>
