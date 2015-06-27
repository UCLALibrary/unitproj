<cfquery name="qryItemDetails" datasource="#DSN#">
	SELECT
		I.Item_ID
	,	I.Circ_Note
	,	I.Reading_Level
	,	I.Loan_ID
	,	I.Status
	,	I.Cost
	,	CASE WHEN I.Creation_Time > 0 THEN DATEADD(s, I.Creation_Time, '1970-01-01') ELSE NULL END AS Creation_Time
	,	CASE
			WHEN I.Loan_Period < 0 THEN ''
			ELSE CAST(I.Loan_Period AS VARCHAR(10))
		END AS Loan_Period
	,	CASE I.Loan_Period_Units
			WHEN 0 THEN ''
			WHEN 1 THEN 'Hours'
			WHEN 2 THEN 'Days'
			WHEN 8 THEN 'Minutes'
			ELSE CAST(I.Loan_Period_Units AS VARCHAR(10))
		END AS Loan_Period_Units
	,	CASE
			WHEN I.Renew_Limit < 0 THEN ''
			ELSE CAST(I.Renew_Limit AS VARCHAR(10))
		END AS Renew_Limit
	,	I.Total_Transactions
	,	CASE WHEN I.Last_Transaction_Time > 0 THEN DATEADD(s, I.Last_Transaction_Time, '1970-01-01') ELSE NULL END AS Last_Transaction_Time
	,	CASE WHEN I.Last_Update_Time > 0 THEN DATEADD(s, I.Last_Update_Time, '1970-01-01') ELSE NULL END AS Last_Update_Time
	,	CASE WHEN I.Temp_Start_Time > 0 THEN DATEADD(s, I.Temp_Start_Time, '1970-01-01') ELSE NULL END AS Temp_Start_Time
	,	CASE WHEN I.Temp_End_Time > 0 THEN DATEADD(s, I.Temp_End_Time, '1970-01-01') ELSE NULL END AS Temp_End_Time
	,	I.Reserve_ID
	,	ICL.Category
	,	IML.Material_Type
	,	(SELECT Location_Code + ' - ' + Location_Name FROM Location_Lookup WHERE Location_ID = I.Previous_Loc) AS Prev_Loc_Code
	,	(SELECT Location_Code + ' - ' + Location_Name FROM Location_Lookup WHERE Location_ID = I.Current_Dest_Loc) AS Next_Loc_Code
	,	(SELECT Location_Code + ' - ' + Location_Name FROM Location_Lookup WHERE Location_ID = I.Owning_Loc) AS Owning_Loc_Code
	,	(SELECT Location_Code + ' - ' + Location_Name FROM Location_Lookup WHERE Location_ID = I.Temp_Loc) AS Temp_Loc_Code
	,	(SELECT Category FROM Item_Cat_Lookup WHERE CAST(Category_ID AS VARCHAR(15)) = I.Temp_Category_ID) AS Temp_Item_Category
	FROM Items I
	LEFT OUTER JOIN Item_Cat_Lookup ICL
		ON I.Category_ID = ICL.Category_ID
	LEFT OUTER JOIN Item_MatType_Lookup IML
		ON I.Material_ID = IML.Material_ID
	WHERE I.Item_ID = #m_ItemID#
</cfquery>

<!---
	,	I.Status_Time
	,	I.Creation_Loc -- this is not useful - only non-zero on invalid items
	,	I.Creation_User
	,	I.Mtd_Transactions
	,	I.Ytd_Transactions
	,	I.Mtd_Carrel_Charges
	,	I.Ytd_Carrel_Charges
	,	I.Total_Carrel_Charges
	,	I.Num_Notices
	,	I.Recall_Time
	,	I.Recall_Sent
	,	I.Last_Notice_Time
	,	I.Last_Inventory_Time
	,	I.Mtd_Inhouse_Use
	,	I.Ytd_Inhouse_Use
	,	I.Total_Inhouse_Use
	,	I.Active_Request_ID
--->