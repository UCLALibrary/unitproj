<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Single Record</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<cfquery name="srch1" datasource="#dsn#">
select * from works
where workid=#url.id#
</cfquery>
<cfoutput query="srch1">
<cfset workid=srch1.workid>
<cfset composer=srch1.composer>
<cfset title=srch1.title>
<cfset performers=srch1.performers>
<cfset note1=srch1.note1>
<cfset note2=srch1.note2>
<cfset label=srch1.label>
<cfset labelnumber=srch1.labelnumber>
<cfset librarycallnumber=srch1.librarycallnumber>
<cfset ramlink=srch1.ramlink>
<cfset baseaddress=srch1.baseaddress>
<cfset classinfo=srch1.classinfo>
<cfset status=srch1.status>
<cfset recsource=srch1.recsource>
<cfset deleteOn=srch1.deleteOn>
<cfset liborder=srch1.liborder>
<cfset classinfo=srch1.classinfo>
<cfset incl=srch1.incl>
</cfoutput>

<cfquery name="srch2" datasource="#dsn#">
select * from items
where items.workid=#url.id#
order by ordr,volume,disc,side,track,caption
</cfquery>

<cfset no_items=srch2.recordcount>

<body>

<cfinclude template="head.cfm">

<cfoutput>

<cfif url.ed is "yes">
<form action="singlerec_action.cfm"
      method="post">
<input type="hidden" name="workid" value="#variables.workid#">
</cfif>

<table border="1" cellspacing="0" cellpadding="1"><tr><td>

<table cellspacing="10" width="100%">
<tr><td colspan="3">
<cfif url.ed is "no">
<p><cfif url.ited is "no"><a href="singlerec.cfm?ed=yes&ited=no&id=#variables.workid#" class="go2">EDIT</a><cfif no_items is 0>&nbsp;/&nbsp;<a href="deleterec.cfm?workid=#variables.workid#" class="go2">DELETE</a></cfif><cfelse>&nbsp;</cfif></p>
<cfelse>
<p><input type="submit" value="SAVE"></p>
</cfif>
</td></tr>
<tr><th align="right" width="120">ID:</th><td colspan="2">#workID#</td></tr>
<tr><th align="right" width="120">Composer:</th><td colspan="2">
<cfif url.ed is "no">
#composer#
<cfelse>
<input type="text" name="composer" value="#replace(composer,'"',"&quot;","all")#" size="80" maxlength="150">
</cfif>
</td></tr>
<tr><th align="right">Title:</th><td colspan="2">
<cfif url.ed is "no">
<i>#title#</i>
<cfelse>
<input type="text" name="title" value="#replace(title,'"',"&quot;","all")#" size="80" maxlength="150">
</cfif>
</td></tr>
<tr><th align="right">Performers:</th><td colspan="2">
<cfif url.ed is "no">
#performers#
<cfelse>
<textarea wrap="virtual" 
			name="performers" 
			rows="3" 
			cols="69" 
			class="general">#performers#</textarea>
</cfif>
</td></tr>
<tr><th align="right">Note:</th><td colspan="2">
<cfif url.ed is "no">
#note1#
<cfelse>
<input type="text" name="note1" value="#replace(note1,'"',"&quot;","all")#" size="80" maxlength="255">
</cfif>
</td></tr>
<tr><th align="right">Note:</th><td colspan="2">
<cfif url.ed is "no">
#note2#
<cfelse>
<input type="text" name="note2" value="#replace(note2,'"',"&quot;","all")#" size="80" maxlength="255">
</cfif>
</td></tr>
<tr><th align="right">Label/number:</th><td colspan="2">
<cfif url.ed is "no">
#label#
<cfelse>
<input type="text" name="label" value="#replace(label,'"',"&quot;","all")#" size="30" maxlength="50">
</cfif>
<cfif url.ed is "no">
#labelnumber#
<cfelse>
<input type="text" name="labelnumber" value="#replace(labelnumber,'"',"&quot;","all")#" size="20" maxlength="50">
</cfif>
</td></tr>
<tr><th align="right">UCLA call no.:</th><td>
<cfif url.ed is "no">
	<cfif librarycallnumber is "">
		NONE.</td><td><a href="purchase.cfm?workid=#workid#" class="go2">RUSH PURCHASE REQUEST</a>
	<cfelse>
		#librarycallnumber#</td><td>
	</cfif>
