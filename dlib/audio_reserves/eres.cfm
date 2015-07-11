<cfif not isdefined("session.quarterok")>
	<cfquery name="cq" datasource="#dsn#">
	select * from CurrentQuarter
	</cfquery>
	<cfset cYear=cq.year>
	<cfset cQuarter=cq.quarter>
	<cfquery name="checkquarter" datasource="#dsn#">
	select * from Classes
		where ClassID='#session.usern#'
			and Year='#cYear#'
			and Quarter='#cQuarter#'
	</cfquery>
	<cfif checkquarter.recordcount gt 0>
		<cfset session.quarterok="1">
	<cfelse>
		<cflocation url="login/reject.cfm" addtoken="No">
	</cfif>
</cfif>

<cfset classAccess=false>
<cfif structKeyExists(url,"i") and structKeyExists(session,"loggedinid")>
	<cfif url.i eq session.loggedinid><cfset classAccess=true></cfif>
</cfif>
<cfif session.loggedin and classAccess>
	<cfoutput><cflocation url="audioreserves.cfm?classid=#url.i#"></cfoutput>
<cfelse>
	<cflocation url="eresaccess.cfm">
</cfif>