<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Motion Picture Stills - Search Results</title>
</head>

<body>
<CFSET ORIGSEARCHTERM=#SEARCHTERM#>

<!--- SQL query should ORDER BY TITLE --->
<CFQUERY NAME="qryOption1">

	<CFSWITCH EXPRESSION=#INDEX#>
		<CFCASE VALUE="TITLE"> <!--- use right & left truncation --->
			<CFSET SEARCHTERM="%" & #SEARCHTERM# & "%">
			SELECT * FROM #table#
			WHERE TITLE LIKE '#SEARCHTERM#' ORDER BY TITLE
		</cfcase>
		<CFCASE VALUE="RELEASE_CO"> <!--- use right & left truncation --->
			<CFSET SEARCHTERM="%" & #SEARCHTERM# & "%">
			SELECT * FROM #table#
			WHERE RELEASE_CO LIKE '#SEARCHTERM#' ORDER BY TITLE
		</cfcase>
	</cfswitch>
</cfquery>

<!--- HTML coding begins here --->

<H1 ALIGN="CENTER">UCLA Library Special Collections</h1>
<H2 ALIGN="CENTER">Collection of Motion Picture Stills</h2>
<H3 ALIGN="CENTER">Collection 195</h3>
<p align="center"><a href="mpstills.cfm">Back to Search Screen</a></p>
<p align="center">Please see the <a href="http://www.library.ucla.edu/location/library-special-collections">UCLA Library Special Collections</a> web page for contact and service information on viewing stills</p><br>
<br>
<br>
<CFOUTPUT>
  <CFSET rec_count = #qryOption1.RecordCount#>
  <CFIF rec_count IS 1>
    <CFSET rec_count_word = "time">
  <CFELSE>
    <CFSET rec_count_word = "times">
  </CFIF>
  "<STRONG>#UCASE(ORIGSEARCHTERM)#</STRONG>" appears #rec_count# #rec_count_word#:
  <BR><BR>
</CFOUTPUT>

<br>

<CFOUTPUT QUERY="qryOption1">

<DL COMPACT>
<DT><B>#UCase(TITLE)#</B>
<CFIF #RELEASE_YR# IS "" AND #RELEASE_CO# IS "">
	<!--- do nothing --->
	<CFELSEIF #RELEASE_YR# IS "" OR #RELEASE_YR# IS "n.d." OR #RELEASE_YR# IS "no date" AND #RELEASE_CO# IS NOT "">
		&nbsp;<B>(#RELEASE_CO#)</b>
	<CFELSEIF #RELEASE_YR# IS NOT "" AND #RELEASE_CO# IS "">
<!--- 		<CFSET strRELEASE_YR=#DateFormat(RELEASE_YR,"yyyy")#> --->
		&nbsp;<B>(#RELEASE_YR#)</B>
	<CFELSE>
<!--- 		<CFSET strRELEASE_YR=#DateFormat(RELEASE_YR,"yyyy")#> --->
		&nbsp;<B>(#RELEASE_CO#, #RELEASE_YR#)</b>
</cfif>

	
	
	<CFIF #MPS_NUMBER# IS "">
		<!--- do nuthin' --->
		<CFELSE>
		<DD><B>Box #Box#, Folder #MPS_NUMBER#</b>  (you will need this box and folder number to request the item) 
	</cfif>
</DL>
	
</cfoutput>


</body>
</html>
