IF OBJECT_ID('usp_Get_Summary_Holdings') IS NOT NULL DROP PROCEDURE usp_Get_Summary_Holdings
GO

CREATE PROCEDURE usp_Get_Summary_Holdings
(	@DBCN CHAR(11) )
AS
	DECLARE @Bib_ID INT
	SET @Bib_ID = dbo.DBCN_To_Number(@DBCN)
	
	SELECT
		dbo.Number_To_DBCN(Record_ID) AS Hol_DBCN,
		Location,
		Call_Number,
		Copy_Number,
		Summary
	FROM
	(	SELECT
			T852.Record_ID,
			COALESCE(T852.F852b, '') + COALESCE(' ' + T852.F852c, '') AS Location,
			COALESCE(T852.F852k, '') + COALESCE(' ' + T852.F852h, '') + COALESCE(' ' + T852.F852i, '') 
			+ COALESCE(' ' + T852.F852j, '') + COALESCE(' ' + T852.F852m, '') AS Call_Number,
			T852.F852t AS Copy_Number,
			T866a.Subfield AS Summary
		FROM
		(	SELECT
				HS.Record_ID,
				LEFT(HS.Subfield, 10) AS F852b,
				(SELECT TOP 1 Subfield FROM Hol_Subfield WHERE Tag = '852c' AND Record_ID = HS.Record_ID AND Field_Seq = HS.Field_Seq) AS F852c,
				(SELECT TOP 1 Subfield FROM Hol_Subfield WHERE Tag = '852h' AND Record_ID = HS.Record_ID AND Field_Seq = HS.Field_Seq) AS F852h,
				(SELECT TOP 1 Subfield FROM Hol_Subfield WHERE Tag = '852i' AND Record_ID = HS.Record_ID AND Field_Seq = HS.Field_Seq) AS F852i,
				(SELECT TOP 1 Subfield FROM Hol_Subfield WHERE Tag = '852j' AND Record_ID = HS.Record_ID AND Field_Seq = HS.Field_Seq) AS F852j,
				(SELECT TOP 1 Subfield FROM Hol_Subfield WHERE Tag = '852k' AND Record_ID = HS.Record_ID AND Field_Seq = HS.Field_Seq) AS F852k,
				(SELECT TOP 1 Subfield FROM Hol_Subfield WHERE Tag = '852m' AND Record_ID = HS.Record_ID AND Field_Seq = HS.Field_Seq) AS F852m,
				(SELECT TOP 1 Subfield FROM Hol_Subfield WHERE Tag = '852t' AND Record_ID = HS.Record_ID AND Field_Seq = HS.Field_Seq) AS F852t
			FROM Hol_Subfield HS
			WHERE Tag = '852b'
			AND Record_ID IN (SELECT Record_ID FROM Hol_Record WHERE Link_ID = @Bib_ID)
		) T852
		LEFT OUTER JOIN Hol_Subfield T866a ON T852.Record_ID = T866a.Record_ID AND T866a.Tag = '866a'
	) T
	ORDER BY LEFT(Location, 3), Copy_Number, Call_Number
RETURN
GO

GRANT EXECUTE ON usp_Get_Summary_Holdings TO CF_Archive
GO
