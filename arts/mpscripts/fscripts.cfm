<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Search UCLA Library Special Collections Motion Picture Scripts</title>
</head>

<BODY onLoad="window.document.SEARCHFORM.TITLE.focus();">
<script language="JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0

  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");

  if (restore) selObj.selectedIndex=0;

}

function MM_findObj(n, d) { //v3.0

  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {

    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}

  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];

  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;

}

function MM_jumpMenuGo(selName,targ,restore){ //v3.0

  var selObj = MM_findObj(selName); if (selObj) MM_jumpMenu(targ,selObj,restore);

}

//-->

</script>


<H1 ALIGN="CENTER">Collection of Motion Picture Scripts</h1>
<H2 ALIGN="CENTER">(Collection 073)</h2>
<h3 align="center"><A HREF="http://www.library.ucla.edu/location/library-special-collections">UCLA Library Special Collections</A></h3>

<BR>
<BR>

<!--- Search engine code --->
<P>Select an index, enter a single word or phrase, and click on SEARCH.</P>
<FORM METHOD=POST NAME="SEARCHFORM" ACTION="FscrDetail.cfm">
<TABLE>

<TR><TH ALIGN=LEFT>Index</TH><TH ALIGN=LEFT>Search term (word/phrase)</TH></TR>

<TR>
<TD><SELECT NAME="INDEX">
  <OPTION VALUE="TITLE">Title</OPTION>
  <OPTION VALUE="RELCO">Release Company</OPTION>
  <OPTION VALUE="RELDATE">Year of Release</OPTION>
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
<P>

<!--- Help section --->
<P>
<H3 ALIGN="CENTER">Search Help</h3>
This web-based interface allows you to search the finding aid for the Collection of Motion Picture Scripts held by the UCLA Library Special Collections. The finding aid contains over 7,000 titles, but does not contain links to electronic versions of scripts. Please see the <A HREF="http://www.library.ucla.edu/location/library-special-collections">UCLA Library Special Collections</a> web page for contact and service information on viewing scripts.
See below for help on <A HREF="#SEARCH TERMS">searching</a>, <A HREF="#WILDCARDS">wildcards</A>, and <A HREF="#INDEX">indexes</A>.
</P>


<A NAME="SEARCH TERMS"></a>
<STRONG>Searching the Motion Picture Scripts Collection</STRONG>
<BR><BR>
<P><UL>
	<LI><B>All results are sorted by film title.</B>
	<LI>You may enter a single word or phrase. </LI>
	<LI>To search for non-adjacent words in a title, use the "%" wildcard between the terms (e.g., GONE % WIND). </LI>
	<LI>Searches are <B>not</B> case-sensitive. </LI>
	<LI>Boolean searching is not supported. </LI>
	<LI><B>Title</B> and <B>Script Writer</B> searches have automatic left and right truncation, so a single word search will produce results with that term anywhere within the field, including within a word (e.g., RAIN will return RAIN, RAINING, BRAIN, GRAIN, TRAIN,etc.).</LI>
	<LI><B>Release Year</B> and <B>Release Company</B> do <b>not</b> have include any automatic truncation, searching for the <b>exact</b> occurrence of the search term.</LI>
</UL>
</P>

<P>
<A NAME="WILDCARDS"></a>
<STRONG>Wildcards</STRONG>
<BR><BR>
<UL>
	<LI><STRONG>_ (underscore)</STRONG> replaces any single alphanumeric character.  Very useful for searching in the <b>Release Year</b> index.<br>
	<i>Example:</i> a search for the year <STRONG>"195_"</STRONG> will find all films released between 1950-1959.<br>
	<i>Example:</i> a search for <b>"T_N"</b> will retrieve TIN, TAN, TEN, TON, etc.</LI>
	<LI><STRONG>% (percent)</STRONG> replaces any number of characters in the search term or phrase.<br>
	<i>Example:</i> searching for <STRONG>"RAIN%"</STRONG> using the title index will retrieve all scripts containing the search term, even if it is within a word (e.g., RAIN, RAINING, RAINED, RAINS, etc.)<br>
	<i>Example:</i> searching for <b>"GONE % WIND"</b> using the title index will return GONE WITH THE WIND.</LI>
</UL>
</P>

<P>
<A NAME="INDEXES"></a>
<STRONG>About the Indexes</STRONG>
<BR><BR>
You may select from the following indexes:
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
<P><b>Release Company:</b> Searches the <i>Release Company</i> field without automatic truncation to find the <b>exact</b> occurrence of the search term anywhere within the field.<br> 
	<DIR><i>Example:</i> entering the word "Paramount" will produce a list of titles attributed to Paramount. <BR> 
	</DIR>
</P>
<br>  
<P><b>Release Year:</b> Searches the <i>Release Year</i> field to find the <b>exact</b> occurrence of the search term anywhere within the field.  Searching this index does not use automatic left and right truncation and does not allow for searching a specific range of dates (e.g., 1954-1964). The use of a wildcard is useful when using this index.
</P>

<P><b>Script Writer:</b> Searches the <i>Script Writer</i> field using automatic left and right truncation to find all instances of the search term anywhere within the field, including within words.<br>   
	<DIR><i>Example:</i> entering the word "Smith" will retrieve:
		<DIR>Dewitt, Jack; Smith, J. Woodruff <BR>
		Smith, Kevin <BR>
		Zugsmith, Albert <BR>
		</DIR>
	</DIR>
</P>
<BR><BR>
<H4 ALIGN="CENTER">Return to <A HREF="http://www.library.ucla.edu/location/library-special-collections">UCLA Library Special Collections</A></h4>

<P ALIGN="CENTER">
<FONT SIZE="-1">(&copy; UC Regents; UCLA Library Special Collections http://www.library.ucla.edu/location/library-special-collections;
Last updated: 30 June 2014)</FONT></p>
</body>
</html>
