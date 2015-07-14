<cfquery name="ordr" datasource="#dsn#">
select ordr from items where workid=#url.workid#
</cfquery>
<cfset m_ordr=0>
<cfoutput query="ordr">
<cfif ordr.ordr ge m_ordr>
	<cfset m_ordr=ordr.ordr+1>
</cfif>
</cfoutput>

<cfquery name="additem" datasource="#dsn#">
insert into items(ordr,workid,locator,include) values(#m_ordr#,#url.workid#,'$sd$',1)
</cfquery>
<cfquery name="seek" datasource="#dsn#">
select itemid from items where locator='$sd$'
</cfquery>
<cfoutput query="seek">
	<cfset m_itemid=seek.itemid>
</cfoutput>
<cfquery name="reset" datasource="#dsn#">
update items set locator='' where itemid=#m_itemid#
</cfquery>

<cflocation url="singlerec.cfm?ed=no&ited=yes&id=#url.workid#&itemid=#m_itemid#" addtoken="no">