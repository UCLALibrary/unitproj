<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Single Record</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">
<style type="text/css">
a.select{
width:100%;
text-decoration:none;
font-style:normal;

}
}
</style>
<cfquery name="srch1" datasource="#dsn#">
select * from works
where works.workid=#url.id#
</cfquery>

<cfquery name="workannot" datasource="#dsn#">
select link.annotation from works,link
where works.workid=#url.id#
and link.workid=works.workid
</cfquery>

<cfquery name="annots" datasource="#dsn#">
select itemannot.*, classes.title, classes.classid, classes.TAs, classes.quarter, classes.year, instructors.UCLA_ID from itemannot, classes, link, instructors
where itemannot.id=link.id
and link.workid=#url.id#
and link.classid=classes.classid
and classes.instructorID=instructors.instructorID
</cfquery>

<cfquery name="classes" datasource="#dsn#">
select * from classes, link, instructors
where link.workid=#url.id#
and link.classid=classes.classid
and classes.instructorID=instructors.instructorID
</cfquery>

<cfset isInstructor = false>
<cfloop query="classes">
<cfif UCLA_ID eq session.user or ListContainsNoCase(TAs,session.user)><cfset isInstructor = true></cfif>
</cfloop>

<cfoutput query="srch1">
<cfset workid=srch1.workid>
<cfif srch1.video is 0 or srch1.video is ""><cfset video=0><cfelse><cfset video=1></cfif>
<cfset composer=srch1.composer>
<cfset title=srch1.title>
<cfset performers=srch1.performers>
<cfset note1=srch1.note1>
<cfset note2=srch1.note2>
<cfset embedURL=srch1.embedURL>
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
<cfset exlink=srch1.exlink>
<cfset annotation="">
<cfif workannot.recordcount gt 0><cfset annotation=workannot.annotation></cfif>
</cfoutput>

<cfquery name="srch2" datasource="#dsn#">
select * from items
where items.workid=#url.id#
order by ordr,volume,disc,side,track,caption
</cfquery>

<cfset no_items=srch2.recordcount>

<cfset no_items=0> <!--- Delete records even with items --->

<body>
<cfinclude template="head.cfm">
<cfoutput>

<cfif url.ed is "yes" or structKeyExists(url,"edannot") or structKeyExists(url,"editems")>
<form action="singlerec_action.cfm"
      method="post">
<input type="hidden" name="workid" value="#variables.workid#">
</cfif>

<table border="1" cellspacing="0" cellpadding="1"><tr><td>

