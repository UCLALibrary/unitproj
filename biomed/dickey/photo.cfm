<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Individual Record</title>
	
	<LINK REL="stylesheet" TYPE="text/css" HREF="../css/dickey.css" TITLE="style">
	
	
	<!--preliminary variable setting-->
	<cfif IsDefined("mammal")><cfif mammal IS "on">
		<cfset mammal="on">
		<cfelse>
		<cfset mammal="off">
	</cfif><cfelse><cfset mammal="off"></cfif>
		<cfif IsDefined("bird")><cfif bird IS "on">
		<cfset bird="on">
		<cfelse>
		<cfset bird="off">
	</cfif><cfelse><cfset bird="off"></cfif>
		<cfif IsDefined("geographic")><cfif geographic IS "on">
		<cfset geographic="on">
		<cfelse>
		<cfset geographic="off">
	</cfif><cfelse><cfset geographic="off"></cfif>

		<cfif NOT IsDefined("query") AND (NOT IsDefined("mammal") OR NOT IsDefined("bird") OR NOT IsDefined("geographic"))>
			<!--previously a javascript redirect-->
		<cfelseif IsDefined("query")>
			<cfset oldquery=#query#>
		<cfelse>
			<cfset oldquery="">
		</cfif>
		
	<cfif NOT IsDefined("searchmode")>
		<cfset searchmode="normal">
	</cfif>
	
	<cfif NOT IsDefined("searchtype")>
		<cfset searchtype="Identifier">
	</cfif>
	
	
		<cfquery name="results" datasource="biodickey">
		SELECT Identifier, Subject4, Subject1, Title1, Title5, Title3, Date, Description
		FROM webtable
		WHERE ((NOT Subject4=Subject4) 
		<cfif bird IS "on">
			OR Subject1='bird'
			</cfif>
		<cfif mammal IS "on">
			OR Subject1='mammal'
			</cfif>
		<cfif geographic IS "on">
			OR Subject1='geographic'
			</cfif>
		)
		
		
		<cfif IsDefined("query")>
				<cfif #searchtype# IS "Identifier">
					<cfloop list="#query#" INDEX="query" Delimiters=" ">
						AND (Title1 LIKE '%#query#%' OR Title5 LIKE '%#query#%' OR Title3 LIKE '%#query#%' OR Description LIKE '%#query#%' OR Subject3 LIKE '%#query#%' OR Date LIKE '%#query#%')
					</cfloop>
				<cfelse>
					<cfloop list="#query#" INDEX="query" Delimiters=" ">
						AND (#searchtype# LIKE '%#query#%')
					</cfloop>
				</cfif>
				<cfif NOT IsDefined("sort") AND searchmode IS "columns">
					ORDER BY #searchtype#
				</cfif>
		</cfif>
		
		<cfif searchmode IS "normal">
			ORDER BY Subject1
				<cfif searchtype IS NOT "Description">
				, #searchtype# 
				<cfelseif searchtype IS "Description">
				, Title5
				</cfif>
			<cfelseif IsDefined("sort")>ORDER BY #sort#
		</cfif>		
		
		
	</cfquery>
	
	
	<!--fill list (for "next" and "previous" buttons on photo.cfm)-->
	
	<cfset photolist = ValueList(results.Subject4)>
	
	<!--end list-->
	
	
	<cfif NOT IsDefined("id")>
		<script language="JavaScript">
			location.href="index.cfm"
		</script>
	</cfif>
	
	<cfquery name="therecord" datasource="biodickey">
		SELECT Identifier, Subject1, Subject2, Subject3, Subject4, 
		Title1, Title2, Title3, Title4, Title5, Creator, Contributor, Description,
	 	Date, Rights, Image
		FROM webtable
		WHERE Subject4='#id#'
	</cfquery>
	
	<style type="text/css">
		td{align: left; valign: top}
	</style>
</head>

<body>
<cfoutput query="therecord">

<cfinclude template="tablestart.html">

<tr>
	
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td rowspan="9" valign="middle"><br>
		<img src="images/#identifier#"><br>
		<center><a href="mailform.cfm" class="smlsans">Use and Reproduction of images</a></center>
	</td>
</tr>
<cfif Subject1 IS NOT "geographic">
	<tr><td valign="top"><cfif Title5 IS NOT "">Common name:</cfif></td><td valign="top">#Title5#</td></tr>
	<tr><td valign="top"><cfif Title1 IS NOT "">Scientific name:</cfif></td><td valign="top"><i>#Title1#</i></td></tr>
	<tr><td valign="top"><cfif Subject3 IS NOT "">Family name:</cfif></td><td valign="top">#Subject3#</td></tr>
<cfelse>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
</cfif>
<tr><td valign="top">Description: </td><td valign="top">#Description#</td></tr>
<tr><td valign="top">Location:</td> <td valign="top">#Title3#</td></tr>
<tr><td valign="top">Date taken:</td><td valign="top">#Date#</td></tr>
<tr><td valign="top">Image ID:</td><td valign="top">#Subject4#</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<!--extra row to balance top empty row-->
<tr><td colspan="2"><cfif ListFind(photolist,Subject4) GT 1><a href="photo.cfm?id=#ListGetAt(photolist,ListFind(photolist,Subject4)-1)#&query=#oldquery#&searchtype=#searchtype#&mammal=#mammal#&bird=#bird#&geographic=#geographic#"><img src="previous.gif" alt="Previous Image" border=0></a></cfif></td><td align="right"><cfif ListFind(photolist,Subject4)+1 LTE ListLen(photolist)><a href="photo.cfm?id=#ListGetAt(photolist,ListFind(photolist,Subject4)+1)#&query=#oldquery#&searchtype=#searchtype#&mammal=#mammal#&bird=#bird#&geographic=#geographic#"><img src="next.gif" alt="Next Image" border=0></a></cfif></td></tr>


</table>
<br><br>
<a href="search.cfm?#Subject1#=on&searchtype=Identifier">Browse #Subject1# photo listings</a><br>
<a href="search.cfm?query=#oldquery#&searchtype=#searchtype#&mammal=#mammal#&bird=#bird#&geographic=#geographic#">Back to the results page</a>
</cfoutput>


</body>
</html>
