<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>TV Movie Scripts - Search Results</title>
</head>

<body>
<CFSET ORIGSEARCHTERM=#SEARCHTERM#>

<!--- SQL query should ORDER BY TITLE --->
<CFQUERY NAME="qryOption1" DATASOURCE="arttvseries">

<CFSWITCH EXPRESSION=#INDEX#>
<CFCASE VALUE="SERTITLE">
	<CFSET SEARCHTERM="%" & #SEARCHTERM# & "%">
	SELECT TVSeries.SERTITLE, TVSeries.SORT, TVSeries.EPISODE, TVSeries.AUTHOR1, TVSeries.AUTHOR2, TVSeries.DRAFTDATE, TVSeries.NETWORK, TVSeries.AIRDATE, TVSeries.BOXNO 
	FROM TVSeries
	WHERE TVSeries.SERTITLE LIKE '#SEARCHTERM#' 
	ORDER BY TVSeries.SORT, TVSeries.SERTITLE, TVSeries.NETWORK, TVSeries.EPISODE
</cfcase>
<CFCASE VALUE="EPISODE"> 
	<CFSET SEARCHTERM="%" & #SEARCHTERM# & "%">
	SELECT TVSeries.SERTITLE, TVSeries.SORT, TVSeries.EPISODE, TVSeries.AUTHOR1, TVSeries.AUTHOR2, TVSeries.DRAFTDATE, TVSeries.NETWORK, TVSeries.AIRDATE, TVSeries.BOXNO 
	FROM TVSeries
	WHERE TVSeries.EPISODE LIKE '#SEARCHTERM#' 
	ORDER BY TVSeries.SORT, TVSeries.SERTITLE, TVSeries.EPISODE
</cfcase>
<CFCASE VALUE="WRITER"> <!--- use left & right truncation --->
	<CFSET SEARCHTERM="%" & #SEARCHTERM# & "%">
	SELECT SERTITLE, SORT, EPISODE, AUTHOR1, AUTHOR2, DRAFTDATE, NETWORK, AIRDATE, BOXNO 
	FROM TVSeries
	WHERE (AUTHOR1 LIKE '#SEARCHTERM#') Or (AUTHOR2 LIKE '#SEARCHTERM#') 
	ORDER BY SORT, SERTITLE, EPISODE
	</cfcase>
</cfswitch>
</cfquery>

<!--- HTML coding begins here --->

<H1 ALIGN="CENTER">UCLA Library Special Collections</h1>
<H2 ALIGN="CENTER">Television Series Script Collection</h2>
<H3 ALIGN="CENTER">Collection 081</h3>

<p align="center"><a href=" http://unitproj.library.ucla.edu/arts/tvseries/tvseries.cfm">Back to Search Screen</a></p>
<p align="center">Please see the <a href="http://www.library.ucla.edu/special-collections/home">UCLA Library Special Collections</a> web page for contact and service information on viewing scripts</p><br>
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

<cfoutput query="qryOption1" group="SERTITLE">
<CFSET strDATE=#DRAFTDATE#>
<DL COMPACT>
	<DT><b>#SERTITLE#</b>
		<CFOUTPUT>
		<CFIF #NETWORK# IS "">
		<CFELSE><DD>(#NETWORK#)
		</CFIF>
		<CFIF #EPISODE# IS "">
		<CFELSE><DD>#EPISODE#
		</CFIF>
<!---	<DL COMPACT>
		<DT><B>#SERTITLE# (#NETWORK#)</B>
		<CFIF #AIRDATE# IS "">
			<DD>#EPISODE#
		<CFELSE>
		<CFSET strAIRDATE=#DateFormat(AIRDATE,"mmm dd yyyy")#>
			<DD>#EPISODE# (Aired: #strAIRDATE#)
		</cfif>
</CFIF>--->

	<!--- <CFIF #DRAFTDATE# IS "">
			<DD>Undated script.
			<CFELSE>
			<DD>Script dated: #DateFormat(strDATE, "mmm dd yyyy")#.
	</cfif>--->
	
	<!--- set WRITERS variable --->
		<CFIF #AUTHOR1# IS "">
		<!---do nuthin'--->
			<CFELSEIF #AUTHOR2# IS "">
				<CFSET strWRITER="Writer: " & UCASE(#AUTHOR1#)>
				<DD>#strWRITER#
			<CFELSE>
				<CFSET strWRITER="Writers: " & UCASE(#AUTHOR1# & "; " & #AUTHOR2#)>
				<DD>#strWRITER#
		</cfif>

	<CFIF #BOXNO# EQ 0>
		<!--- do nuthin' --->
		<CFELSE>
		<DD><B>Box #NumberFormat(BOXNO)#</b> (refer to this number when requesting this item)<BR><BR>
	</cfif>

</CFOUTPUT>
</DL>
</cfoutput>


</body>
</html>