<table cellspacing="10" width="100%">
<tr><td colspan="3">
<cfif url.ed is "no">
<p><cfif url.ited is "no" and trim(session.acctype) neq "readonly"><a href="singlerec.cfm?ed=yes&ited=no&id=#variables.workid#" class="go2">EDIT</a><cfif no_items is 0>&nbsp;/&nbsp;<a href="deleterec.cfm?workid=#variables.workid#" class="go2" onClick="return confirm('Delete this item and all its tracks?')">DELETE</a></cfif>&nbsp;/&nbsp;<a href="duprec.cfm?id=#variables.workid#" class="go2">DUPLICATE</a></cfif></p>
<cfelse>
<p><input type="submit" value="SAVE"></p>
</cfif>
</td></tr>
<tr><th align="right" width="120">ID:</th><td colspan="2">#workID#</td></tr>
<tr><th align="right" width="120">Media Type:</th><td colspan="2">
<cfif url.ed is "no"><font color="##660000"><b><u><cfif video is 1>VIDEO<cfelse>AUDIO</cfif></u></b></font>
<cfelse>
<input type="radio" name="video" value="0"<cfif variables.video is 0> checked</cfif>>AUDIO<br>
<input type="radio" name="video" value="1"<cfif variables.video> checked</cfif>>VIDEO
</cfif>
</td></tr>
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
<tr><th align="right" valign="top">Performers:</th><td colspan="2">
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
<tr><th align="right">Embedded URL:</td><td>
<cfif url.ed is "no">
#embedURL#
<cfelse>
<input type="text" name="embedURL" value="#embedURL#" size="80" maxlength="255">
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
		NONE.</td><td><cfif trim(session.acctype) neq "readonly"><a href="purchase.cfm?workid=#workid#" class="go2">RUSH PURCHASE REQUEST</a></cfif>
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
#ramlink#</td><td><cfif trim(session.acctype) neq "readonly"><a href="write_smil.cfm?workid=#workid#" class="go2">WRITE SMIL FILES</a></cfif>
<cfelse>
<input type="text" name="ramlink" value="#ramlink#" size="20" maxlength="50"></td><td>
</td></cfif>
</tr>
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
	/ <span style="color:##FF0000"><strong>On order for Library or Archive</strong></span>
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
<tr><th align="right">Link:</th><td colspan="2">
<cfif url.ed is "no">
#exlink#
<cfelse>
<input type="text" name="exlink" value="#trim(exlink)#" size="80" maxlength="100">
</cfif>
</td></tr>
<cfset listSelected="##CCCCCC">
<cfset listUnselected="##FFFFFF">
<script type="text/javascript">
function setMouseUp(){
	mouseDown=false;
}
document.onmouseup=setMouseUp;
function listMouseDown(formNum, track){
  mouseDown=true;
  document.getElementsByName('items'+formNum+'-'+track)[0].checked=!document.getElementsByName('items'+formNum+'-'+track)[0].checked;
  dragCheck=document.getElementsByName('items'+formNum+'-'+track)[0].checked;
  if(document.getElementsByName('items'+formNum+'-'+track)[0].checked)
    document.getElementById('td'+formNum+'-'+track).style.backgroundColor='#listSelected#';
  else
    document.getElementById('td'+formNum+'-'+track).style.backgroundColor='#listUnselected#';
}
function listMouseOver(formNum, track){
  if(mouseDown){
    document.getElementsByName('items'+formNum+'-'+track)[0].checked=dragCheck;
    if(document.getElementsByName('items'+formNum+'-'+track)[0].checked)
      document.getElementById('td'+formNum+'-'+track).style.backgroundColor='#listSelected#';
    else
      document.getElementById('td'+formNum+'-'+track).style.backgroundColor='#listUnselected#';
  }
}
</script>
<cfset form_num=1>

<cfloop query="classes">

<cfif session.acctype eq "admin" or session.user eq UCLA_ID or ListContainsNoCase(TAs,session.user)>
<input type="hidden" name="id#form_num#" value="#id#">
<tr><td colspan="3"><hr></td></tr>
<tr><th colspan="3">Class &quot;<a href="classrec.cfm?t=view&classid=#classid#&listadd=no" class="go2">#title# - #quarter# #year#</a>&quot;</th></tr>
<tr><th colspan="3">Annotations:</th></tr>
<cfif url.ed is "yes" or structKeyExists(url,"edannot")>
<tr><td align="center" colspan="3">
<textarea wrap="virtual"
			name="annotation#form_num#"
			rows="3"
			cols="69"
			class="general">#replace(annotation,'"',"&quot;","all")#</textarea>
</td></tr>
<cfif session.acctype neq "admin">
<tr><td align="center" colspan="3"><input type="hidden" name="edannot"><input type="submit" value="Save"></td></tr>
</cfif>
<cfelse>
<tr><td colspan="3">
#annotation#
<cfif session.acctype neq "admin" and not structKeyExists(url,"editems")></td></tr>
<tr><td align="center" colspan="3"><a href="singlerec.cfm?ed=no&ited=no&id=#variables.workid#&edannot" class="go2">EDIT</a></td></tr></cfif>
</cfif>

<tr><th colspan="3">Selected Tracks:</td></tr>

