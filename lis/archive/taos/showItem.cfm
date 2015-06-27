<cfif isdefined("URL.ID") is false>
	<cflocation url="archive.cfm">
</cfif>

<cfset m_ItemID = URL.ID>

<cfoutput>
<html>
<head>
	<title>Item Record - #m_ItemID#</title>
	<link rel="StyleSheet" href="taos.css" type="text/css" media="screen">
</head>
</cfoutput>

<body>

<cfscript>
function CheckItemStatus (status, value) {
	return (BitAnd(status, value) IS value);
}
</cfscript>

<p><a href="archive.cfm">Return to search screen</a></p>

<cfinclude template="qryItemDetails.cfm">

<table border="1">
<cfoutput query="qryItemDetails">
	<tr>
		<td class="label">Creation Time</td>
		<td class="data">&nbsp;#DateFormat(Creation_Time, "mm/dd/yyyy")#&nbsp;#TimeFormat(Creation_Time, "hh:mm tt")#</td>
		<td class="label">Last Update Time</td>
		<td class="data">&nbsp;#DateFormat(Last_Update_Time, "mm/dd/yyyy")#&nbsp;#TimeFormat(Last_Update_Time, "hh:mm tt")#</td>
	</tr>
	<tr>
		<td class="label">Total Transactions</td>
		<td class="data">&nbsp;#Total_Transactions#</td>
		<td class="label">Last Transaction Time</td>
		<td class="data">&nbsp;#DateFormat(Last_Transaction_Time, "mm/dd/yyyy")#&nbsp;#TimeFormat(Last_Transaction_Time, "hh:mm tt")#</td>
	</tr>
	<tr>
		<td class="label">Item Category</td>
		<td class="data">&nbsp;#Category#</td>
		<td class="label">Temporary Location</td>
		<td class="data">&nbsp;#Temp_Loc_Code#</td>
	</tr>
	<tr>
		<td class="label">Material Type</td>
		<td class="data">&nbsp;#Material_Type#</td>
		<td class="label">Temp Item Category</td>
		<td class="data">&nbsp;#Temp_Item_Category#</td>
	</tr>
	<tr>
		<td class="label">Reading Level</td>
		<td class="data">&nbsp;#Reading_Level#</td> <!--- can be 0 or A, though per policy file only 'A' is valid --->
		<td class="label">Temp Starting Date</td>
		<td class="data">&nbsp;#DateFormat(Temp_Start_Time, "mm/dd/yyyy")#</td>
	</tr>
	<tr>
		<td class="label">Price</td>
		<td class="data">&nbsp;#DollarFormat(Cost)#</td>
		<td class="label">Temp Ending Date</td>
		<td class="data">&nbsp;#DateFormat(Temp_End_Time, "mm/dd/yyyy")#</td>
	</tr>
	<tr>
		<td class="label">Renewal Limit</td>
		<td class="data">&nbsp;#Renew_Limit#</td>
		<td class="label">Active Location</td>
		<td class="data">&nbsp;N/A</td>
	</tr>
	<tr>
		<td class="label">Loan Period</td>
		<td class="data">&nbsp;#Loan_Period#</td>
		<td class="label">Permanent Location</td>
		<td class="data">&nbsp;N/A</td>
	</tr>
	<tr>
		<td class="label">Loan Period Units</td>
		<td class="data">&nbsp;#Loan_Period_Units#</td>
		<td class="label">Previous Location</td>
		<td class="data">&nbsp;#Prev_Loc_Code#</td>
	</tr>
	<tr>
		<td class="label">Circulation Note</td>
		<td class="data">&nbsp;#Circ_Note#</td>
		<td class="label">Next Location</td>
		<td class="data">&nbsp;#Next_Loc_Code#</td>
	</tr>
	<tr>
		<td class="label">Qualifiers 1-16</td>
		<td class="data">&nbsp;N/A</td>
		<td class="label">Owning Location</td>
		<td class="data">&nbsp;#Owning_Loc_Code#</td>
	</tr>
	<tr>
		<td class="label">Damaged</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 1)>X</cfif></td>
		<td class="label">Local Request</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 64)>X</cfif></td>
	</tr>
	<tr>
		<td class="label">Fine Exempt</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 2)>X</cfif></td>
		<td class="label">Request Exempt</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 128)>X</cfif></td>
	</tr>
	<tr>
		<td class="label">Withdrawn</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 32)>X</cfif></td>
		<td class="label">Non Circulating</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 8)>X</cfif></td>
	</tr>
	<tr>
		<td class="label">Missing</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 16)>X</cfif></td>
		<td class="label">On the Fly Conversion</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 4096)>X</cfif></td>
	</tr>
	<tr>
		<td class="label">In Processing</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 4)>X</cfif></td>
		<td class="label">Is Checked Out</td>
		<td class="data">&nbsp;<cfif Loan_ID GT 0>X</cfif></td>
	</tr>
	<tr>
		<td class="label">Available</td>
		<td class="data">&nbsp;N/A</td>
		<td class="label">Claimed Lost</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 512)>X</cfif></td>
	</tr>
	<tr>
		<td class="label">Assumed Lost</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 256)>X</cfif></td>
		<td class="label">Library Loan</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 2048)>X</cfif></td>
	</tr>
	<tr>
		<td class="label">Claimed Returned</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 1024)>X</cfif></td>
		<td class="label">On Hold</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 65536)>X</cfif></td>
	</tr>
	<tr>
		<td class="label">On Order</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 262144)>X</cfif></td>
		<td class="label">Rush Recalled</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 524288)>X</cfif></td>
	</tr>
	<tr>
		<td class="label">Recalled</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 131072)>X</cfif></td>
		<td class="label">En Route</td>
		<td class="data">&nbsp;<cfif CheckItemStatus(Status, 16384)>X</cfif></td>
	</tr>
<!--- Reserve_ID appears to always be 0; I don't know of any other source for this info --->
	<tr>
		<td class="label">Reserve Room</td>
		<td class="data">&nbsp;<cfif Reserve_ID GT 0>X</cfif></td>
		<td class="label">Course Reading</td>
		<td class="data">&nbsp;<cfif Reserve_ID GT 0>X</cfif></td>
	</tr>
<!--- no relevant data in the 16 Qualifier field - maybe don't need to show them at all? --->
<!--- also, data is in SQL Server as BIGINT; CF seems to be truncating data on retrieval --->
</cfoutput>

</table>
</body>
</html>

<!---
INSERT INTO Item_Status_Lookup VALUES (8192, 'Shelving', 'Shelving')
INSERT INTO Item_Status_Lookup VALUES (32768, 'DeferedReq', 'Deferred Request')
--->