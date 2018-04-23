<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
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


		<script language="JavaScript">

	
			function checkcategory()
		{
			if (!(window.document.searchform.mammal.checked) && !(window.document.searchform.bird.checked) && !(window.document.searchform.geographic.checked))
			{
				alert("You must check which categories (mammal, bird, geographic) to search in.")
				return false;
			}
			return true;
		}
		
		function checkquery()
		{
		if (window.document.searchform.query.value.length < 3)
			{
				alert("The search term must be at least three characters long.");
				return false;
			}
			return true;
		}
		
		</script>
	
	
	<title>Search Results</title>

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
						AND (Title1 LIKE '%#query#%' OR Title5 LIKE '%#query#%' OR Title3 LIKE '%#query#%' OR Description LIKE '%#query#%' OR Subject3 LIKE '%#query#%' OR Date LIKE '%#query#%' OR Subject4 LIKE '%#query#%')
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
	
</head>

<body>
<cfinclude template="tablestart.html">
	<th align="center" colspan="4">
	<h3><br>Search the online photo archives</h3>
					<form name="searchform" action="search.cfm" method="GET" onsubmit="return checkcategory();">
						<input type="Text" name="query">&nbsp;&nbsp;
							<select type="list" name="searchtype">
								<option value="Identifier">search all fields</option>
								<option value="Title1">by Scientific Name</option>
								<option value="Title5">by Common Name</option>
								<option value="Title3">by Location</option>
								<option value="Description">by Description</option>
								<option value="Subject3">by Family</option>
								<option value="Date">by Date</option>
								<option value="Subject4">by Photo ID</option>
							</select>
							<br>in these categories: 
						<input type="checkbox" name="bird"> bird
						<input type="checkbox" name="mammal"> mammal
						<input type="checkbox" name="geographic"> geographic
						<br>
						<input type="submit" value="Search">
					</form>
					<hr width="50%">
				<cfoutput>
				<script language="Javascript">
				
				if ('#mammal#' == "on") 
				{
					window.document.searchform.mammal.checked=true;
				}
				if ('#bird#' == "on") 
				{
					window.document.searchform.bird.checked=true;
				}
				if ('#geographic#' == "on") 
				{
					window.document.searchform.geographic.checked=true;
				}
				</script>
				</cfoutput>
	</th>
	
	<cfoutput>	
	<tr>
		<td colspan="4" align="center">
			<cfif IsDefined("query")>
			<cfif IsDefined("searchtype")>
				Your search for "<b>#EncodeForHTML(oldquery)#</b>" 
				
					<u><cfswitch expression="#searchtype#">
						<cfcase value="Identifier">in all fields</cfcase>
						<cfcase value="Title1">by Scientific Name</cfcase>
						<cfcase value="Title5">by Common Name</cfcase>
						<cfcase value="Description">by Location</cfcase>
						<cfcase value="Subject3">by Family</cfcase>
						<cfcase value="Date">by Date</cfcase>
						<cfcase value="Subject4">by Photo ID</cfcase>
					</cfswitch></u> in categories:
			</cfif>
			</cfif>
			
			
			 <cfif mammal IS "on">
			 	<h2>Mammals</h2>
			 </cfif>
			 <cfif bird IS "on">
			 	<h2>Birds</h2>
			 </cfif>
			 <cfif geographic IS "on">
			 	<h2>People, Places, Camps, and Means of Transportation</h2>
			 </cfif>
			 
			<cfif results.recordcount IS 0 AND IsDefined("query")>
				returned no results.
					
			<cfelseif results.recordcount GT 0 AND IsDefined("query")>
				found #results.recordcount# result<cfif results.recordcount GT 1>s</cfif>: <br>&nbsp;
			
		</cfif>
		
		<hr width="50%">
		
			</td>
		</tr>

	</cfoutput>

	<cfif searchmode IS "columns">		
		<cfoutput>
			<cfif results.recordcount GT 0>
				<tr><td colspan="4" align="Left">
					<small>View these results as a list [<A href="search.cfm?query=#EncodeForHTML(oldquery)#&searchtype=#searchtype#&mammal=#mammal#&bird=#bird#&geographic=#geographic#">click here</a>]</small><br><br>
				</td></tr>
				<tr>
					<td><a href="search.cfm?query=#EncodeForHTML(oldquery)#&searchmode=columns&sort=Title3&searchtype=#searchtype#&mammal=#mammal#&bird=#bird#&geographic=#geographic#"><b>Location</b></a></td>
					<td><A href="search.cfm?query=#EncodeForHTML(oldquery)#&searchmode=columns&sort=Title1&searchtype=#searchtype#&mammal=#mammal#&bird=#bird#&geographic=#geographic#"><b>Scientific Name</b></a></td>
					<td><A href="search.cfm?query=#EncodeForHTML(oldquery)#&searchmode=columns&sort=Title5&searchtype=#searchtype#&mammal=#mammal#&bird=#bird#&geographic=#geographic#"><b>Common Name</b></a></td>
					<td><b>Image</b></td>
				</tr>
			</cfif>
		</cfoutput>		
		<cfoutput query="results">

		<tr>
			<td>
				<a href="photo.cfm?id=#Subject4#&query=#EncodeForHTML(oldquery)#&searchtype=#searchtype#&mammal=#mammal#&bird=#bird#&geographic=#geographic#">
					#Title3#
				</a>
			</td>
			<td>
				<a href="photo.cfm?id=#Subject4#&query=#EncodeForHTML(oldquery)#&searchtype=#searchtype#&mammal=#mammal#&bird=#bird#&geographic=#geographic#">
					<i>#Title1#</i>
				</a>
			</td>
			<td>
				<a href="photo.cfm?id=#Subject4#&query=#EncodeForHTML(oldquery)#&searchtype=#searchtype#&mammal=#mammal#&bird=#bird#&geographic=#geographic#">
					#Title5#
				</a>
			</td>
			
			<td>
				<a href="photo.cfm?id=#Subject4#&query=#EncodeForHTML(oldquery)#&searchtype=#searchtype#&mammal=#mammal#&bird=#bird#&geographic=#geographic#">
					<img src="thumbnails/thumbnails/#Subject4#_JPG.jpg" border="0">
				</a>
			</td>
		
		</tr>
		
	</cfoutput>
	<cfelse>
		<cfif results.recordcount GT 0>
			<cfoutput>
				<tr><td colspan="4">
					<small>Alternative Display Option: Sortable Columns [<A href="search.cfm?query=#EncodeForHTML(oldquery)#&searchmode=columns&searchtype=#searchtype#&mammal=#mammal#&bird=#bird#&geographic=#geographic#">click here</a>]</small><br>
				</td></tr>
			</cfoutput>
		</cfif>
	<cfoutput query="results" group="Subject1">

		<tr><td colspan="4"><font size="+2"><b>#Subject1#<cfif Subject1 IS NOT "Geographic">s</cfif></b></font></td>
		<cfoutput>
		<tr>
			<td width="15%">&nbsp;</td>
			
			<td>
				<a href="photo.cfm?id=#Subject4#&query=#EncodeForHTML(oldquery)#&searchtype=#searchtype#&mammal=#mammal#&bird=#bird#&geographic=#geographic#">
					<img src="thumbnails/thumbnails/#Subject4#_JPG.jpg" border="0" align="right">
				</a>
		
			<a href="photo.cfm?id=#Subject4#&query=#EncodeForHTML(oldquery)#&searchtype=#searchtype#&mammal=#mammal#&bird=#bird#&geographic=#geographic#">
				<cfif Subject1 IS NOT "geographic">
					#Title5#<br>
					<i>#Title1#</i><br>
				<cfelse>
					#Left(Description,50)#<cfif #Len(Left(Description,50))# LT #Len(Description)#>...</cfif><br>
				</cfif>
				#Title3#<br>
				#Date#
			</a></td>
			
			<td>&nbsp;</td>
			
			<td width="15%">&nbsp;</td>
		
		</tr>
		
		<tr>
			<td colspan="4"><hr width="75%"></td>
		</tr>
		</cfoutput>
	</cfoutput>
	</cfif>
	
	</table>
</body>
</html>