<cfif url.ed is "yes" or structKeyExists(url,"editems")>
	<tr><td align="center" colspan="3">
	<p>Click tracks to toggle status.  Drag mouse for multiple tracks.</p>
	<p>Selected tracks will be ordered by the numbers to their left.</p>
	<table id="table#form_num#" cellpadding="0" cellspacing="0">
	<cfloop index="looper" from="1" to="#ListLen(classes.items[classes.currentRow])+1#">
		<cfloop query="srch2">
			<cfif looper le ListLen(classes.items[classes.currentRow]) and srch2.itemid eq ListGetAt(classes.items[classes.currentRow],looper) or looper gt ListLen(classes.items[classes.currentRow]) and not ListContains(classes.items[classes.currentRow],itemid)>
				<cfif looper le ListLen(classes.items[classes.currentRow])>
					<cfset orderNum=looper>
				<cfelse>
					<cfset orderNum=looper>
					<cfset looper=looper+1>
				</cfif>
				<tr>
            	<td>
            	<input type="text" name="order#form_num#-#itemid#" size="1" value="#orderNum#">
            	</td>
            	<td <cfif ListContains(classes.items[classes.currentRow],srch2.itemid) or ListLen(classes.items[classes.currentRow]) eq 0>style="background-color:#listSelected#;" </cfif>id="td#form_num#-#itemid#" onMouseDown="listMouseDown(#form_num#,#itemid#);" onMouseOver="listMouseOver(#form_num#,#itemid#);">
				<input type="checkbox" name="items#form_num#-#itemid#" value="#itemid#" <cfif ListContains(classes.items[classes.currentRow],srch2.itemid) or ListLen(classes.items[classes.currentRow]) eq 0>checked="checked"</cfif> onClick="return false;"><input type="button" value="Track ###track#: #caption#" style="text-align:left;border:none;background:none;cursor:pointer;" onFocus="blur();">
            	</td>
            	</tr>
			</cfif>
		</cfloop>
	</cfloop>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr><td colspan="2"><input type="button" value="Unselect All" onClick="for(var x=0;x<document.getElementsByTagName('input').length;x++){if(document.getElementsByTagName('input')[x].name.substr(0,'items#form_num#-'.length)=='items#form_num#-'){document.getElementsByTagName('input')[x].checked=false;document.getElementById('td#form_num#-'+document.getElementsByTagName('input')[x].name.substr('items#form_num#-'.length)).style.backgroundColor='#listUnselected#';}}">
	<input type="button" value="Select All" onClick="for(var x=0;x<document.getElementsByTagName('input').length;x++){if(document.getElementsByTagName('input')[x].name.substr(0,'items#form_num#-'.length)=='items#form_num#-'){document.getElementsByTagName('input')[x].checked=true;document.getElementById('td#form_num#-'+document.getElementsByTagName('input')[x].name.substr('items#form_num#-'.length)).style.backgroundColor='#listSelected#';}}">
	<cfif session.acctype neq "admin">
		<input type="hidden" name="editems"><input type="submit" value="Save">
	</cfif>
	</td></tr>
	</table>
	</td></tr>
<cfelse>
	<tr><td colspan="3" style="text-align:center">
	<cfset selectedTracks="">
	<cfif ListLen(classes.items[classes.currentRow]) eq 0>
		<cfloop query="srch2">
			#track# <!--- #srch2.itemid# --->
		</cfloop>
	<cfelse>
		<cfloop index="looper" from="1" to="#ListLen(classes.items[classes.currentRow])#">
			<cfloop query="srch2">
				<cfif itemid eq ListGetAt(classes.items[classes.currentRow],looper)>
					#track#
				</cfif>
			</cfloop>
		</cfloop>
	</cfif>
	<cfif session.acctype neq "admin" and not structKeyExists(url,"edannot")></td></tr>
		<tr><td align="center" colspan="3"><a href="singlerec.cfm?ed=no&ited=no&id=#variables.workid#&editems" class="go2">EDIT</a></td></tr></cfif>
	</cfif>
	<cfset form_num=form_num+1>
</cfif>

</cfloop>

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
<p><cfif url.ited is "no" and trim(session.acctype) neq "readonly"><a href="singlerec.cfm?ed=yes&ited=no&id=#variables.workid#" class="go2">EDIT</a><cfif no_items is 0>&nbsp;/&nbsp;<a href="deleterec.cfm?workid=#variables.workid#" class="go2" onClick="return confirm('Delete this item and all its tracks?')">DELETE</a></cfif>&nbsp;/&nbsp;<a href="duprec.cfm?id=#variables.workid#" class="go2">DUPLICATE</a></cfif></p>
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

<cfoutput><cfif url.ited is "yes">
<form action="singlerecitem_action.cfm" method="post">
<input type="hidden" name="workid" value="#variables.workid#">
</cfif></cfoutput>

<table border="1" cellspacing="0" cellpadding="1" width="100%">
<cfif structKeyExists(url,"editall")><tr><td colspan="10" align="center"><input type="submit" value="SAVE ALL"></td></tr></cfif>
<tr>
<th>Order</th>
<cfif ited eq "yes">
	<th>Vol.</th>
	<th>Disc</th>
	<th>Side</th>
<cfelse>
	<th colspan="3">Filename</th>
