<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>List</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<cfset typ=url.typ>
<cfif url.typ eq 1>
	<cfquery name="audioChk" datasource="#dsn#">
	select works.workid,baseAddress,itemid,ordr,volume,disc,side,track,caption,audiook
		from works,items
		where works.workid=items.workid and audioOK=0
		order by baseaddress,works.workid,ordr,itemid
	</cfquery>
<cfelseif url.typ eq 2>
	<cfquery name="audioChk" datasource="#dsn#">
	select works.workid,baseAddress,itemid,ordr,volume,disc,side,track,caption,audiook
		from currentQuarter,classes,link,works,items
		where classes.year=currentQuarter.year
			and classes.quarter=currentQuarter.quarter
			and classes.classid=link.classid
			and link.workid=works.workid 
			and works.workid=items.workid 
			and audioOK=0
		order by baseaddress,works.workid,ordr,itemid
	</cfquery>
<cfelseif url.typ eq 3>
	<cfquery name="audioChk" datasource="#dsn#">
	select works.workid,baseAddress,itemid,ordr,volume,disc,side,track,caption,audiook
		from works,items
		where works.workid=items.workid 
			and (works.status=1 or works.status=2 or works.status=3)
			and audioOK=0
		order by baseaddress,works.workid,ordr,itemid
	</cfquery>
</cfif>

<body>

<cfinclude template="head.cfm">

<h4>Audio tracks: <cfoutput>#audioChk.recordCount#</cfoutput></h4>

<cfset i=url.start>
<cfif i lt 26>
	<cfset startup=1>
<cfelse>
	<cfset startup=url.start-25>
</cfif>
<cfif i gt audioChk.recordCount-26>
	<cfset startdn=url.start>
<cfelse>
	<cfset startdn=url.start+25>
</cfif>

<cfif i lt 6>
	<cfset startup5=1>
<cfelse>
	<cfset startup5=url.start-5>
</cfif>
<cfif i gt audioChk.recordCount-6>
	<cfset startdn5=url.start>
<cfelse>
	<cfset startdn5=url.start+5>
</cfif>

<cfif i lt 101>
	<cfset startup100=1>
<cfelse>
	<cfset startup100=url.start-100>
</cfif>
<cfif i gt audioChk.recordCount-101>
	<cfset startdn100=url.start>
<cfelse>
	<cfset startdn100=url.start+100>
</cfif>
<cfset bot=audioChk.recordCount-24>

<cfoutput><p>
<a href="checkAudio.cfm?ited=no&itemid=0&start=1&typ=#typ#">TOP</a> &mdash; 
<a href="checkAudio.cfm?ited=no&itemid=0&start=#startup100#&typ=#typ#">UP 100</a> &mdash; 
<a href="checkAudio.cfm?ited=no&itemid=0&start=#startup#&typ=#typ#">UP 25</a> &mdash; 
<a href="checkAudio.cfm?ited=no&itemid=0&start=#startup5#&typ=#typ#">UP 5</a> &mdash; 
<a href="checkAudio.cfm?ited=no&itemid=0&start=#startdn5#&typ=#typ#">DOWN 5</a> &mdash;
<a href="checkAudio.cfm?ited=no&itemid=0&start=#startdn#&typ=#typ#">DOWN 25</a> &mdash;
<a href="checkAudio.cfm?ited=no&itemid=0&start=#startdn100#&typ=#typ#">DOWN 100</a> &mdash;
<a href="checkAudio.cfm?ited=no&itemid=0&start=#bot#&typ=#typ#">BOTTOM</a>
</p></cfoutput>

<table border="1" cellspacing="0" cellpadding="1" width="100%">
<tr><th>#</th>
<th>Order</th>
	<th colspan="4">Filename</th>
	<th>Track title</td>
	<th colspan="2">Audio</th>
	<th>&nbsp;</th>
</tr>

<cfoutput><cfif url.ited is "yes">
<form action="admin_singlerecitem_action.cfm" method="post">
</cfif></cfoutput>

<cfoutput query="audioChk" startrow=#url.start# maxrows=25>
<cfset f=baseaddress>
<cfif audioChk.volume neq ""><cfset f=f&"v"&trim(audioChk.volume)></cfif>
<cfif audioChk.disc neq ""><cfset f=f&"d"&trim(audioChk.disc)></cfif>
<cfif audioChk.side neq ""><cfset f=f&"s"&trim(audioChk.side)></cfif>
<cfset f=f&"-"&trim(audioChk.track)>
<tr><td align="center">#i#.</td><cfset i=i+1>
	<td align="center"><cfif audioChk.ordr neq "">#audioChk.ordr#<cfelse>&nbsp;</cfif></td>
	<td colspan="4">#variables.f#</td>
	<td><cfif audioChk.caption neq "">#audioChk.caption#<cfelse>&nbsp;</cfif></td>
	<td align="center"><a href="#srv#/#variables.f#.smil"><img src="sound02.gif" border="0" alt="Play audio"></a></td>
	<cfif ited eq "yes" and audioChk.itemid eq url.itemid>
		<input type="hidden" name="itemid" value="#audioChk.itemid#">
		<input type="hidden" name="start" value="#url.start#">
		<input type="hidden" name="typ" value="#url.typ#">
		<td align="center"><input type="checkbox" name="audioOK" value="1" <cfif audioChk.audioOK is 1>checked</cfif>></td>
		<td align="center"><input type="submit" value="SAVE"></td>
	<cfelse>
		<td align="center"><cfif audioChk.audioOK is 1>ok<cfelse>&nbsp;</cfif></td>
		<cfif url.ited eq "yes">
			<td>&nbsp;</td>
		<cfelse>
			<td align="center"><a href="checkAudio.cfm?ited=yes&itemid=#audioChk.itemid#&start=#url.start#&typ=#typ#" class="go2">EDIT</a></td>
		</cfif>
	</cfif>
</tr>
</cfoutput>
<cfif url.ited is "yes">
</form>
</cfif>

</table>

<cfinclude template="foot.cfm">

</body>
</html>
