<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Single Record</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<cfquery name="srch" datasource="#dsn#">
select * from works
where workid=#url.workid#
</cfquery>

<body>

<cfinclude template="head.cfm">

<form action="purchase_action.cfm"
      method="post">
<input type="hidden" name="workid" value="<cfoutput>#url.workid#</cfoutput>">
<table border="1" cellspacing="0" cellpadding="15"><tr><td>
<h3>RUSH PURCHASE REQUEST</h3>
<p>Library policy dictates that recordings used for digital audio reserves should be owned by the University whenever possible. Use this form to submit RUSH purchase requests to Music Library Technical Services for items not in Library or Ethnomusicology Archive collections.</p>
<p>Enter as much information about the recording as possible. Include Label and Label Number if known. The title should reflect the name of the album rather than individual tracks.</p>
<table cellspacing="10" width="100%">
<tr><th align="right" width="120">Collection:</th>
<td><select name="collection">
<option value="Music Library">Music Library</option>
<option value="Ethnomusicology Archive">Ethnomusicology Archive</option>
</select></td></tr>
<cfoutput query="srch">
<tr><th align="right" width="120">Label &amp; Number:</th>
<td><input type="text" name="label" value="#replace(label,'"',"&quot;","all")#" size="30" maxlength="50">
<input type="text" name="labelnumber" value="#replace(labelnumber,'"',"&quot;","all")#" size="20" maxlength="50"></td></tr>
<tr><th align="right" width="120">Composer:</th>
<td><input type="text" name="composer" value="#replace(composer,'"',"&quot;","all")#" size="80" maxlength="150"></td></tr>
<tr><th align="right" width="120">Title:</th>
<td><input type="text" name="title" value="#replace(title,'"',"&quot;","all")#" size="80" maxlength="150"></td></tr>
<tr><th align="right" width="120">Performers:</th>
<td><textarea wrap="virtual" 
			name="performers" 
			rows="3" 
			cols="69" 
			class="general">#performers#</textarea></td></tr>
<tr><th align="right" width="120">Note:</th>
<td><input type="text" name="note1" value="#replace(note1,'"',"&quot;","all")#" size="80" maxlength="255"></td></tr>
<tr><th align="right" width="120">Note:</th>
<td><input type="text" name="note2" value="#replace(note2,'"',"&quot;","all")#" size="80" maxlength="255"></td></tr>
<tr><td>&nbsp;</td><td></td></tr>
<tr><td></td><td><input type="submit" value="SEND REQUEST"></td></tr>
</cfoutput>
</table>
</table>
</form>

<cfinclude template="foot.cfm">

</body>
</html>
