<!--- ITEM CAPTIONS --->
<!--- requires "caption"; provides "cpt"; "cpt1" --->

<cfset cpt1="">
<cfif volume is not "">
	<cfset cpt1 = cpt1 & "Volume " & volume>
</cfif>
<cfif disc is not "">
	<cfset cpt1 = cpt1 & " Disc " & disc>
</cfif>
<cfif side is not "">
	<cfset cpt1 = trim(cpt1 & " Side " & side)>
</cfif>
<cfif track is not "">
	<cfset cpt1 = trim(cpt1 & " Track " & track)>
</cfif>
<cfif caption is not "">
	<cfset cpt=caption>
<cfelse>
	<cfset cpt=cpt1>
</cfif>
