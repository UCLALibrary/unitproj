<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Field List</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">

<cfquery name="srch" datasource="#dsn#">
<cfif url.x is "composer">
select composer from works
where composer <> ''
group by composer
order by composer
<cfelseif url.x is "title">
select title from works 
where title <> ''
group by title
order by title
<cfelseif url.x is "label">
select label,labelnumber from works 
where label <> '' or labelnumber <> ''
group by label,labelnumber
order by label,labelnumber
<cfelseif url.x is "librarycallnumber">
select librarycallnumber from works 
where librarycallnumber <> ''
group by librarycallnumber
order by librarycallnumber
<cfelseif url.x is "performer">
select performers from works 
where performers <> ''
group by performers
order by performers
<cfelseif url.x is "filename">
select baseaddress from works 
where baseaddress <> ''
group by baseaddress
order by baseaddress
<cfelseif url.x is "class">
select classinfo from works 
where classinfo <> ''
group by classinfo
order by classinfo
</cfif>
</cfquery>
<h5><cfif url.x is "composer">
COMPOSERS
<cfelseif url.x is "title">
TITLES
<cfelseif url.x is "label">
RECORD LABELS &amp; NUMBERS
<cfelseif url.x is "librarycallnumber">
LIBRARY CALL NUMBERS
<cfelseif url.x is "performer">
PERFORMERS
<cfelseif url.x is "filename">
AUDIO FILE NAMES
<cfelseif url.x is "class">
CLASS SPECIFIC INFORMATION
</cfif></h5>

<p><cfoutput>#srch.recordCount#</cfoutput> values</p>

<table>
<cfset i=1>
<cfif url.x is "label"><tr><th>Label</th><th>Number</th></tr></cfif>
<cfoutput query="srch">
<tr valign="top"><td>#i#.&nbsp;</td><td>
<cfif url.x is "composer">
<a href="reclist.cfm?listtype=1&composer=#URLencodedFormat(composer)#" class="list">#composer#</a><br>
<cfelseif url.x is "title">
<a href="reclist.cfm?listtype=2&title=#URLEncodedFormat(title)#" class="list">#title#</a><br>
<cfelseif url.x is "label">
<a href="reclist.cfm?listtype=31&label=#URLEncodedFormat(label)#" class="list">#label#</a>&nbsp;</td><td><a href="reclist.cfm?listtype=3&label=#URLEncodedFormat(label)#&labelnumber=#URLencodedFormat(labelnumber)#" class="list">#labelnumber#</a><br>
<cfelseif url.x is "librarycallnumber">
<a href="reclist.cfm?listtype=4&librarycallnumber=#URLEncodedFormat(librarycallnumber)#" class="list">#librarycallnumber#</a><br>
<cfelseif url.x is "performer">
<a href="reclist.cfm?listtype=5&performer=#URLEncodedFormat(performers)#" class="list">#performers#</a><br>
<cfelseif url.x is "filename">
<a href="reclist.cfm?listtype=6&filename=#URLEncodedFormat(baseaddress)#" class="list">#baseaddress#</a><br>
<cfelseif url.x is "class">
<a href="reclist.cfm?listtype=7&class=#URLEncodedFormat(classinfo)#" class="list">#classinfo#</a><br>
</td></cfif>
</tr>
<cfset i=i+1>
</cfoutput>
</table>

<cfinclude template="foot.cfm">

</body>
</html>
