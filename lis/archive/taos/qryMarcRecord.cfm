<!--- Coming from results.cfm - copy generic variable to specific --->
<!--- Otherwise, m_DBCN already defined by showMarc.cfm --->
<cfif isdefined("m_Terms") is true>
	<cfset m_DBCN = m_Terms>
</cfif>

<cfset m_Prefix = Left(m_DBCN, 2)>
<cfswitch expression=#m_Prefix#>
	<cfcase value="00,03,06" delimiters=",">
		<cfset m_Type = "Aut_Record">
	</cfcase>
	<cfcase value="01,04,07" delimiters=",">
		<cfset m_Type = "Bib_Record">
	</cfcase>
	<cfcase value="02,05,08" delimiters=",">
		<cfset m_Type = "Hol_Record">
	</cfcase>
	<cfcase value="09">
		<cfset m_Type = "Pat_Record">
	</cfcase>
	<cfdefaultcase>
		<cflocation url="archive.cfm">
	</cfdefaultcase>
</cfswitch>

<cfquery name="qryList" datasource="#DSN#">
	SELECT
		Record
	FROM #m_Type#
	WHERE Record_ID = dbo.DBCN_To_Number('#m_DBCN#')
</cfquery>