</cfif>
	<th>Track</th>
	<th>Par. filename</td>
	<th>Track title</td>
	<th colspan="2">Play audio</th>
	<cfif not structKeyExists(url,"editall")><th><cfif trim(session.acctype) eq "readonly" and not isInstructor>Address<cfelse>&nbsp;</cfif></th></cfif>
</tr>

<cfset form_num=1>
<cfset FirstArea=true>
<cfoutput query="srch2">
<cfset f=baseaddress>
<cfif srch2.volume neq ""><cfset f=f&"v"&trim(srch2.volume)></cfif>
<cfif srch2.disc neq ""><cfset f=f&"d"&trim(srch2.disc)></cfif>
<cfif srch2.side neq ""><cfset f=f&"s"&trim(srch2.side)></cfif>
<cfset f=f&"-"&trim(srch2.track)>
<tr>
	<cfif ited eq "yes" and (srch2.itemid eq url.itemid or structKeyExists(url,"editall")) and not structKeyExists(url,"annotate")>
		<cfif FirstArea><a name="EditTrack"><cfset FirstArea=false></cfif>
		<input type="hidden" name="itemid#form_num#" value="#srch2.itemid#">
		<td align="center"><input type="text" name="ordr#form_num#" value="#srch2.ordr#" size="3" maxlength="3"></td>
		<td align="center"><input type="text" name="volume#form_num#" value="#srch2.volume#" size="3" maxlength="3"></td>
		<td align="center"><input type="text" name="disc#form_num#" value="#srch2.disc#" size="3" maxlength="3"></td>
		<td align="center"><input type="text" name="side#form_num#" value="#srch2.side#" size="3" maxlength="3"></td>
		<td align="center"><input type="text" name="track#form_num#" value="#srch2.track#" size="3" maxlength="50"></td>
		<td><input type="text" name="parfile#form_num#" value="#srch2.parfile#" size="12" maxlength="50"></td>
		<td><input type="text" name="caption#form_num#" value="#replace(srch2.caption,'"',"&quot;","all")#" size="60" maxlength="200"></td>
		<td align="center"><a href="#srv#/#variables.f#.smil"><img src="sound02.gif" border="0" alt="Play audio"></a></td>
		<td align="center"><input type="checkbox" name="audioOK#form_num#" value="1" <cfif srch2.audioOK is 1>checked</cfif>></td>
		<cfif not structKeyExists(url,"editall")><td align="center"><input type="submit" value="SAVE"></td></cfif>
		<cfset form_num=form_num+1>
	<cfelse>
		<td align="center"><cfif srch2.ordr neq "">#srch2.ordr#<cfelse>&nbsp;</cfif></td>
		<cfif ited is "no">
			<td colspan="3">#variables.f#</td>
            <td>#track#</td>
		<cfelse>
			<td align="center"><cfif srch2.volume neq "">#srch2.volume#<cfelse>&nbsp;</cfif></td>
			<td align="center"><cfif srch2.disc neq "">#srch2.disc#<cfelse>&nbsp;</cfif></td>
			<td align="center"><cfif srch2.side neq "">#srch2.side#<cfelse>&nbsp;</cfif></td>
			<td align="center"><cfif srch2.track neq "">#srch2.track#<cfelse>&nbsp;</cfif></td>
		</cfif>
		<td><cfif srch2.parfile neq "">#srch2.parfile#<cfelse>&nbsp;</cfif></td>
		<td><cfif srch2.caption neq "">#srch2.caption#<cfelse>&nbsp;</cfif></td>
		<td align="center"><a href="#srv#/#variables.f#.smil"><img src="sound02.gif" border="0" alt="Play audio"></a></td>
		<td align="center"><cfif srch2.audioOK is 1>ok<cfelse>&nbsp;</cfif></td>
		<cfif url.ited eq "yes" or url.ed eq "yes" or structKeyExists(url,"edannot")>
			<td>&nbsp;</td>
		<cfelseif trim(session.acctype) eq "readonly" and not isInstructor>
			<td>#srv#/#variables.f#.smil</td>
		<cfelse>
			<td align="center"><cfif session.acctype eq "admin"><a href="singlerec.cfm?ed=no&ited=yes&id=#variables.workid#&itemid=#srch2.itemid###EditTrack" class="go2">EDIT</a>&nbsp;/&nbsp;<a href="deleteitem.cfm?itemid=#srch2.itemid#&workid=#workid#" class="go2" onClick="return confirm('Delete this track?')">DELETE</a></cfif><cfif classes.recordcount gt 0><br><a href="singlerec.cfm?ed=no&ited=yes&id=#variables.workid#&itemid=#srch2.itemid#&annotate##Annotate" class="go2">ANNOTATE</a></cfif></td>
		</cfif>
	</cfif>
