<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>TV Movie Scripts - Search Results</title>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');   ga('create', 'UA-32672693-1', 'auto');  ga('send', 'pageview'); 
</script>	
</head>

<body>
<CFSET ORIGSEARCHTERM=#SEARCHTERM#>

<!--- SQL query should ORDER BY TITLE --->
<CFQUERY NAME="qryOption1">

<CFSWITCH EXPRESSION=#INDEX#>
<CFCASE VALUE="SERTITLE">
	<CFSET SEARCHTERM="%" & #SEARCHTERM# & "%">
	SELECT SERTITLE, SORT, EPISODE, AUTHOR1, AUTHOR2, DRAFTDATE, NETWORK, AIRDATE, BOXNO 
	FROM #table#
	WHERE SERTITLE LIKE '#SEARCHTERM#' 
	ORDER BY SORT, SERTITLE, NETWORK, EPISODE
</cfcase>
<CFCASE VALUE="EPISODE"> 
	<CFSET SEARCHTERM="%" & #SEARCHTERM# & "%">
	SELECT SERTITLE, SORT, EPISODE, AUTHOR1, AUTHOR2, DRAFTDATE, NETWORK, AIRDATE, BOXNO 
	FROM #table#
	WHERE EPISODE LIKE '#SEARCHTERM#' 
	ORDER BY SORT, SERTITLE, EPISODE
</cfcase>
<CFCASE VALUE="WRITER"> <!--- use left & right truncation --->
	<CFSET SEARCHTERM="%" & #SEARCHTERM# & "%">
	SELECT SERTITLE, SORT, EPISODE, AUTHOR1, AUTHOR2, DRAFTDATE, NETWORK, AIRDATE, BOXNO 
	FROM #table#
	WHERE (AUTHOR1 LIKE '#SEARCHTERM#') Or (AUTHOR2 LIKE '#SEARCHTERM#') 
	ORDER BY SORT, SERTITLE, EPISODE
	</cfcase>
</cfswitch>
</cfquery>

<!--- HTML coding begins here --->

<H1 ALIGN="CENTER">UCLA Library Special Collections</h1>
<H2 ALIGN="CENTER">Television Series Script Collection</h2>
<H3 ALIGN="CENTER">Collection 081</h3>

<p align="center"><a href="tvseries.cfm">Back to Search Screen</a></p>
<p align="center">Please see the <a href="http://www.library.ucla.edu/location/library-special-collections">UCLA Library Special Collections</a> web page for contact and service information on viewing scripts</p><br>
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
