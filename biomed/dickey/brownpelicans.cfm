<cfquery name="worldswork" datasource="biodickey" dbtype="ODBC">
SELECT *
FROM tblworldswork 
WHERE ID=#ID#
</cfquery>
<cfinclude template="header.cfm">
<link href="dickey.css" rel="stylesheet" type="text/css">
<cfoutput query="worldswork">
<table width="95%" border=0 align="center" cellpadding="4">
<tr>
<td align="left" valign="top">
<cfif #previous# IS ''>
<CFELSE>
<a href="#previous#" class="roll">Previous</a>

 |</cfif> <a href="#home#" class="roll">Home</a> 
 <cfif #next# IS ''>
<CFELSE>
 | <a href="#next#" class="roll">Next</a>
 </cfif>
 </td>
</tr>

<tr>
<td align="center">
<img src="#image#" border=0>
</td>
</tr>
<tr><td class="louise">#caption#</td></tr>
<tr><td class="louise2">&raquo;Wild Life of America: Photographs by Donald R. Dickey, The World's Work, Vol. 52, September, 1926. p. [558-566]</td></tr>
</table>
</cfoutput>
<cfinclude template="footer.cfm">