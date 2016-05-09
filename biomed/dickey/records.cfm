<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Results</title>

	<cfif NOT IsDefined("type")>
		location.href="index.cfm"
	<cfelseif type IS "animal">
		<cfquery name="retrieve" datasource="biodickey">
			SELECT Subject1, Title5, Subject4, Title1
			FROM webtable
			WHERE (Subject1 = 'mammal') OR (Subject1 = 'bird') 
		</cfquery>
	<cfelse>
		<cfquery name="retrieve" datasource="biodickey">
			SELECT Subject1, Title5, Subject4, Title1, Title3
			FROM webtable
			WHERE Subject1 = '#type#' 
		</cfquery>
	</cfif>

	<style type="text/css">
	{
		a:link{text-decoration: none; color: green}
		a:hover{}
	}
	</style>
	
</head>

<body>

<cfinclude template="tablestart.html">

<th><cfoutput><h2>#type#</h2></cfoutput></th>
<br><br>
<cfoutput query="retrieve">
	<tr>	
	
		<cfif type IS 'geographic'>
			<td><a href="photo.cfm?id=#Subject4#">
				#Title3#
			</a></td>
		<cfelse>
			<td><a href="photo.cfm?id=#Subject4#">
				#Title5#<br>
				<i>#Title1#</i><br>
				</a>
			</td>
		</cfif>
		<td><a href="photo.cfm?id=#Subject4#">
		<img src="thumbnails/thumbnails/#Subject4#_JPG.jpg" border="0"></a></td>

	</tr>
</cfoutput>
</table>

</body>
</html>
