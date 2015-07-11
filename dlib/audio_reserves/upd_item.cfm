<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Update Item</title>
</head>

<BODY TEXT="000000" bgcolor="ffffff">

<cfquery name="upditm" datasource="#dsn#">
		 select * from items 
		 	where items.workid=#url.wid#</cfquery>

<cfquery name="updbib" datasource="#dsn#">
		 select * from works 
		 	where works.workid=#url.wid#</cfquery>

<cfform action="upd_item_action.cfm">

<table>
<tr><td></td><td>
<p><font size="-1"><b><u>Record no. <cfoutput>#url.wid#</cfoutput></u><br>
Edit the record and then click "UPDATE" to save the changes.<br>
To leave the record unchanged click the Browser BACK button<br>to return to the list.</b></font></p>

<cfoutput>
<input type="Hidden" name="cid" value="#url.cid#">
<input type="Hidden" name="wid" value="#url.wid#">
</cfoutput>
</td></tr>
<cfoutput query="updbib">
<tr>
	<td align="right"><b><font size="-1">COMPOSER:</font></b></td>
	<td><input type="text" name="cmp" value="#composer#" size="50" maxlength="150"></td>
</tr>
<tr>
	<td align="right"><b><font size="-1">TITLE:</font></b></td>
	<td><input type="text" name="ttl" value="#title#" size="50" maxlength="150"></td>
</tr>
<tr>
	<td align="right"><b><font size="-1">PERFORMERS:</font></b></td>
	<td><input type="text" name="prf" value="#performers#" size="50" maxlength="255"></td>
</tr>
<tr>
	<td align="right"><b><font size="-1">NOTE 1:</font></b></td>
	<td><input type="text" name="nt1" value="#note1#" size="50" maxlength="255"></td>
</tr>
<tr>
	<td align="right"><b><font size="-1">NOTE 2:</font></b></td>
	<td><input type="text" name="nt2" value="#note2#" size="50" maxlength="255"></td>
</tr>
<tr>
	<td align="right"><b><font size="-1">LABEL:</font></b></td>
	<td><input type="text" name="lbl" value="#label#" size="50" maxlength="50"></td>
</tr>
<tr>
	<td align="right"><b><font size="-1">NUMBER:</font></b></td>
	<td><input type="text" name="lbn" value="#labelnumber#" size="50" maxlength="50"></td>
</tr>
<tr>
	<td align="right"><b><font size="-1">CALL NUMBER:</font></b></td>
	<td><input type="text" name="cln" value="#librarycallnumber#" size="50" maxlength="50"></td>
</tr></cfoutput>
<tr><td></td><td><hr></td></tr>
<tr><td valign="top"><input type="submit" value="UPDATE" font="bold"></td><td>
<cfgrid name="itmupdgrid" query="upditm" selectmode="edit" height="300" width="364" bgcolor="white" rowheaderbold="yes">
	<cfgridcolumn name="itemid" display="no">
	<cfgridcolumn name="Caption" header="TRACK TITLE" fontsize="14" headerbold="yes">
</cfgrid>
</td></tr>
</table>

</cfform>

</body>
</html>
