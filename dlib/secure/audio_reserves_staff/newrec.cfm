<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>New Record</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">

<form action="newrec_action.cfm"
      method="post">

<table border="1" cellspacing="0" cellpadding="1"><tr><td>

<table cellspacing="10" width="100%">
<tr><td colspan="2">
<p><input type="submit" value="SAVE"></p>
</td></tr>
<tr><th align="right" width="120">Media Type:</th><td>
<input type="radio" name="video" value="0" checked>AUDIO<br>
<input type="radio" name="video" value="1">VIDEO
</td></tr>
<tr><th width="120" align="right">Composer:</th><td>
<input type="text" name="composer" value="" size="80" maxlength="150">
</td></tr>
<tr><th align="right">Title:</th><td>
<input type="text" name="title" value="" size="80" maxlength="150">
</td></tr>
<tr><th align="right">Performers:</th><td>
<textarea wrap="virtual" 
			name="performers" 
			rows="3" 
			cols="69" 
			class="general"></textarea>
</td></tr>
<tr><th align="right">Note:</td><td>
<input type="text" name="note1" value="" size="80" maxlength="255">
</td></tr>
<tr><th align="right">Note:</td><td>
<input type="text" name="note2" value="" size="80" maxlength="255">
</td></tr>
<tr><th align="right">Label/number:</td><td>
<input type="text" name="label" value="" size="30" maxlength="50">
<!--- </td></tr>
<tr><th align="right">Label number:</td><td> --->
<input type="text" name="labelnumber" value="" size="20" maxlength="50">
</td></tr>
<tr><th align="right">UCLA call no.:</td><td>
<input type="text" name="librarycallnumber" value="" size="20" maxlength="50">
</td></tr>
<tr><th align="right">Filename:</td><td>
<input type="text" name="baseaddress" value="" size="20" maxlength="50">
<!--- </td></tr>
<tr><th align="right"> --->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Metafilename:</strong>&nbsp;&nbsp;<!--- </td><td> --->
<input type="text" name="ramlink" value="" size="20" maxlength="50">
</td></tr>
<tr><th align="right">Status:</th><td>
<input type="radio" name="status" value="1">Music Library recording; retain<br>
<input type="radio" name="status" value="2">Ethnomusicology Archive recording; retain<br>
<input type="radio" name="status" value="3">Other UCLA-owned recording; retain<br>
<input type="radio" name="status" value="4">Instructor supplied; retain<br>
<input type="radio" name="status" value="5">Instructor/other source; delete after <input name="deleteOn" value="" size="8" maxlength="8"><br>
<input type="checkbox" name="liborder">On order for Library or Archive
</td></tr>
<tr><th align="right">Source:</th><td>
<input type="text" name="recsource" value="" size="50" maxlength="50">
</td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th align="right">Class info.:</td><td>
<input type="checkbox" name="incl">
<input type="text" name="classinfo" value="" size="80" maxlength="150">
</td></tr>
<tr><td colspan="2">
<p><input type="submit" value="SAVE"></p>
</td></tr>
</table>
</td></tr>
<tr><td>

<table border="1" cellspacing="0" cellpadding="1" width="100%">
<tr>
	<th>List order</th>
	<th>Volume (v) #</td>
	<th>Disc (d) #</td>
	<th>Side (s) #</td>
	<th>Track #</td>
	<th>Track title</td>
</tr>

<tr>
<input type="hidden" name="itemid" value="">
<td align="center">
<input type="text" name="ordr" value="" size="3" maxlength="3"></td>
<td align="center"><input type="text" name="volume" value="" size="3" maxlength="3"></td>
<td align="center"><input type="text" name="disc" value="" size="3" maxlength="3"></td>
<td align="center"><input type="text" name="side" value="" size="3" maxlength="3"></td>
<td align="center"><input type="text" name="track" value="" size="3" maxlength="50"></td>
<td><input type="text" name="caption" value="" size="60" maxlength="100"></td>
</tr>

</form>

</table>

</td></tr>
</table>

<cfinclude template="foot.cfm">

</body>
</html>
