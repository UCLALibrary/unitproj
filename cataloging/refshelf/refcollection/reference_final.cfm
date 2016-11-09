<!--- whereQuery = whereQuery & URL.search_category & " LIKE &quot;" & myArrayList[i] & " %&quot; OR " & URL.search_category & " LIKE &quot;% " & myArrayList[i] & "&quot; OR " & URL.search_category & " LIKE &quot;% " & myArrayList[i] & " %&quot; OR " & URL.search_category & " LIKE &quot;" & myArrayList[i] & "&quot;)"; --->
<cfparam name="URL.sort" default="ASC" />
<cfparam name="URL.records_per_page" default="20" />
<cfparam name="URL.order_by" default="Title" />
<cfparam name="URL.search_category" default="Title" />
<cfparam name="URL.search_query" default="" />
<cfparam name="URL.StartRow" default="1" />
<cfparam name="URL.RecordsPerPage" default="10" />
<cfparam name="URL.location" default="ANY" />
<cfparam name="URL.date1" default="-1" />
<cfset nPreviousPage = URL.StartRow - URL.RecordsPerPage>
<cfset nNextPage = URL.StartRow + URL.RecordsPerPage>
<cfif nPreviousPage LT 1>
  <cfset nPreviousPage = 1>
</cfif>

<cfif IsDefined("URL.submit_button")>
<cfif URL.search_query EQ "" OR REFindNoCase("[a-z0-9?]",URL.search_query) EQ 0>
  <cflocation url="reference_final.cfm" />
</cfif>

<cfif URL.boolSearch NEQ "phrase">

	<cfset CommaDelimitedList = REreplace(URL.search_query, "[^0-9a-zA-Z?]", " ", "all")>
    <cfset CommaDelimitedList = replace(CommaDelimitedList, " ",",","all")> 
	<cfset CommaDelimitedList = replace(CommaDelimitedList, "?", "%","all")>

    <cfscript>
		myArrayList = ListToArray(CommaDelimitedList);
        nArrayLength = ArrayLen(myArrayList);
		whereQuery = "(";
	    for (i = 1; i LTE nArrayLength; i = i + 1) {
			whereQuery = whereQuery & URL.search_category & " LIKE &quot;" & myArrayList[i] & " %&quot; OR " & URL.search_category & " LIKE &quot;% " & myArrayList[i] & "&quot; OR " & URL.search_category & " LIKE &quot;% " & myArrayList[i] & " %&quot; OR " & URL.search_category & " LIKE &quot;" & myArrayList[i] & "&quot;)";
			if (i LT nArrayLength) whereQuery = whereQuery & " " & URL.boolSearch & " (";
		} // end for
		if (URL.location NEQ "ANY") whereQuery = whereQuery & " AND Location = &quot;" & URL.location & "&quot; ";
	  if (URL.date1 GT 0) {
	    switch (URL.dateLimit) {
	    case "eq": 
		  whereQuery = whereQuery & " AND nDate = " & URL.date1 & " ";
		  break;
		case "lt": 
		  whereQuery = whereQuery & " AND nDate < " & URL.date1 & " ";
		  break;
		case "gt": 
		  whereQuery = whereQuery & " AND nDate > " & URL.date1 & " ";
		  break;
		case "range":
		  if (URL.dateLimit GT 0) whereQuery = whereQuery & " AND nDate BETWEEN " & URL.date1 & " AND " & URL.date2 & " ";
	    } // end switch
	  } // end if
	</cfscript>
