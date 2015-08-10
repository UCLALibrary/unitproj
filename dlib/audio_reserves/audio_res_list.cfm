<!--- AUDIO RESERVES LIST --->
<!--- expects queries: instinfo, worklist, reslist --->

<cfif isDefined("url.displayitem")>
	<cfset urldisplayitem=url.displayitem>
<cfelse>
	<cfset urldisplayitem=0>
</cfif>
<cfset displayitem=0>
<!---
<cfif session.reservelist is "yes">
  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"> <a href="#wifi">WiFi</a> / <a href="#format">Audio format</a> / <a href="#labs">Where to listen</a> / <a href="#offcampus">Off campus access</a> / <a href="#problems">Questions/problems</a> </font></p>
</cfif>
--->
<cfif isDefined("query.instinfo")>
  <cfoutput query="instinfo">
    <cfif FacultyNote is not "">
      <table border=3 frame="lhs" bordercolor="black" cellpadding=4>
        <tr>
          <td><p><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i><b>#FacultyNote#</b></i></font></p></td>
        </tr>
      </table>
    </cfif>
  </cfoutput>
</cfif>
<!--- Index --->
<cfset numbdisplayitems=0>

  <cfoutput query="worklist">
  	<cfset numbdisplayitems=numbdisplayitems+1>
    <cfif numbdisplayitems neq urldisplayitem><cfset dspitm=1><cfelse><cfset dspitm=0></cfif>
    <cfif dspitm><p><cfelse><table><tr><th bgcolor="FFCCCC"></cfif>&diams;<font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
      <cfif session.reservelist is "yes" and incl>
        [#classinfo#]
      </cfif>	  
	  <cfset numTracks=0>
    <cfloop query="reslist">
		<cfif workid eq worklist.workid[worklist.currentRow] and not ListContains(items,itemid)>
			<cfset numTracks=numTracks+1>
            <cfinclude template="item_caption.cfm">
		</cfif>
      </cfloop>	  
      #composer# <cfif dspitm><a href="audioreserves.cfm?classid=#classid#&displayitem=#numbdisplayitems#"></cfif><cfif numTracks eq 1 and ListLen(items) neq 0>&quot;#cpt#&quot; from <cfelseif ListLen(items) gt 1>Excerpts from </cfif><i>#title#</i><cfif dspitm></a></cfif>
      <cfif librarycallnumber is not "">
        <font size="-2">[#librarycallnumber#]</font>
      </cfif>
      </font><cfif dspitm></p><cfelse></th></tr></table></cfif>
  </cfoutput>

<!--- New List --->
<cfset i=1>
<cfset b="">
<cfset c=0>
<cfset cid=0>
<cfset j=0>
<cfset p=0>
<cfloop query="worklist">
	<cfset displayitem=displayitem+1>
	<cfset nextdisplayitem=displayitem+1>
	<cfset prevdisplayitem=displayitem-1>
	<cfif displayitem eq urldisplayitem>
  <cfoutput> <a name="#workid#"></a>
    <hr>
    <p><cfif displayitem is not 1><a href="audioreserves.cfm?classid=#classid#&displayitem=#prevdisplayitem#">PREVIOUS</a>&nbsp;&nbsp;&nbsp;</cfif><strong>This is <font color="##FF0000">#urldisplayitem#</font> of <font color="##FF0000">#numbdisplayitems#</font></strong>&nbsp;&nbsp;&nbsp;<cfif displayitem is not numbdisplayitems><a href="audioreserves.cfm?classid=#classid#&displayitem=#nextdisplayitem#">NEXT</a></cfif></p>
    <p> <font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
      <cfif session.reservelist is "yes" and incl>
        [#classinfo#]
      </cfif>
      <b>#composer#</b> <i>#title#</i>
      <cfif performers is not "">
        <br>
        Performers: #performers#
      </cfif>
      <cfif note1 is not "">
        <br>
        #note1#
      </cfif>
      <cfif note2 is not "">
        <br>
        #note2#
      </cfif>
      <cfif label is not "">
        <br>
        #label#, #labelnumber#
      </cfif>
      <cfif librarycallnumber is not "">
        <br>
        Library call number: #librarycallnumber#
      </cfif>
      <cfif trim(exLink) neq "">
        <br />
        Related website: <a href="javascript:spawnwindow4('#exLink#')">#exLink#</a>
      </cfif>
	  <cfif annotation neq "">
		  <br /><br />
		  <table><tr><td bgcolor="##D8D8D8"><div style="padding:8px;border:1px solid black;"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><strong>Annotation:</strong> #annotation#</font></div></td></tr></table>
	  </cfif>
      </font>
      <cfif session.usern is "admin">
        <br>
        <font size="-2"><b><i><a href="upd_item.cfm?wid=#reslist.workid#&cid=#classid#">EDIT RECORD</a></i></b></font>
      </cfif>
    </p>
  </cfoutput>
  <table>
  <cfset itemsTemp=items>
  <cfif ListLen(itemsTemp) eq 0><cfset itemsTemp="-2"></cfif> 
  <cfloop index="looper" from="1" to="#ListLen(itemsTemp)#">  
  <cfoutput query="reslist">
      <cfif workid eq worklist.workid[worklist.currentRow] and (itemid eq ListGetAt(itemsTemp,looper) or ListGetAt(itemsTemp,looper) eq "-2")>
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
        </cfif>
        <cfif reslist.include and reslist.itemid is not c>
          <cfif session.classid is "all" or listfind("#reslist.excludefrom#", "#session.classid#") is 0>
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
              <cfif trim(audioLink) is "">
                <th bgcolor="FFCCCC" nowrap="nowrap"><div align="left">&nbsp;<font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>#cpt#</i></font></div>
                
                <cfset p=p+1>
<cfset pl="player"&p>

<div id="#pl#">
<a href="rtsp://stream.library.ucla.edu:1935/dlp/_definst_/mp3:audioreserves/#lcase(rmfile)#.mp3">Listen this stream over RTSP</a>
</div><div>
<cfif reslist.video is "">
	<cfset variables.video=0>
<cfelse>
	<cfset variables.video=reslist.video>
</cfif>
<cfif variables.video>
<script type="text/javascript">

    var ua = navigator.userAgent.toLowerCase();
    var isAndroid = ua.indexOf("android") > -1;

	jwplayer("#pl#").setup({
		sources: [
		    {file: "rtmp://stream.library.ucla.edu/dlp/mp4:audioreserves/#lcase(rmfile)#.mp4"},
			{file: "http://stream.library.ucla.edu:1935/dlp/_definst_/mp4:audioreserves/#lcase(rmfile)#.mp4/playlist.m3u8"}
        ],
		rtmp: {
			bufferlength: 3
		},
		fallback: 'false',
        primary: 'flash',
        androidhls: 'true',
		sharing: '{}',
		stretching: "uniform",
		autostart: "false"
	});
</script>
<cfelse>
<script type="text/javascript">
    var ua = navigator.userAgent.toLowerCase();
    var isAndroid = ua.indexOf("android") > -1;
	
    jwplayer("#pl#").setup({
	sources: [
		    {file: "rtmp://stream.library.ucla.edu/dlp/mp3:audioreserves/#lcase(rmfile)#.mp3"},
			{file: "http://stream.library.ucla.edu:1935/dlp/_definst_/mp3:audioreserves/#lcase(rmfile)#.mp3/playlist.m3u8"}
        ],
		rtmp: {
			bufferlength: 3
		},
		fallback: 'false',
        primary: 'flash',
		androidhls: 'true',
		height: 30
    });
</script>
</cfif>
</div>
                
                
                </th>
                
                
              <!--- items --->
                
              </cfif>
              <cfif trim(audioLink) is not "">
                </tr><tr><th bgcolor="FFCCCC">c2 <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><a href="javascript:spawnwindow0('#audioLink#')"><i>#cpt#</i></a> [Windows Media]</font></div></th>
                
                               
              </cfif>
              <cfif scorecaption is not "">
                </tr><tr><th bgcolor="CCFFFF">c3 <div align="left"><a href="javascript:spawnwindow1('image.cfm?k=#startimageID#&baseaddr=#imgbaseaddr#&l=#lowestimageID#&m=#highestimageID#')"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>#scorecaption#</i></font></a></div></th>
              </cfif>
              <cfif LocalHTMFile is not "">
                </tr><tr><th bgcolor="CCFFCC">c4 <div align="left"><a href="javascript:spawnwindow2('htmfiles/#LocalHTMFile#')"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>#LFileCaption#</i></font></a></div></th>
              </cfif>
              <cfif wwwLink is not "">
                </tr><tr><th bgcolor="FFFFCC">c5 <div align="left"><a href="javascript:spawnwindow3('#wwwLink#')"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>#wLinkCaption#</i></font></a></div></th>
              </cfif>
              <cfif trim(hLink) is not "">
                </tr><tr><th bgcolor="FFFFCC">c6 <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Related website: <a href="javascript:spawnwindow3('#hLink#')"><i>#hLink#</i></a></font></div></th>
              </cfif>
            
            
  
            
            
            
            </tr>
			<cfloop query="itemannot">
			<cfif itemid eq reslist.itemid[reslist.currentRow]>
				<tr><td>c8<div style="width:600px;padding:8px;border:1px solid black;background-color:##EEEEEE;"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Annotation</b>: #itemannotation#</font></div></td></tr>
			</cfif>
			</cfloop>
          </cfif>
          <cfset c = reslist.itemid>
          <cfset i=i+1>
        </cfif>
        <cfif session.classid is "all" and (cid is not reslist.classid or a is not reslist.workid)>
          <cfset temp=arrayappend(instlst, reslist.instructor)>
          <cfset temp=arrayappend(deptlst, reslist.department)>
          <cfset temp=arrayappend(cnumlst, reslist.classnumber)>
          <cfset j=j+1>
          <cfset cid = reslist.classid>
        </cfif>
        <cfset b=ramlink>
      </cfif>
    </cfoutput>
	</cfloop>
  </table>
  <cfoutput><!---
    <cfif i gt 2 and prevFileType neq "5" and b neq "" and items eq "">
      <table cellpadding="5" cellspacing="5">
        <tr bgcolor="FFFFCC">
          <th> <div align="left"><a href="#variables.EFormat#/#b#.#fileX#"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>Play selections in sequence</i></font></a></div></th>
        </tr>
      </table>
    </cfif>--->
    <cfif session.classid is "all" and j is not 0>
      <cfset l=val(arraylen(instlst))>
      <font size="-1"><b>
      <cfloop index="k" from="1" to="#l#">
        <cfif k is 1>
          <br>
          <u>On reserve for</u>:
        </cfif>
        <br>
        #instlst[k]# #deptlst[k]# #cnumlst[k]#
      </cfloop>
      </b></font>
    </cfif>
    <cfset i=1>
  </cfoutput>
  </cfif>
</cfloop>
<!--- Old List
<cfset i=1>
<cfset a=0>
<cfset b="">
<cfset c=0>
<cfset cid=0>
<cfset j=0>
<cfset prevFileType="7">
<cfset EFormat = "http://audior.library.ucla.edu:8080/ramgen">
<cfset FileX = "smil">

<cfoutput query="reslist">

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
    <cfif i gt 2 and prevFileType neq "5" and b neq "">
      <table cellpadding="5" cellspacing="5">
        <tr bgcolor="FFFFCC">
          <th> <div align="left"><a href="#variables.EFormat#/#b#.#fileX#"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>Play selections in sequence</i></font></a></div></th>
        </tr>
      </table>
    </cfif>
    <cfif session.classid is "all" and j is not 0>
      <cfset l=val(arraylen(instlst))>
      <font size="-1"><b>
      <cfloop index="k" from="1" to="#l#">
        <cfif k is 1>
          <br>
          <u>On reserve for</u>:
        </cfif>
        <br>
        #instlst[k]# #deptlst[k]# #cnumlst[k]#
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
  <p> <font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
    <cfif session.reservelist is "yes" and incl>
      [#classinfo#]
    </cfif>
    <b>#composer#</b> <i>#title#</i>
    <cfif performers is not "">
      <br>
      Performers: #performers#
    </cfif>
    <cfif note1 is not "">
      <br>
      #note1#
    </cfif>
    <cfif note2 is not "">
      <br>
      #note2#
    </cfif>
    <cfif label is not "">
      <br>
      #label#, #labelnumber#
    </cfif>
    <cfif librarycallnumber is not "">
      <br>
      Library call number: #librarycallnumber#
    </cfif>
    <cfif trim(exLink) neq "">
      <br />
      Related website: <a href="javascript:spawnwindow4('#exLink#')">#exLink#</a>
    </cfif>
    </font>
    <cfif session.usern is "admin">
      <br>
      <font size="-2"><b><i><a href="upd_item.cfm?wid=#reslist.workid#&cid=#classid#">EDIT RECORD</a></i></b></font>
    </cfif>
  </p>
  <table cellpadding="5" cellspacing="5">
</cfif>
<cfif reslist.include and reslist.itemid is not c>
  <cfif session.classid is "all" or listfind("#reslist.excludefrom#", "#session.classid#") is 0>
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
      <cfif trim(audioLink) is "">
        <th bgcolor="FFCCCC"> <div align="left"><a href="#variables.EFormat#/#rmfile#.#fileX#"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>#cpt#</i></font></a></div></th>
      </cfif>
      <cfif trim(audioLink) is not "">
        <th bgcolor="FFCCCC"> <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><a href="javascript:spawnwindow0('#audioLink#')"><i>#cpt#</i></a> [Windows Media]</font></div></th>
      </cfif>
      <cfif scorecaption is not "">
        <th bgcolor="CCFFFF"> <div align="left"><a href="javascript:spawnwindow1('image.cfm?k=#startimageID#&baseaddr=#imgbaseaddr#&l=#lowestimageID#&m=#highestimageID#')"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>#scorecaption#</i></font></a></div></th>
      </cfif>
      <cfif LocalHTMFile is not "">
        <th bgcolor="CCFFCC"> <div align="left"><a href="javascript:spawnwindow2('htmfiles/#LocalHTMFile#')"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>#LFileCaption#</i></font></a></div></th>
      </cfif>
      <cfif wwwLink is not "">
        <th bgcolor="FFFFCC"> <div align="left"><a href="javascript:spawnwindow3('#wwwLink#')"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>#wLinkCaption#</i></font></a></div></th>
      </cfif>
      <cfif trim(hLink) is not "">
        <th bgcolor="FFFFCC"> <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Related website: <a href="javascript:spawnwindow3('#hLink#')"><i>#hLink#</i></a></font></div></th>
      </cfif>
    </tr>
  </cfif>
  <cfset c = reslist.itemid>
  <cfset i=i+1>
</cfif>
<cfif session.classid is "all" and (cid is not reslist.classid or a is not reslist.workid)>
  <cfset temp=arrayappend(instlst, reslist.instructor)>
  <cfset temp=arrayappend(deptlst, reslist.department)>
  <cfset temp=arrayappend(cnumlst, reslist.classnumber)>
  <cfset j=j+1>
  <cfset cid = reslist.classid>
</cfif>
<cfset a=workid>
<cfset b=ramlink>
</cfoutput> <cfoutput>
  <cfif i gt 2>
    </table>
    <cfif b neq "">
      <table cellpadding="5" cellspacing="5">
        <tr bgcolor="FFFFCC">
          <th> <div align="left"><a href="#variables.EFormat#/#b#.#fileX#"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><i>Play selections in sequence</i></font></a></div></th>
        </tr>
      </table>
    </cfif>
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
        <br>
        <u>On reserve for</u>:
      </cfif>
      <br>
      #instlst[k]# #deptlst[k]# #cnumlst[k]#
    </cfloop>
    </b></font>
  </cfif>
</cfoutput> End Old List ---> 