<cfelse>
<input type="text" name="librarycallnumber" value="#librarycallnumber#" size="20" maxlength="50">
</cfif>
</td></tr>
<tr><th align="right">Filename:</th><td colspan="2">
<cfif url.ed is "no">
#baseaddress#
<cfelse>
<input type="text" name="baseaddress" value="#baseaddress#" size="20" maxlength="50">
</cfif></td></tr>
<tr><th align="right">Metafilename:</th><td>
<cfif url.ed is "no">
#ramlink#</td><td><a href="write_smil.cfm?workid=#workid#" class="go2">WRITE SMIL FILES</a>
<cfelse>
<input type="text" name="ramlink" value="#ramlink#" size="20" maxlength="50"></td><td>
</cfif>
</td></tr>
<tr><th align="right">Status:</th><td colspan="2">
<cfif url.ed is "no">
	<cfif status is 1>
	Music Library recording; retain
	<cfelseif status is 2>
	Ethnomusicology Archive recording; retain
	<cfelseif status is 3>
	Other UCLA-owned recording; retain
	<cfelseif status is 4>
	Instructor supplied; retain
	<cfelseif status is 5>
	Instructor/other source; delete after <cfif deleteOn is "">?<cfelse>#deleteOn#</cfif>
	<cfelse>
	Unknown
	</cfif>
	<cfif liborder eq 1>
	/ <font color="red"><strong>On order for Library or Archive</strong></font>
	</cfif>
<cfelse>
	<input type="radio" name="status" value="1" <cfif status is 1>checked</cfif>>Music Library recording; retain<br>
	<input type="radio" name="status" value="2" <cfif status is 2>checked</cfif>>Ethnomusicology Archive recording; retain<br>
	<input type="radio" name="status" value="3" <cfif status is 3>checked</cfif>>Other UCLA-owned recording; retain<br>
	<input type="radio" name="status" value="4" <cfif status is 4>checked</cfif>>Instructor supplied; retain<br>
	<input type="radio" name="status" value="5" <cfif status is 5>checked</cfif>>Instructor/other source; delete after <input name="deleteOn" value="#deleteon#" size="8" maxlength="8"><br>
	<input type="checkbox" name="liborder" <cfif liborder is 1>checked</cfif>>On order for Library or Archive
</cfif>
</tr>
<tr><th align="right">Source:</th><td colspan="2">
<cfif url.ed is "no">
#recsource#
<cfelse>
<input type="text" name="recsource" value="#recsource#" size="50" maxlength="50">
</cfif>
</td></tr>
<tr><td colspan="3"><hr></td></tr>
<tr><th align="right">Class info.:</th><td colspan="2">
<cfif url.ed is "no">
#classinfo# <cfif variables.incl and classinfo neq "">[include]<cfelseif classinfo neq "">[exclude]</cfif>
<cfelse>
<input type="checkbox" name="incl"<cfif variables.incl> checked</cfif>>
<input type="text" name="classinfo" value="#replace(classinfo,'"',"&quot;","all")#" size="80" maxlength="150">
</cfif>
</td></tr>
<tr><td colspan="3">
<cfif url.ed is "no">
<p><cfif url.ited is "no"><a href="singlerec.cfm?ed=yes&ited=no&id=#variables.workid#" class="go2">EDIT</a><cfif no_items is 0>&nbsp;/&nbsp;<a href="deleterec.cfm?workid=#variables.workid#" class="go2">DELETE</a></cfif><cfelse>&nbsp;</cfif></p>
<cfelse>
<p><input type="submit" value="SAVE"></p>
</cfif>
</td></tr>
</table>
</td></tr>
<tr><td>

</cfoutput>

<cfif url.ed is "yes">
</form>
</cfif>

<table border="1" cellspacing="0" cellpadding="1" width="100%">
<tr>
<th>Order</th>
<cfif ited eq "yes">
	<th>Vol.</th>
	<th>Disc</th>
	<th>Side</th>
	<th>Track</th>
<cfelse>
	<th colspan="4">Filename</th>
</cfif>
	<!--- <th>Full path</th> --->
	<th>Par. filename</td>
	<th>Track title</td>
	<th colspan="2">Audio</th>
	<th>&nbsp;</th>
</tr>

