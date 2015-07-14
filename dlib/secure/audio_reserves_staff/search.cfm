<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Search digital audio</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<body bgcolor="ffffff">

<cfinclude template="head.cfm">

<form action="result.cfm" method="post">

<!--- <table border="2" cellpadding="15" bgcolor="#C0C0C0" width="100%"> --->
<table border="1" cellspacing="0" cellpadding="15" width="100%">

<tr><td>

<h2>Search</h2>

<p>Enter search strings in either or both boxes to search by author and/or title;<br>
or, customize your search as follows:
</p>

<ul>
<li>Choose fields to search from the drop down boxes</li>
<li>Define the search types by choosing between "contains" or "begins with"</li>
<li>Choose boolean "and" or "or" connector</li>
<li>Enter search strings in either or both boxes</li>
<li>Choose sorting or limit options</li>
<li>"Start search"</li>
</ul>

<table border="0" cellspacing="5" cellpadding="5">
<!--- <table border="0" cellspacing="5" cellpadding="5" bgcolor="#C0C0C0"> --->
<tr>
<td>
<select name="indexname1">
	<option value="composer">Composer's name</option>
	<option value="title">Title</option>
	<option value="performers">Performers</option>
	<option value="caption">Track Title</option>
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
<td><input type="text" name="searchterm1" size="50" maxlength="50"></td>
</tr>
<tr><td><select name="connector">
	<option value="and">and
	<option value="or">or
</select></td><td></td><TD></TD></tr>
<tr><td><select name="indexname2">
	<option value="title">Title</option>
	<option value="composer">Composer's name</option>
	<option value="performers">Performers</option>
	<option value="caption">Track Title</option>
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
<td><input type="text" name="searchterm2" size="50" maxlength="50"></td></tr>
<tr><td colspan="2"><font size="-1"><b>SORTING OPTIONS:</b></font><br>
	<select name="listorder">
	<option value="comp">Sort by composer, title</option>
	<option value="title">Sort by title, composer</option>
	<option value="lcn">Sort by Library call number</option>
	<option value="none">Not sorted</option>
	</select></td>
<td valign="bottom"><input type="submit" name="submitform" value="Start Search"></td>
</tr>
<tr><td colspan="3"><input type="checkbox" name="libr" value="yes"><font size="-2">Limit search to UCLA-owned materials</font></td></tr>
</table>

<p>NOTES:</p>

<ul>
<li>Wildcard character is %, and can be used at the beginning, in the middle, or at the end of a search string</li>
<li>Search strings are literal, and include spaces</li>
</ul>

</td></tr></table>

</form>

<cfinclude template="foot.cfm">

</body>
</html>
