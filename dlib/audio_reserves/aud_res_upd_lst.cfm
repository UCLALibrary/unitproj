<HTML>
<HEAD>
<TITLE>UCLA Music Library: Digital Audio Reserves</TITLE>
<SCRIPT LANGUAGE="JavaScript">

function spawnwindow(url) {
   var NewWin = window.open(url,"NewWin","toolbar=no,directories=no,menubar=no,status=no,scrollbars=yes,resizable=yes")
}

</SCRIPT>
</HEAD>

<BODY TEXT="000000" bgcolor="ffffff">

<a name="top"></a> 

<cfif url.cid is "all">
	<cfquery name="yearquarter" datasource="#dsn#">
		select * from currentquarter
	</cfquery>
	<cfquery name="instinfo" datasource="#dsn#">
		select * from classes, currentquarter
			where classes.year = currentquarter.year
				and classes.quarter = currentquarter.quarter
	</cfquery>
	<cfquery name="reslist" datasource="#dsn#">
		select composer, works.title, performers, note1, note2, label, labelnumber, librarycallnumber, caption, volume, disc, side, track, baseaddress, link.workid, ramlink, score, scorecaption, imgbaseaddr, startimageID, lowestimageID, highestimageID, EncFormat,itemid from works, link, items, classes, currentquarter
			where works.workid = link.workid
				and works.workid = items.workid
				and classes.classID = link.classID
				and classes.year = currentquarter.year
				and classes.quarter = currentquarter.quarter
			order by works.composer, works.title, items.itemID
	</cfquery>
<cfelse>
	<cfquery name="instinfo" datasource="#dsn#">
		select * 
			from classes 
			where classes.classid = #url.cid#
	</cfquery>
	<cfquery name="reslist" datasource="#dsn#">
		select * from works, link, items
			where works.workid = link.workid
				and works.workid = items.workid
				and link.classid = #url.cid#
			order by works.composer, works.title, items.itemID
	</cfquery>
</cfif>

<cfif instinfo.recordcount is 0>
	<p><font face="Verdana, Arial, Helvetica, sans-serif">List not found. <a href="right.cfm">Return</a> to the previous page and try again.</font></p>
<cfelse>

<cfif url.cid is "all">
	<p><font size="+1" face="Verdana, Arial, Helvetica, sans-serif">ALL AUDIO SELECTIONS</font></p>
	<cfoutput query="yearquarter">
	<p><font face="Verdana, Arial, Helvetica, sans-serif"><b>#quarter# #year#</b></font></p>
	</cfoutput>
<cfelse>
	<cfoutput query="instinfo">
	<p><font face="Verdana, Arial, Helvetica, sans-serif"><b>#instructor#<br>
	  #department# #classnumber#<br>
	  #title#</b><br>
	  <font size="-1">#quarter# #year#</font></font></p>
	</cfoutput>
</cfif>

	<cfinclude template="audio_res_list.cfm">

</cfif>

<hr>

<a name="format"></a>
<p><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Audio format:</b> 
  RealPlayer 7.0 (or later) is required for playback of these files. The <u><b>free</b></u> 
  playback client can be downloaded from <a href="http://www.real.com" style="text-decoration: none" target="_top">www.real.com</a>.</font></p>
<a name="labs"></a>  
<p><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Where to use 
  these files:</b> For the best sound quality these files should be used over 
  the campus network, in multimedia-equipped computer labs. These include the 
  <a href="http://www.clicc.ucla.edu/" style="text-decoration: none" target="_top">College Library CLICC lab</a>, <a href="http://computerlabs.clicc.ucla.edu/Info.asp?LabID=2" style="text-decoration: none" target="_top">Humanities 
  eLabs</a>, and <a href="http://www.clicc.ucla.edu/campuslabs/" style="text-decoration: none" target="_top">other labs</a>. 
  There are also three multimedia/internet computer workstations in the Music 
  Library Media Room.</font></p>
<a name="offcampus"></a>
<p><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Off-campus 
  access: </b>These files may also be accessed over a modem from off campus. The sound quality 
  over a modem is considerably lower than over the campus network.</font></font></p>
<a name="problems"></a>
<p><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Email questions/problems</b> to 
<a href="mailto:sdavison@library.ucla.edu" style="text-decoration: none">sdavison@library.ucla.edu</a></font>
</p>

<hr>
      
</BODY>

</HTML>