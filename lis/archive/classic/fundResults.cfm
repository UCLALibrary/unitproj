	<table border="0">
		<tr align="left" valign="top">
			<th width="25%">Fund ID</th>
			<th width="25%">Fund Dates</th>
			<th width="50%">Fund Name</th>
		</tr>
	<cfoutput query="qryList">
		<tr align="left" valign="top">
			<td>&nbsp;<a href="showFund.cfm?FID=#Trim(Fund_ID)#&SD=#DateFormat(Start_Date, "yyyy-mm-dd")#&ED=#DateFormat(End_Date, "yyyy-mm-dd")#">#Fund_ID#</a></td>
			<td>&nbsp;#DateFormat(Start_Date, "mm/yy")#-#DateFormat(End_Date, "mm/yy")#</td>
			<td>&nbsp;#Fund_Name#</td>
		</tr>
	</cfoutput>
	</table>