</tr>

<cfloop query="annots">
<cfif session.acctype eq "admin" or session.user eq UCLA_ID or ListContainsNoCase(TAs,session.user)>
<cfif annots.itemid eq srch2.itemid[srch2.currentRow]>
<tr><td colspan="10"><div style="text-align:center"><b>Annotation for class
<cfif url.ited eq "yes" and (url.itemid eq annots.itemannotid)>
<input type="hidden" name="ItemAnnot" value="true">
<input type="hidden" name="itemannotid" value="#annots.itemannotid#">
<select name="id"><cfloop query="classes"><cfif session.acctype eq "admin" or UCLA_ID eq session.user or ListContainsNoCase(TAs,session.user)><option value="#id#" <cfif annots.id eq classes.id>selected</cfif>>#title# - #quarter# #year#</option></cfif></cfloop></select></b></div>
<a name="ItemAnnot">
<textarea wrap="virtual"
			name="itemannotation"
			rows="3"
			cols="69"
			class="general">#replace(annots.itemannotation,'"',"&quot;","all")#</textarea>
<cfelse>
<a href="classrec.cfm?t=view&classid=#classid#&listadd=no" class="go2">#annots.title# - #annots.quarter# #annots.year#</a></b></div>#annots.itemannotation#
</cfif>
<cfif url.ited eq "yes">
	<cfif (srch2.itemid[srch2.currentRow] eq annots.itemid and url.itemid eq annots.itemannotid)><div style="text-align:center"><input type="submit" value="Save"></div></cfif>
<cfelseif url.ed eq "no">
	<cfif srch2.itemid[srch2.currentRow] eq annots.itemid and url.ited neq "yes" and url.ed neq "yes" and not structKeyExists(url,"edannot")>
	<div style="text-align:center">
	<a href="singlerec.cfm?ed=no&ited=yes&id=#variables.workid#&itemid=#annots.itemannotid###ItemAnnot" class="go2">EDIT</a>&nbsp;/&nbsp;<a href="deleteitem.cfm?itemid=#annots.itemannotid#&workid=#workid#&annotate" class="go2" onClick="return confirm('Delete this annotation?')">DELETE</a></div>
	</cfif>
</cfif>
</td>
</tr>
</cfif>
</cfif>
</cfloop>
<cfif structKeyExists(url,"annotate") and structKeyExists(url,"itemid")>
<a name="Annotate">
<cfif srch2.itemid eq url.itemid>
<input type="hidden" name="itemannot" value="true">
<input type="hidden" name="newannot" value="true">
<input type="hidden" name="itemid" value="#srch2.itemid#">
<tr>
<th colspan="10">Annotation for class <select name="id"><cfloop query="classes"><cfif session.acctype eq "admin" or UCLA_ID eq session.user or ListContainsNoCase(TAs,session.user)><option value="#id#">#title# - #quarter# #year#</option></cfif></cfloop></select></th></tr><tr><td colspan="10">
<textarea wrap="virtual"
			name="itemannotation"
			rows="3"
			cols="69"
			class="general"></textarea></td></tr><tr><td align="center" colspan="10"><input type="submit" value="Save"></td>
</tr>
</cfif>
</cfif>
</cfoutput>
<cfif url.ited eq "no" and url.ed eq "no" and trim(session.acctype) neq "readonly">
<cfoutput>
<tr><td colspan="9"><a href="newitem.cfm?workid=#variables.workid#" class="go2">ADD NEW TRACK</a></td><td align="center"><a href="singlerec.cfm?ed=no&ited=yes&id=#variables.workid#&itemid=#srch2.itemid#&editall##EditTrack" class="go2">EDIT ALL TRACKS</a></td></tr>
</cfoutput>
</cfif>
<cfif structKeyExists(url,"editall")><tr><td colspan="10" align="center"><input type="submit" value="SAVE ALL"></td></tr></cfif>
<cfif url.ited is "yes">
</form>
</cfif>

</table>
</td></tr>
</table>
<cfinclude template="foot.cfm">
</body>
</html>
