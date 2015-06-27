<cfquery name="qryList" datasource="#DSN#">
	SELECT
		DBCN
	,	Display_Call_Number
	,	dbo.Get_Call_Number_Sort(COALESCE(F852j, F852h + COALESCE(F852i, ''))) AS Sort_Call_Number
	,	F852b + COALESCE(' ' + F852c, '') AS Location
	FROM
	(	SELECT
			DBCN
		,	dbo.Get_Call_Number(Record_ID) AS Display_Call_Number
		,	(SELECT Subfield FROM Hol_Subfield WHERE Record_ID = T1.Record_ID AND Tag = '852b') AS F852b
		,	(SELECT Subfield FROM Hol_Subfield WHERE Record_ID = T1.Record_ID AND Tag = '852c') AS F852c
		,	(SELECT Subfield FROM Hol_Subfield WHERE Record_ID = T1.Record_ID AND Tag = '852h') AS F852h
		,	(SELECT Subfield FROM Hol_Subfield WHERE Record_ID = T1.Record_ID AND Tag = '852i') AS F852i
		,	(SELECT Subfield FROM Hol_Subfield WHERE Record_ID = T1.Record_ID AND Tag = '852j') AS F852j
		FROM
		(	SELECT
				DBCN
			,	dbo.DBCN_To_Number(DBCN) AS Record_ID
			FROM Call_Numbers
			WHERE Normalized_Call_Number LIKE '#Replace(m_Terms, " ", "", "ALL")#%'
		) T1
	) T2
	ORDER BY Sort_Call_Number, Location
</cfquery>

