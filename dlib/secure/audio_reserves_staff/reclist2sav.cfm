<cfset session.reservelist="no">
<cfset session.classid="none">
<cfset session.usern="none">
<cfset a=0>
<cfset pound=chr(35)>

<ul>

<cfoutput query="srch">
	<cfif a is not workid>
		<li><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
		<cfif classinfo neq "">[#classinfo#]</cfif>
		#composer# <a href="#pound##workid#"><i>#title#</i></a>
		<cfif librarycallnumber is not "">
			<font size="-2">[#librarycallnumber#]</font>
		</cfif>
		</font></li>
	</cfif>
	<cfset a=workid>
</cfoutput>

</ul>


<!--- List --->

<cfset i=1>
<cfset a=0>
<cfset b="">
<cfset c=0>
<cfset cid=0>
<cfset j=0>
<cfset prevFileType="7">
<cfset EFormat = "http://audior.library.ucla.edu:8080/ramgen">
<cfset FileX = "smil">

<cfoutput query="srch">

<cfif prevFileType is 5>
	<!--- <cfset EFormat = "http://unitproj.library.ucla.edu/music/audio/ra7"> --->
	<cfset EFormat = "pnm://audior50.library.ucla.edu">
	<cfset fileX = "rm">
<cfelse>
	<!--- <cfset EFormat = "http://unitproj.library.ucla.edu/music/audio/ra7"> --->
	<cfset EFormat = "http://audior.library.ucla.edu:8080/ramgen">
	<cfset fileX = "smil">
</cfif>

<cfif workid is not a>

	<cfif a is not 0>
		</table>
	
		<cfif i gt 2 and prevFileType neq "5">
		<table cellpadding="5" cellspacing="5">
		  <tr bgcolor="FFFFCC"> 
		    <th> 
		      <div align="left"><a href="#variables.EFormat#/#b#.#fileX#"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>Play selections in sequence</i></font></a></div>
		    </th>
		  </tr>
		</table>
		</cfif>
	
		<cfif session.classid is "all" and j is not 0>
			<cfset l=val(arraylen(instlst))>
			<font size="-1"><b>
			<cfloop index="k" from="1" to="#l#">
				<cfif k is 1>
					<br><u>On reserve for</u>:
				</cfif>
				<br>#instlst[k]# #deptlst[k]# #cnumlst[k]#
			</cfloop>
			</b></font>
		</cfif>
	
	</cfif>

	<cfset i=1>
	
</cfif>

<cfif encFormat is 5>
	<!--- <cfset EFormat = "http://unitproj.library.ucla.edu/music/audio/ra7"> --->
	<cfset EFormat = "pnm://audior50.library.ucla.edu">
	<cfset fileX = "rm">
<cfelse>
	<!--- <cfset EFormat = "http://unitproj.library.ucla.edu/music/audio/ra7"> --->
	<cfset EFormat = "http://audior.library.ucla.edu:8080/ramgen">
	<cfset fileX = "smil">
</cfif>
<cfset prevFileType=encFormat>


<cfif i is 1>
	<cfif session.classid is "all">
		<cfset instlst=ArrayNew(1)>
		<cfset deptlst=ArrayNew(1)>
		<cfset cnumlst=ArrayNew(1)>
		<cfset j=1>
	</cfif>
	<a name="#workid#"></a>
	<hr>
	<p>
	<font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
	<cfif session.reservelist is "yes" and incl>[#classinfo#]</cfif>
	<b>#composer#</b> 
	<i>#title#</i>
	<cfif performers is not ""><br>Performers: #performers#</cfif>
	<cfif note1 is not ""><br>#note1#</cfif>
	<cfif note2 is not ""><br>#note2#</cfif>
	<cfif label is not ""><br>#label#, #labelnumber#</cfif>
	<cfif librarycallnumber is not ""><br>Library call number: #librarycallnumber#</cfif></font>
	<cfif session.usern is "admin">
		<br><font size="-2"><b><i><a href="upd_item.cfm?wid=#srch.workid#&cid=#classid#">EDIT RECORD</a></i></b></font>
	</cfif>
	</p>
	<table cellpadding="5" cellspacing="5">
</cfif>

<cfif srch.include and srch.itemid is not c>
	<cfif session.classid is "all" or listfind("#srch.excludefrom#", "#session.classid#") is 0>

		<cfinclude template="item_caption.cfm">
	
		<cfset rmfile = Baseaddress>
		<cfif volume is not "">
			<cfset rmfile = rmfile & "v" & trim(volume)>
		</cfif>
		<cfif disc is not "">
			<cfset rmfile = rmfile & "d" & trim(disc)>
		</cfif>
		<cfif side is not "">
			<cfset rmfile = rmfile & "s" & trim(side)>
		</cfif>
		<cfif track is not "">
			<cfset rmfile = rmfile & "-" & trim(track)>
		</cfif>

		<tr> 
		    <th bgcolor="FFCCCC"> 
		      <div align="left"><a href="#variables.EFormat#/#rmfile#.#fileX#"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>#cpt#</i></font></a></div>
		    </th>
			<cfif scorecaption is not "">
		    <th bgcolor="CCFFFF">
			<div align="left"><a href="javascript:spawnwindow1('image.cfm?k=#startimageID#&baseaddr=#imgbaseaddr#&l=#lowestimageID#&m=#highestimageID#')"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>#scorecaption#</i></font></a></div> 
			</th>
			</cfif>
			<cfif LocalHTMFile is not "">
		    <th bgcolor="CCFFCC">
			<div align="left"><a href="javascript:spawnwindow2('htmfiles/#LocalHTMFile#')"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>#LFileCaption#</i></font></a></div> 
			</th>
			</cfif>
			<cfif wwwLink is not "">
		    <th bgcolor="FFFFCC">
			<div align="left"><a href="javascript:spawnwindow3('#wwwLink#')"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>#wLinkCaption#</i></font></a></div> 
			</th>
			</cfif>
		</tr>
  
	</cfif>
	<cfset c = srch.itemid>
	<cfset i=i+1>
</cfif>

<cfif session.classid is "all" and (cid is not srch.classid or a is not srch.workid)>
	<cfset temp=arrayappend(instlst, srch.instructor)>
	<cfset temp=arrayappend(deptlst, srch.department)>
	<cfset temp=arrayappend(cnumlst, srch.classnumber)>
	<cfset j=j+1>
	<cfset cid = srch.classid>
</cfif>

<cfset a=workid>
<cfset b=ramlink>

</cfoutput>

<cfoutput>

<cfif i gt 2>
	</table>
	<table cellpadding="5" cellspacing="5">
	  <tr bgcolor="FFFFCC"> 
	    <th> 
	      <div align="left"><a href="#variables.EFormat#/#b#.#fileX#"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>Play selections in sequence</i></font></a></div>
	    </th>
	  </tr>
	</table>
<cfelseif i gt 1>
	</table>
<cfelse>
	<p><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">[No items found]</font></p>
</cfif>

<cfif session.classid is "all" and j is not 0>
	<cfset l=val(arraylen(instlst))>
	<font size="-1"><b>
	<cfloop index="k" from="1" to="#l#">
		<cfif k is 1>
			<br><u>On reserve for</u>:
		</cfif>
		<br>#instlst[k]# #deptlst[k]# #cnumlst[k]#
	</cfloop>
	</b></font>
</cfif>

</cfoutput>