<cfoutput><cfif url.ited is "yes">
<form action="singlerecitem_action.cfm" method="post">
<input type="hidden" name="workid" value="#variables.workid#">
</cfif></cfoutput>

<cfoutput query="srch2">
<cfset f=baseaddress>
<cfif srch2.volume neq ""><cfset f=f&"v"&trim(srch2.volume)></cfif>
<cfif srch2.disc neq ""><cfset f=f&"d"&trim(srch2.disc)></cfif>
<cfif srch2.side neq ""><cfset f=f&"s"&trim(srch2.side)></cfif>
<cfset f=f&"-"&trim(srch2.track)>
<tr>
	<cfif ited eq "yes" and srch2.itemid eq url.itemid>
		<input type="hidden" name="itemid" value="#srch2.itemid#">
		<td align="center"><input type="text" name="ordr" value="#srch2.ordr#" size="3" maxlength="3"></td>
		<td align="center"><input type="text" name="volume" value="#srch2.volume#" size="3" maxlength="3"></td>
		<td align="center"><input type="text" name="disc" value="#srch2.disc#" size="3" maxlength="3"></td>
		<td align="center"><input type="text" name="side" value="#srch2.side#" size="3" maxlength="3"></td>
		<td align="center"><input type="text" name="track" value="#srch2.track#" size="3" maxlength="50"></td>
		<!--- <td align="center"><input type="checkbox" name="pf" value="1" <cfif srch2.parfilefullpath is 1>checked</cfif>></td> --->
		<td><input type="text" name="parfile" value="#srch2.parfile#" size="15" maxlength="200"></td>
		<td><input type="text" name="caption" value="#replace(srch2.caption,'"',"&quot;","all")#" size="60" maxlength="100"></td>
		<td align="center"><a href="#srv#/#variables.f#.smil"><img src="sound02.gif" border="0" alt="Play audio"></a></td>
		<td align="center"><input type="checkbox" name="audioOK" value="1" <cfif srch2.audioOK is 1>checked</cfif>></td>
		<td align="center"><input type="submit" value="SAVE"></td>
	<cfelse>
		<td align="center"><cfif srch2.ordr neq "">#srch2.ordr#<cfelse>&nbsp;</cfif></td>
		<cfif ited is "no">
			<td colspan="4">#variables.f#</td>
		<cfelse>
			<td align="center"><cfif srch2.volume neq "">#srch2.volume#<cfelse>&nbsp;</cfif></td>
			<td align="center"><cfif srch2.disc neq "">#srch2.disc#<cfelse>&nbsp;</cfif></td>
			<td align="center"><cfif srch2.side neq "">#srch2.side#<cfelse>&nbsp;</cfif></td>
			<td align="center"><cfif srch2.track neq "">#srch2.track#<cfelse>&nbsp;</cfif></td>
		</cfif>
		<!--- <td align="center"><cfif srch2.parfilefullpath is 1>yes<cfelse>no</cfif></td> --->
		<td><cfif srch2.parfile neq "">#srch2.parfile#<cfelse>&nbsp;</cfif></td>
		<td><cfif srch2.caption neq "">#srch2.caption#<cfelse>&nbsp;</cfif></td>
		<td align="center"><a href="#srv#/#variables.f#.smil"><img src="sound02.gif" border="0" alt="Play audio"></a></td>
		<td align="center"><cfif srch2.audioOK is 1>ok<cfelse>&nbsp;</cfif></td>
		<cfif url.ited eq "yes" or url.ed eq "yes">
			<td>&nbsp;</td>
		<cfelse>
			<td align="center"><a href="singlerec.cfm?ed=no&ited=yes&id=#variables.workid#&itemid=#srch2.itemid#" class="go2">EDIT</a>&nbsp;/&nbsp;<a href="deleteitem.cfm?itemid=#srch2.itemid#&workid=#workid#" class="go2">DELETE</a></td>
		</cfif>
	</cfif>
</tr>
</cfoutput>
<cfif url.ited eq "no" and url.ed eq "no">
<tr><td colspan="9"><a href="newitem.cfm?workid=<cfoutput>#variables.workid#</cfoutput>" class="go2">ADD NEW TRACK</a></td><td>&nbsp;</td></tr>
</cfif>
<cfif url.ited is "yes">
</form>
</cfif>

</table>

</td></tr>
</table>

<cfinclude template="foot.cfm">

</body>
</html>
