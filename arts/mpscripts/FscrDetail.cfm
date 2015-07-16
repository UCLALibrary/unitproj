<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Film Scripts - Search Results</title>
</head>

<body>

<!--- All CF search stuff here --->

<CFSET ORIGSEARCHTERM=#SEARCHTERM#>

<!--- SQL query should ORDER BY TITLE --->
<CFQUERY NAME="qryOption1">
	<CFSWITCH EXPRESSION=#INDEX#>
		<CFCASE VALUE="TITLE"> <!--- use right & left truncation --->
			<CFSET SEARCHTERM="%" & #SEARCHTERM# & "%">
			SELECT * FROM #table#
			WHERE TITLE LIKE '#SEARCHTERM#' ORDER BY TITLE
		</cfcase>
		<CFCASE VALUE="RELCO"> <!--- use right & left truncation --->
			<CFSET SEARCHTERM=#SEARCHTERM#>
			SELECT * FROM #table# 
			WHERE RELCO LIKE '#SEARCHTERM#' ORDER BY TITLE
		</cfcase>
		<CFCASE VALUE="RELDATE">
			<CFSET SEARCHTERM=#SEARCHTERM#> <!--- require 4-digit dates (wildcards OK) --->
			SELECT * FROM #table# 
			WHERE RELDATE LIKE '#SEARCHTERM#' ORDER BY TITLE
		</cfcase>
		<CFCASE VALUE="WRITER"> <!--- use left & right truncation --->
			<CFSET SEARCHTERM="%" & #SEARCHTERM# & "%">
			SELECT * FROM #table# 
			WHERE (WRITER1 LIKE '#SEARCHTERM#') Or (WRITER2 LIKE '#SEARCHTERM#') Or (WRITER3 LIKE '#SEARCHTERM#') Or (WRITER4 LIKE '#SEARCHTERM#') 
			ORDER BY TITLE
		</cfcase>
	</cfswitch>
</cfquery>

<!--- HTML coding begins here --->

<H1 ALIGN="CENTER">UCLA Library Special Collections</h1>
<H2 ALIGN="CENTER">Collection of Motion Picture Scripts</h2>
<H3 ALIGN="CENTER">Collection 073</h3>
<p align="center"><a href="fscripts.cfm">Back to Search Screen</a></p>
<p align="center">Please see the <a href="http://www.library.ucla.edu/location/library-special-collections">UCLA Library Special Collections</a> web page for contact and service information on viewing scripts</p>
<br>
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
<CFSET strDATE=#DATE#>

<!--- set WRITERS variable --->
<CFIF #WRITER1# IS "">
	<!---do nuthin'--->
	<CFELSEIF #WRITER1# IS "?">
		<CFSET strWRITER="Writer unknown">
		<CFELSEIF #WRITER2# IS "">
			<CFSET strWRITER="Writer: " & UCASE(#WRITER1#)>
			<CFELSEIF #WRITER3# IS "">
				<CFSET strWRITER="Writers: " & UCASE(#WRITER1# & "; " & #WRITER2#)>
				<CFELSEIF #WRITER4# IS "">
					<CFSET strWRITER="Writers: " & UCASE(#WRITER1# & "; " & #WRITER2# & "; " & #WRITER3#)>
				<CFELSE>
					<CFSET strWRITER="Writers: " & UCASE(#WRITER1# & "; " & #WRITER2# & "; " & #WRITER3# & "; " & #WRITER4#)>
	</cfif>

<DL COMPACT>
<CFIF #RELDATE# IS "">
	<DT><B>#TITLE# (#RELCO#)</b>
	<CFELSE>
	<DT><B>#TITLE# (#RELCO#, #RELDATE#)</b>
</cfif>

	<CFIF #NOTES# IS "">
		<!---do nuthin'--->
		<CFELSE>
		<DD>Notes: #NOTES#
	</cfif>
	
	<CFIF #DATE_UNKNOWN# IS "?">
		<DD>Script date unknown.
		<DD>#strWRITER#
		<CFELSEIF #NO_DATE# IS "X">
		<DD>Undated script.
		<DD>#strWRITER#
		<CFELSE>
		<DD>Script dated: #DateFormat(strDATE, "mmm dd yyyy")#.
		<DD>#strWRITER#
	</cfif>

	<CFIF #SRLFBOXF# IS "0">
		<CFIF #LOCACOLL# IS "">
			<DD><B>Please contact Performing Arts Special Collections for availability of this item.</b>
		<CFELSE>
			<DD>Located in the <B>#LOCACOLL#</B> collection
		</CFIF>
	<CFELSE>
		<DD><B>Box #SRLFBOXF#</b> (refer to this number when requesting this item)
	</cfif>
</DL>
	
</cfoutput>

</body>
</html>
