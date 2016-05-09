<cfquery name="martinjohnson" datasource="biodickey" dbtype="ODBC">
SELECT * 
FROM martinjohnson 
WHERE ID = #ID#
</cfquery>
<cfinclude template="header.cfm">
<link href="../../../dickey.css" rel="stylesheet" type="text/css">
<cfoutput query="martinjohnson">
<table border=0>
<tr>
<td align="left">
<a href="moose.cfm" class="roll">Previous</a> | <a href="../../../martinjohnson.cfm" class="roll">Home</a> | <a href="chipmunk.cfm" class="roll">Next</a></td>
</tr>

<tr>
<td align="center">
<br>
<img src="#image#" border=0>
</td>
</tr>
</table>
</cfoutput>
<cfinclude template="footer.cfm">