<cfelse>
	<!--- <cfset CommaDelimitedList = REreplace(URL.search_query, "[^0-9a-zA-Z?]", " ", "all")> 
	<cfset search_query = replace(URL.search_query, "?", "%","all")> --->
	
	<cfset search_query = REreplace(URL.search_query, "[^0-9a-zA-Z?]", " ", "all")>
    <cfset search_query = replace(search_query, " ","_","all")> 
	<cfset search_query = replace(search_query, "?", "%","all")>
	
    <cfscript>
		whereQuery = "";
		    whereQuery = "(" & whereQuery & URL.search_category & " LIKE &quot;" & search_query & " %&quot; OR " & URL.search_category & " LIKE &quot;% " & search_query & "&quot; OR " & URL.search_category & " LIKE &quot;% " & search_query & " %&quot; OR " & URL.search_category & " LIKE &quot;" & search_query & "&quot;)";
		if (URL.location NEQ "ANY") whereQuery = whereQuery & " AND Location = &quot;" & URL.location & "&quot; ";
	</cfscript>
</cfif>

  <cfset whereQuery = replace(whereQuery, '&quot;', "'", "all")>
  <cfquery datasource="#DSN#" name="qReference" cachedwithin="#CreateTimeSpan(0,0,5,0)#">
    SELECT Author, Date, nDate, Title, Location
    FROM reference
	WHERE #PreserveSingleQuotes(whereQuery)#
    ORDER BY #URL.order_by# #URL.sort#
  </cfquery>
</cfif>

<html>
<head>

<title>Reference Collection</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<!--- Debugging purposes only --->
<!---
<cfif IsDefined("URL.submit_button")>
 <cfoutput>#FORM.search_query#</cfoutput>
  <cfdump var="#qReference#">
 </cfif>
 --->
<!--- Debugging purposes only --->

<table border="1" width="100%" cellpadding="10" cellspacing="2" style="Font-size:12px">
  
  <tr>
    <td colspan="5" valign="middle" align="center"><font size="+3">UCLA Cataloging & Metadata Center Reference Collection Database</font></td>
  </tr>

  <tr>
    <td colspan="3">
	  Search: Use '?' as wildcard<br>
	  <form action="<cfoutput>#CGI.SCRIPT_NAME#</cfoutput>" method="get">
	    <input type="text" name="search_query" size="50">
		<select name="search_category">
		  <option value="Title">Title</option>
		  <option value="Author">Author</option>
		</select>
		<select name="location">
		  <option value="ANY" <cfif URL.location EQ "ANY">selected</cfif>>ANY LOCATION
		<cfquery datasource="#DSN#" name="qRefLocation" cachedwithin="#CreateTimeSpan(0,0,30,0)#">
  		SELECT DISTINCT Location
  		FROM CatCenterRef
		</cfquery>
		  <cfoutput query="qRefLocation">
		  <option value="#qRefLocation.Location#" <cfif URL.location EQ #qRefLocation.Location#>selected</cfif>>#qRefLocation.Location#
		  </cfoutput>
		</select>
		<br>
	    <input type="radio" name="boolSearch" value="AND" checked>AND
		<input type="radio" name="boolSearch" value="OR">OR
		<input type="radio" name="boolSearch" value="phrase">as a phrase
		<br><br>
		Date: (optional)
		<input type="text" name="date1" value="" size="5">
		<input type="radio" name="dateLimit" value="eq" checked>equals
		<input type="radio" name="dateLimit" value="lt">before
		<input type="radio" name="dateLimit" value="gt">after
		<input type="radio" name="dateLimit" value="range">between
		<input type="text" name="date2" value="" size="5">
		<br><br>
		<input type="submit" name="submit_button" value="Search"">
	  </form>
	 </td>
		 

   <cfif IsDefined("URL.submit_button")>

	 <cfoutput>
	 <td colspan="2" valign="top">
 
		Search query: 	
		  #URL.search_query#<br>
		  #qReference.RecordCount# Result<cfif #qReference.RecordCount# NEQ 1>s</cfif>
     </td>
	 </cfoutput>
  </tr>
    
  <tr>
  
  <cfif IsDefined("URL.submit_button") AND qReference.RecordCount GT 0>
    <td align="center" colspan="5">
