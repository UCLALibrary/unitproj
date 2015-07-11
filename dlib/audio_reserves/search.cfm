<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Audio, Search</title>
</head>

<cfset session.classid="none">
<cfset session.usern="none">
<cfset session.reservelist="no">

<body bgcolor="ffffff">

<cfinclude template="staffuseonly.cfm">

<form action="result.cfm" method="post">

<table border="2" cellpadding="15" bgcolor="#C0C0C0" width="100%"><tr><td>

<table border="0" cellspacing="5" cellpadding="5" bgcolor="#C0C0C0">
<tr>
<td>
<select name="indexname1">
	<option value="composer">Composer's name</option>
	<option value="title">Title</option>
	<option value="performers">Performers</option>
	<option value="label">Recording Label</option>
	<option value="labelnumber">Label Number</option>
	<option value="librarycallnumber">Library Call Number</option>
	<option value="classinfo">Class-specific info.</option>
</select>
</td>
<TD>
<select name="evaltype1">
	<option value="contains">contains</option>
	<option value="begins">begins</option>
</SELECT>
</TD>
<td><input type="text" name="searchterm1" size="25" maxlength="45"></td>
</tr>
<tr><td><select name="connector">
	<option value="and">and
	<option value="or">or
</select></td><td></td><TD></TD></tr>
<tr><td><select name="indexname2">
	<option value="title">Title</option>
	<option value="composer">Composer's name</option>
	<option value="performers">Performers</option>
	<option value="label">Recording Label</option>
	<option value="labelnumber">Label Number</option>
	<option value="librarycallnumber">Library Call Number</option>
	<option value="classinfo">Class-specific info.</option>
</select></td>
<TD>
<select name="evaltype2">
	<option value="contains">contains</option>
	<option value="begins">begins</option>
</SELECT>
</TD>
<td><input type="text" name="searchterm2" size="25" maxlength="45"></td></tr>
<tr><td colspan="2"><font size="-1"><b>SORTING OPTIONS:</b></font><br>
	<select name="listorder">
	<option value="none">Not sorted</option>
	<option value="title">Sort by title</option>
	<option value="comp">Sort by composer</option>
	<option value="lcn">Sort by Library call number</option>
	</select></td>
<td valign="bottom"><input type="submit" name="submitform" value="Start Search"></td>
</tr>
<tr><td colspan="3"><input type="checkbox" name="libr" value="yes" checked><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">Limit search to Library-owned materials</font></td></tr>
</table>

</td></tr></table>

</form>

</body>
</html>
