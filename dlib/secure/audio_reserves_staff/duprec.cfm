<cfquery name="oldrec" datasource="#dsn#">
select * from works
where workid=#url.id#
</cfquery>

<cfif oldrec.RecordCount>
<cfset oldrec.title=oldrec.title&" [DUPLICATE]">
<cfquery name="newrec" datasource="#dsn#">
insert into works
(
<cfset loopFirst = 1>
<cfloop list="#oldrec.columnList#" index="looper">
<cfif looper neq "workid" and (looper eq "locator" or oldrec["#looper#"][1] neq "")>
<cfif loopFirst><cfset loopFirst=0><cfelse>, </cfif>#looper#
</cfif>
</cfloop>
)
values
(
<cfset loopFirst = 1>
<cfloop list="#oldrec.columnList#" index="looper">
<cfif looper neq "workid" and (looper eq "locator" or oldrec["#looper#"][1] neq "")>
<cfif not isNumeric(#oldrec["#looper#"][1]#)>
	<cfset apos=1>
<cfelse>
	<cfset apos=0>
</cfif>
<cfif loopFirst><cfset loopFirst=0><cfelse>, </cfif><cfif looper eq "locator">'$sd$'<cfelse><cfif apos>'</cfif>#oldrec["#looper#"][1]#<cfif apos>'</cfif></cfif>
</cfif>
</cfloop>
)
</cfquery>

<cfquery name="loc" datasource="#dsn#">
select workid from works where locator='$sd$'
</cfquery>

<cfoutput query="loc">
	<cfset m_workid=loc.workid>
</cfoutput>

<cfquery name="del" datasource="#dsn#">
update works set locator='' where workid=#m_workid#
</cfquery>

<cfquery name="olditem" datasource="#dsn#">
select items.* from items
	where items.workid='#oldrec.workid#'
order by items.ordr, items.itemID
</cfquery>
<cfloop query="olditem">
<cfquery name="newitem" datasource="#dsn#">
insert into items
(
<cfset loopFirst = 1>
<cfloop list="#olditem.columnList#" index="looper">
<cfif looper neq "ItemID" and olditem["#looper#"][olditem.currentRow] neq "">
<cfif loopFirst><cfset loopFirst=0><cfelse>, </cfif>#looper#
</cfif>
</cfloop>
)
values
(
<cfset loopFirst = 1>
<cfloop list="#olditem.columnList#" index="looper">
<cfif looper neq "ItemID" and olditem["#looper#"][olditem.currentRow] neq "">
<cfif looper is "volume" or looper is "disc" or looper is "side" or looper is "track">
	<cfset apos=1>
<cfelseif not isNumeric(#olditem["#looper#"][olditem.currentRow]#)>
	<cfset apos=1>
<cfelse>
	<cfset apos=0>
</cfif>
<cfif loopFirst><cfset loopFirst=0><cfelse>, </cfif><cfif looper eq "WorkID">#m_workid#<cfelse><cfif apos>'</cfif>#olditem["#looper#"][olditem.currentRow]#<cfif apos>'</cfif></cfif>
</cfif>
</cfloop>
)
</cfquery>
</cfloop>
</cfif>
<cflocation url="singlerec.cfm?ed=yes&ited=no&id=#m_workid#" addtoken="No">
