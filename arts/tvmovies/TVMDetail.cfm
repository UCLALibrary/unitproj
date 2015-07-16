<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>TV Movie Scripts - Search Results</title>
</head>

<body>
<CFSET ORIGSEARCHTERM=#SEARCHTERM#>

<!--- SQL query should ORDER BY TITLE --->
<CFQUERY NAME="qryOption1">

	<CFSWITCH EXPRESSION=#INDEX#>
		<CFCASE VALUE="TITLE"> <!--- use right & left truncation --->
			<CFSET SEARCHTERM="%" & #SEARCHTERM# & "%">
			SELECT * FROM #table# 
			WHERE TITLE LIKE '#SEARCHTERM#' 
			ORDER BY TITLE
		</cfcase>
		<CFCASE VALUE="WRITER"> <!--- use left & right truncation --->
			<CFSET SEARCHTERM="%" & #SEARCHTERM# & "%">
			SELECT * FROM #table# 
			WHERE (WRITER1 LIKE '#SEARCHTERM#') Or (WRITER2 LIKE '#SEARCHTERM#')
			ORDER BY TITLE
		</cfcase>
	</cfswitch>
</cfquery>

<!--- HTML coding begins here --->

<H1 ALIGN="CENTER">UCLA Performing Arts Library Special Collections</h1>
<H2 ALIGN="CENTER">TV Movie Script Collection</h2>
<H3 ALIGN="CENTER">Collection 074</h3>
<p align="center"><a href=" tvmscripts.cfm">Back to Search Screen</a></p>
<p align="center">Please see the <a href="http://www.library.ucla.edu/location/library-special-collections">Performing Arts Special Collections</a> web page for contact and service information on viewing scripts</p><br>
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
<CFSET strDATE=#SCRDATE#>

<DL COMPACT>
<DT><B>#TITLE#</B>
<CFIF #AIRDATE# IS "" AND #NETWORK# IS "">
	<!--- do nothing --->
	<CFELSEIF #AIRDATE# IS "" AND #NETWORK# IS NOT "">
		&nbsp;<B>(#NETWORK#)</b>
	<CFELSEIF #AIRDATE# IS NOT "" AND #NETWORK# IS "">
		<CFSET strAIRDATE=#DateFormat(AIRDATE,"yyyy")#>
		&nbsp;<B>(#strAIRDATE#)</B>
	<CFELSE>
		<CFSET strAIRDATE=#DateFormat(AIRDATE,"yyyy")#>
		&nbsp;<B>(#NETWORK#, #strAIRDATE#)</b>
</cfif>

	<CFIF #MINISERIES# IS "">
		<!---do nuthin'--->
		<CFELSE>
		<DD>Miniseries
	</cfif>
	
	<CFIF #SCRDATE# IS "">
		<CFELSE>
		<DD>Script dated: #DateFormat(strDATE, "mmm dd yyyy")#.
	</cfif>
	
<!--- set WRITERS variable --->
	<CFIF #WRITER1# IS "">
	<!---do nuthin'--->
		<CFELSEIF #WRITER2# IS "">
			<CFSET strWRITER="Writer: " & UCASE(#WRITER1#)>
			<DD>#strWRITER#
		<CFELSE>
			<CFSET strWRITER="Writers: " & UCASE(#WRITER1# & "; " & #WRITER2#)>
			<DD>#strWRITER#
	</cfif>

	<CFIF #SRLFBOXT# IS "">
		<!--- do nuthin' --->
		<CFELSE>
		<DD><B>Box #SRLFBOXT#</b> (refer to this number when requesting this item)
	</cfif>
</DL>
	
</cfoutput>


</body>
</html>
