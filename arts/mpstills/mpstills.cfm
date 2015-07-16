<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Search Motion Picture Stills Collection</title>
</head>

<body>
<BODY onLoad="window.document.SEARCHFORM.TITLE.focus();">

<H1 ALIGN="CENTER">Collection of Motion Picture Stills</h1>
<H2 ALIGN="CENTER">(Collection 195)</h2>
<h3 align="center"><A HREF="http://www.library.ucla.edu/location/library-special-collections">UCLA Library Special Collections</A></h3>
<BR>
<BR>

<!--- Search engine code --->
<P>
Select an index, enter a single word or phrase, and click on SEARCH.</P>
<FORM METHOD=POST NAME="SEARCHFORM" ACTION="MPStillsDetail.cfm">
<TABLE>

<TR><TH ALIGN=LEFT>Index</TH><TH ALIGN=LEFT>Search term (word/phrase)</TH></TR>

<TR>
<TD><SELECT NAME="INDEX">
  <OPTION VALUE="TITLE">Title</OPTION>
  <OPTION VALUE="RELEASE_CO">Release Company</OPTION>
  </SELECT>
</TD>
<TD><INPUT TYPE=TEXT SIZE=40 MAXLENGTH=40 NAME="SEARCHTERM">
</TD>
<TD>
<INPUT TYPE=SUBMIT VALUE="Search">
</TD>
<TD>
<INPUT TYPE=RESET VALUE="Reset">
</TD>
</TR>
</TABLE>
<BR>
<BR>
<P>



<!--- Help section --->
<P>
<H3 ALIGN="CENTER">Search Help</h3>
This web-based interface allows you to search the finding aid for the Collection of Motion Picture Stills held by the UCLA Library Special Collections. The collection is arranged by film title only and does not include credit information (for example, you can not search by an individual's name). The collection contains over 10,000 titles, but does not contain links to electronic images. Please see the <A HREF="http://www.library.ucla.edu/location/library-special-collections">UCLA Library Special Collections</a> web page for contact and service information on viewing stills.
See below for help on <A HREF="#SEARCH TERMS">searching</a>, <A HREF="#WILDCARDS">wildcards</A>, and <A HREF="#INDEX">indexes</A>.
</P>


<A NAME="SEARCH TERMS"></a>
<STRONG>Searching the Motion Picture Stills Collection</STRONG>
<BR><BR>
<P><UL>
	<LI>Its recommended that you search by film title as release company information may be unavailable or recorded in an abbreviated form.
	<LI><B>All results are sorted by film title.</B>
	<LI>You may enter a single word or phrase. </LI>
	<LI>To search for non-adjacent words in a title, use the "%" wildcard between the terms (e.g., GONE % WIND). </LI>
	<LI>Searches are <B>not</B> case-sensitive. </LI>
	<LI>Boolean searching is not supported. </LI>
	<LI><B>Title</B> searches have an automatic left and right truncation, so a single word search will produce results with that term anywhere within the field, including within a word (e.g., RAIN will return RAIN, RAINING, BRAIN, GRAIN, TRAIN,etc.).</LI>
	<LI><B>Release Company</B> searches have an automatic left and right truncation, so a single word search will produce results with that term anywhere within the field, including within a word (e.g., PICTURES will return TRISTAR PICTURES, BUENA VISTA PICTURES, MAGNA PICTURES, etc.).</LI>
</UL>
</P>

<P>
<A NAME="WILDCARDS"></a>
<STRONG>Wildcards</STRONG>
<BR><BR>
<UL>
	<LI><STRONG>_ (underscore)</STRONG> replaces any single alphanumeric character.<br>
	<i>Example:</i> a search for <b>"T_N"</b> will retrieve TIN, TAN, TEN, TON, etc.</LI>
	<LI><STRONG>% (percent)</STRONG> replaces any number of characters in the search term or phrase.<br>
	<i>Example:</i> searching for <STRONG>"RAIN%"</STRONG> using the title index will retrieve all titles containing the search term, even if it is within a word (e.g., RAIN, RAINING, RAINED, RAINS, etc.)<br>
	<i>Example:</i> searching for <b>"GONE % WIND"</b> using the title index will return GONE WITH THE WIND.</LI>
</UL>
</P>

<P>
<A NAME="INDEXES"></a>
<STRONG>About the Indexes</STRONG>
</P>
<p><B>Title:</B> Searches the <i>Title</i> field using left and right truncation to find the occurrence of the search term anywhere within the field, including within words.<br>
	<DIR><i>Example:</i> entering the word "RAIN" will retrieve: 
		<DIR>Black Rain <BR>
		Throw Mama From The Train <BR>
		Rain Man <BR>
		</DIR>
	</DIR>
</P>
<BR>
<P><b>Release Company:</b> Searches the <i>Release Company</i> field using left and right truncation to find the occurrence of the search term anywhere within the field, including within words.<br> 
	<DIR><i>Example:</i> entering "RKO" will retrieve: 
		<DIR>Disney/RKO<BR>
		RKO/Paramount<BR>
		RKO Pictures<BR>
		</DIR>
	</DIR>
</P>



<BR><BR>
<H4 ALIGN="CENTER">Return to <A HREF="http://www.library.ucla.edu/location/library-special-collections">UCLA Library Special Collections</A></h4>

<P ALIGN="CENTER">
<FONT SIZE="-1">(&copy; 2014 UC Regents; UCLA Library Special Collections http://www.library.ucla.edu/location/library-special-collections;
Last updated: 30 June 2014)</FONT></p>
</body>
</html>
