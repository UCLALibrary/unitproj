<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Search TV Series Scripts Collection</title>
</head>

<body>
<BODY onLoad="window.document.SEARCHFORM.TITLE.focus();">
<BR>
<BR>

<H1 ALIGN="CENTER">Collection of Television Series Scripts</h1>
<H2 ALIGN="CENTER">(Collection 081)</h2>
<h3 align="center"><A HREF="http://www.library.ucla.edu/special-collections/home">UCLA Library Special Collections</A></h3>

<BR>
<BR>

<!--- Search engine code --->
<P>
Select an index, enter a single word or phrase, and click on SEARCH.</P>
<FORM METHOD=POST NAME="SEARCHFORM" ACTION="TVSeriesDetail.cfm">
<TABLE>

<TR><TH ALIGN=LEFT>Index</TH><TH ALIGN=LEFT>Search term (word/phrase)</TH></TR>

<TR>
<TD><SELECT NAME="INDEX">
  <OPTION VALUE="SERTITLE">Series</OPTION>
  <OPTION VALUE="EPISODE">Episode Title</OPTION>
  <OPTION VALUE="WRITER">Script Writer</OPTION>
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
This web-based interface allows you to search the finding aid for the Collection of Television Series Scripts held by the UCLA Performing Arts Special Collections. The finding aid contains over episodes from over 1,900 television series, but <b>does not contain links to electronic versions of scripts</b>. Please see the <A HREF="http://www.library.ucla.edu/special-collections/home">UCLA Library Special Collections</a> web page for contact and service information on viewing scripts.
See below for help on <A HREF="#SEARCH TERMS">searching</a>, <A HREF="#WILDCARDS">wildcards</A>, and <A HREF="#INDEX">indexes</A>.
</P>




<A NAME="SEARCH TERMS"></a>
<STRONG>Searching the Television Series  Script</STRONG>
<BR><BR>
<P><UL>
	<LI><B>All results are sorted by television series title.</B>
	<LI>You may enter a single word or phrase. </LI>
	<li>Not all the records include an entry for script writers.</li>
	<li>If you are certain of a writer's name, enter the last name first followed by a comma and the firstname.</li>  
	<LI>To search for non-adjacent words in a title, use the "%" wildcard between the terms (e.g., GONE % WIND). </LI>
	<LI>Searches are <B>not</B> case-sensitive. </LI>
	<LI>Boolean searching (and, or, not) is not supported. </LI>
	<LI><B>All</B> searches have automatic left and right truncation, so a single word search will produce results with that term anywhere within the field, including within a word (e.g., RAIN will return RAIN, RAINING, BRAIN, GRAIN, TRAIN,etc.).</LI>
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
	<i>Example:</i> searching for <STRONG>"RAIN%"</STRONG> using the title index will retrieve all scripts containing the search term, even if it is within a word (e.g., RAIN, RAINING, RAINED, RAINS, etc.)<br>
	<i>Example:</i> searching for <b>"MAN % HAT"</b> using the title index will return THE MAN WITH THE GOLDEN HAT.</LI>
</UL>
</P>

<A NAME="INDEXES"></a>
<STRONG>About the Indexes:</STRONG>
</P>
<p><B>Series</B> Searches the <i>Series</i> field using left and right truncation to find the occurrence of the search term anywhere within the field, including within words.<br>
	<DIR><i>Example:</i> entering the word "ALL" will retrieve: 
		<DIR>All in the Family<BR>
		Ally McBeal <BR>
		Open All Night<BR>
		</DIR>
	</DIR>
</P>

</P>
<p><B>Episode Title</B> Searches the <i>Episode Title</i> field using left and right truncation to find the occurrence of the search term anywhere within the field, including within words.<br>
	<DIR><i>Example:</i> entering the word "ALL" will retrieve: 
		<DIR>To All the Girls I’ve Loved Before <BR>
		Walk Tall<BR>
		All In A Days Work<BR>
		</DIR>
	</DIR>

</P>

<P><b>Script Writer:</b> Use this index if you are looking for an author of a script.  Searches the <i>Script Writer</i> field using automatic left and right truncation to find all instances of the search term anywhere within the field, including within words.<br>   
	<DIR><i>Example:</i> entering the word "Smith" will retrieve:
		<DIR>Falken, Smith Pat<br>
		Smith, Roger<BR>
		Goldsmith, Gloria <BR>
		</DIR>
	</DIR>

</P>


<BR><BR>
<H4 ALIGN="CENTER">Return to <A HREF="http://www.library.ucla.edu/special-collections/home">UCLA Library Special Collections</A></h4>


<P ALIGN="CENTER">
<FONT SIZE="-1">(&copy; 2014 UC Regents; UCLA Library Special Collections http://www.library.ucla.edu/special-collections/home; Last updated: 30 June 2014)</FONT></p>


<BR>
<BR>

</body>
</html>
