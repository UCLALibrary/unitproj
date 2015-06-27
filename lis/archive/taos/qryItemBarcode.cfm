<cfquery name="qryList" datasource="#DSN#">
	SELECT
		B.DBCN
	,	BT.Author
	,	BT.Title
	FROM Barcodes B
	INNER JOIN Hol_Record HR
		ON HR.Record_ID = dbo.DBCN_To_Number(B.DBCN)
	INNER JOIN Bib_Text BT
		ON BT.DBCN = dbo.Number_To_DBCN(HR.Link_ID)
	WHERE B.Barcode = '#m_Terms#'
	ORDER BY COALESCE(BT.Author, '') + BT.Title
</cfquery>
