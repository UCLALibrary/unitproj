<cfquery name="qryPatronDetails" datasource="#DSN#">
	SELECT
		dbo.Number_To_DBCN(Record_ID) AS DBCN
	,	Field_Seq
	,	Subfield_Seq
	,	Tag
	,	Subfield
	FROM Pat_Subfield
	WHERE Record_ID = dbo.DBCN_To_Number('#m_DBCN#')
	ORDER BY Subfield_Seq
</cfquery>
