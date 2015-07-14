<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<cfset audioit=arrayNew(1)>

<p>
<cfquery name="audioOK1" datasource="MusAudio">
select itemid from items where audioOK=1
</cfquery>
<cfoutput query="audioOK1">
	<cfset audioit[audioOK1.currentRow]=audioOK1.itemid>
	#audioit[audioOK1.currentRow]#<br>
</cfoutput>
</p>

<cfquery name="audioOK2" datasource="MusAudio">
update items
	set audioOK=0
</cfquery>

<cfloop index="i" from="1" to="#arrayLen(audioit)#">
	<cfquery name="audioOK3" datasource="MusAudio">
	update items
		set audioOK=1
		where itemid=#audioit[i]#
	</cfquery>
</cfloop>

<cfquery name="audioOK4" datasource="MusAudio">
select audioOK from items
</cfquery>

<p>
<cfoutput query="audioOK4">
#audioOK#
</cfoutput>
</p>

<p>DONE</p>

</body>
</html>