<!--- 	  NAVIGATION GOES HERE   --->
	<cfoutput>
	  <form action="#CGI.SCRIPT_NAME#" method="get" name="Records">
	    Records per page: 
		<select name="RecordsPerPage" onChange="document.forms.Records.submit();">
		  <option value="10" <cfif #URL.RecordsPerPage# EQ 10>selected</cfif>>10</option>
		  <option value="25" <cfif #URL.RecordsPerPage# EQ 25>selected</cfif>>25</option>
		  <option value="50" <cfif #URL.RecordsPerPage# EQ 50>selected</cfif>>50</option>
		  <option value="100" <cfif #URL.RecordsPerPage# EQ 100>selected</cfif>>100</option>
		</select>
		<input type="hidden" name="search_query" value="#URL.search_query#">
		<input type="hidden" name="search_category" value="#URL.search_category#">
		<input type="hidden" name="order_by" value="#URL.order_by#">
		<input type="hidden" name="sort" value="#URL.sort#">
		<input type="hidden" name="submit_button" value="#URL.submit_button#">
		<input type="hidden" name="boolSearch" value="#URL.boolSearch#">
		<input type="hidden" name="location" value="#URL.location#">
		<input type="hidden" name="dateLimit" value="#URL.dateLimit#">
		<input type="hidden" name="date1" value="#URL.date1#">
		<input type="hidden" name="date2" value="#URL.date2#">
	  </form>
	  </cfoutput>
	  
      Displaying <cfoutput>#URL.StartRow#</cfoutput> to <cfif (#URL.StartRow# + #URL.RecordsPerPage#) LT #qReference.RecordCount#><cfoutput>#(URL.StartRow + URL.RecordsPerPage - 1)#</cfoutput>
	  <cfelse><cfoutput>#qReference.RecordCount#</cfoutput> 
	  </cfif>
	  of <cfoutput>#qReference.RecordCount#.</cfoutput><br>
	  
	  <cfif URL.StartRow NEQ 1>
	  <cfoutput>
	  <a href="#CGI.SCRIPT_NAME#?search_category=#URL.search_category#&search_query=#URL.search_query#&sort=#URL.sort#&order_by=#URL.order_by#&submit_button=#URL.submit_button#&StartRow=#nPreviousPage#&RecordsPerPage=#URL.RecordsPerPage#&boolSearch=#URL.boolSearch#&location=#URL.location#&dateLimit=#URL.dateLimit#&date1=#URL.date1#&date2=#URL.date2#">
	  <img src="images/prev.gif" border="0"></a>
	  </cfoutput>
	  </cfif>
	  
	  <cfif nNextPage LT qReference.RecordCount>
	  <cfoutput>
	  <a href="#CGI.SCRIPT_NAME#?search_category=#URL.search_category#&search_query=#URL.search_query#&sort=#URL.sort#&order_by=#URL.order_by#&submit_button=#URL.submit_button#&StartRow=#nNextPage#&RecordsPerPage=#URL.RecordsPerPage#&boolSearch=#URL.boolSearch#&location=#URL.location#&dateLimit=#URL.dateLimit#&date1=#URL.date1#&date2=#URL.date2#">
	  <img src="images/next.gif" border="0">
	  </a>
	  </cfoutput>
      </cfif>
	</td>
  </tr>
  
  <cfoutput>
  <tr>
    <td align="center"><strong>No.</strong></td>
	<td align="center"><strong>Author</strong> <a href="#CGI.SCRIPT_NAME#?search_category=#URL.search_category#&search_query=#URL.search_query#&sort=ASC&order_by=Author&submit_button=#URL.submit_button#&StartRow=#URL.StartRow#&RecordsPerPage=#URL.RecordsPerPage#&boolSearch=#URL.boolSearch#&location=#URL.location#&dateLimit=#URL.dateLimit#&date1=#URL.date1#&date2=#URL.date2#"><img src="images/asc.gif" border="0"></a> 
	         <a href="#CGI.SCRIPT_NAME#?search_category=#URL.search_category#&search_query=#URL.search_query#&sort=DESC&order_by=Author&submit_button=#URL.submit_button#&StartRow=#URL.StartRow#&RecordsPerPage=#URL.RecordsPerPage#&boolSearch=#URL.boolSearch#&location=#URL.location#&dateLimit=#URL.dateLimit#&date1=#URL.date1#&date2=#URL.date2#"><img src="images/desc.gif" border="0"></a>
	</td>
	<td align="center"><strong>Title</strong> <a href="#CGI.SCRIPT_NAME#?search_category=#URL.search_category#&search_query=#URL.search_query#&sort=ASC&order_by=Title&submit_button=#URL.submit_button#&StartRow=#URL.StartRow#&RecordsPerPage=#URL.RecordsPerPage#&boolSearch=#URL.boolSearch#&location=#URL.location#&dateLimit=#URL.dateLimit#&date1=#URL.date1#&date2=#URL.date2#"><img src="images/asc.gif" border="0"></a> 
	          <a href="#CGI.SCRIPT_NAME#?search_category=#URL.search_category#&search_query=#URL.search_query#&sort=DESC&order_by=Title&submit_button=#URL.submit_button#&StartRow=#URL.StartRow#&RecordsPerPage=#URL.RecordsPerPage#&boolSearch=#URL.boolSearch#&location=#URL.location#&dateLimit=#URL.dateLimit#&date1=#URL.date1#&date2=#URL.date2#"><img src="images/desc.gif" border="0"></a>
	</td>
	<td align="center"><strong>Date</strong> <a href="#CGI.SCRIPT_NAME#?search_category=#URL.search_category#&search_query=#URL.search_query#&sort=ASC&order_by=nDate&submit_button=#URL.submit_button#&StartRow=#URL.StartRow#&RecordsPerPage=#URL.RecordsPerPage#&boolSearch=#URL.boolSearch#&location=#URL.location#&dateLimit=#URL.dateLimit#&date1=#URL.date1#&date2=#URL.date2#"><img src="images/asc.gif" border="0"></a> 
	         <a href="#CGI.SCRIPT_NAME#?search_category=#URL.search_category#&search_query=#URL.search_query#&sort=DESC&order_by=nDate&submit_button=#URL.submit_button#&StartRow=#URL.StartRow#&RecordsPerPage=#URL.RecordsPerPage#&boolSearch=#URL.boolSearch#&location=#URL.location#&dateLimit=#URL.dateLimit#&date1=#URL.date1#&date2=#URL.date2#"><img src="images/desc.gif" border="0"></a>
	</td>
	<td align="center"><strong>Location</strong> <a href="#CGI.SCRIPT_NAME#?search_category=#URL.search_category#&search_query=#URL.search_query#&sort=ASC&order_by=Location&submit_button=#URL.submit_button#&StartRow=#URL.StartRow#&RecordsPerPage=#URL.RecordsPerPage#&boolSearch=#URL.boolSearch#&location=#URL.location#&dateLimit=#URL.dateLimit#&date1=#URL.date1#&date2=#URL.date2#"><img src="images/asc.gif" border="0"></a> 
	         <a href="#CGI.SCRIPT_NAME#?search_category=#URL.search_category#&search_query=#URL.search_query#&sort=DESC&order_by=Location&submit_button=#URL.submit_button#&StartRow=#URL.StartRow#&RecordsPerPage=#URL.RecordsPerPage#&boolSearch=#URL.boolSearch#&location=#URL.location#&dateLimit=#URL.dateLimit#&date1=#URL.date1#&date2=#URL.date2#"><img src="images/desc.gif" border="0"></a>
	</td>
  </tr>
  </cfoutput>
  
  <cfoutput query="qReference" startrow="#URL.StartRow#" maxrows="#URL.RecordsPerPage#">
  <tr>
    <td width="5%" align="center">#qReference.CurrentRow#</td>
	<td width="25%">#qReference.Author#</td>
	<td width="50%">#qReference.Title#</td>
	<td width="10%" align="center">#qReference.Date#</td>
	<td width="10%" align="center">#qReference.Location#</td>
  </tr>
  </cfoutput>
  
  </cfif>
</cfif>
</table>

</body>
</html>
