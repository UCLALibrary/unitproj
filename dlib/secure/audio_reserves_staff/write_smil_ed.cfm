<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Music Library Digital Audio Home</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<CFINCLUDE TEMPLATE="head.cfm">

<cfquery name="smilBase" datasource="#dsn#">
select composer,title,baseaddress,ramlink
	from works 
	where workid=#url.workid#
</cfquery>

<cfoutput query="smilBase">
	<cfif right(composer,1) neq "." and composer neq "">
		<cfset composer=smilBase.composer & ".">
	<cfelse>
		<cfset composer=smilBase.composer>
	</cfif>
	<cfset comptitle=trim(replace(variables.composer,'"',"","all") & " " & replace(smilBase.title,'"',"","all"))>
	<cfset smilDirectory=getDirectoryFromPath(CF_TEMPLATE_PATH) & "smil\">
	<cfset baseAddress=trim(smilBase.baseAddress)>
	<cfif smilBase.ramlink neq "">
		<cfset metaF=trim(smilBase.ramlink)&".smil">
		<cfset metaFilename=getDirectoryFromPath(CF_TEMPLATE_PATH) & "smil\" & metaF>
	<cfelse>
		<cfset metaF=0>
		<cfset metaFilename=0>
	</cfif>
</cfoutput>

<cfquery name="smilFiles" datasource="#dsn#">
select itemid,ordr,volume,disc,side,track,<!--- parfilefullpath, --->parfile,caption
	from items
	where workid=#url.workid#
	order by ordr,itemid
</cfquery>

<cfif metaF neq 0>
	<cffile action="write" file="#metaFilename#" output="<smil>" addnewline="yes">
	<cffile action="append" file="#metaFilename#" output="<head>" addnewline="yes">
	<cffile action="append" file="#metaFilename#" output='<meta name="composer/title" content="#comptitle#"/>' addnewline="yes">
	<cffile action="append" file="#metaFilename#" output="</head>" addnewline="yes">
	<cffile action="append" file="#metaFilename#" output="<body>" addnewline="yes">
</cfif>

<body>

<cfoutput query="smilFiles">
	<cfset fn=baseAddress>
	<cfset caption=replace(caption,'"',"","all")>
	<cfif trim(volume) neq ""><cfset fn=fn&"v"&trim(volume)></cfif>
	<cfif trim(disc) neq ""><cfset fn=fn&"d"&trim(disc)></cfif>
	<cfif trim(side) neq ""><cfset fn=fn&"s"&trim(side)></cfif>
	<cfif trim(track) neq ""><cfset fn=fn&"-"&trim(track)></cfif>
	<cfset fn0=fn&".smil">
	<cfset fn2=smilDirectory&fn0>
	<cfset fn1=fn&".rm">
	<cffile action="write" file="#fn2#" output="<smil>" addnewline="yes">
	<cffile action="append" file="#fn2#" output="<head>" addnewline="yes">
	<cffile action="append" file="#fn2#" output='<meta name="composer/title" content="#comptitle#"/>' addnewline="yes">
	<cffile action="append" file="#fn2#" output="</head>" addnewline="yes">
	<cffile action="append" file="#fn2#" output="<body>" addnewline="yes">
	<cfif parfile neq "">
		<cffile action="append" file="#fn2#" output="<par>" addnewline="yes">
	</cfif>
	<cffile action="append" file="#fn2#" output='<audio src="#srv9#/#fn1#" title="#variables.caption#"/>' addnewline="yes">
	<cfif parfile neq "">
		<!--- <cfif parfilefullpath is "0"> --->
			<cffile action="append" file="#fn2#" output='<ref src="#srv9#/#parfile#"/>' addnewline="yes">
		<!--- <cfelse>
			<cffile action="append" file="#fn2#" output='<ref src="#parfile#"/>' addnewline="yes">
		</cfif> --->
		<cffile action="append" file="#fn2#" output="</par>" addnewline="yes">
	</cfif>
	<cffile action="append" file="#fn2#" output="</body>" addnewline="yes">
	<cffile action="append" file="#fn2#" output="</smil>" addnewline="no">
	<strong>File written:</strong> #fn0#<br>
	<cfif metaF neq 0>
		<cfif parfile neq "">
			<cffile action="append" file="#metaFilename#" output="<par>" addnewline="yes">
		</cfif>
		<cffile action="append" file="#metaFilename#" output='<audio src="#fn1#" title="#variables.caption#"/>' addnewline="yes">
		<cfif parfile neq "">
			<!--- <cfif parfilefullpath is "0"> --->
				<cffile action="append" file="#metaFilename#" output='<ref src="#srv9#/#parfile#"/>' addnewline="yes">
			<!--- <cfelse>
				<cffile action="append" file="#metaFilename#" output='<ref src="#parfile#"/>' addnewline="yes">
			</cfif> --->
			<cffile action="append" file="#metaFilename#" output="</par>" addnewline="yes">
		</cfif>
	</cfif>
</cfoutput>
<!--- <audio src="#fn1#" title="#variables.caption#"/> --->
<cfif metaF neq 0>
	<cffile action="append" file="#metaFilename#" output="</body>" addnewline="yes">
	<cffile action="append" file="#metaFilename#" output="</smil>" addnewline="no">
	<cfoutput><strong>File written:</strong> #metaF#</cfoutput><br>
</cfif>

<p>SMIL files written for <cfoutput><strong>#comptitle#</strong> (Work ID: #url.workid#)</cfoutput> written to the directory <strong>audio2003\ml\smil\</strong></p>

<p><a href="singlerec.cfm?ed=no&ited=no&id=<cfoutput>#url.workid#</cfoutput>" class="go2">RETURN</a></p>

<cfinclude template="foot.cfm">

</body>

</html>