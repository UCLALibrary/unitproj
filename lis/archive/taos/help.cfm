<html>
<head>
	<title>DRA Taos Archive - Help</title>
</head>
<body>
<a name="Top">
<a href="archive.cfm">Return to search screen</a><br>
<a href="#Contents">Contents of the archive</a><br>
<a href="#Searching">How to search</a><br>
<a href="#Displays">Record display pages</a><br>

<a name="Contents">
<h4>Contents of the archive <a href="#Top">[top]</a></h4>
<p>
	The Taos Archive contains every piece of information from the following types of record: authority, bibliographic, holdings, and item.
	Patron records, circulation transactions (those linking items with patrons) and fines/fees were not retained in the Archive,
	either for privacy reasons or because the data has been aggregated into the data warehouse.
</p>
<p>
	Records for all 3 Taos databases - Ethnomusicology, Film/Television, and UCLA - are stored in the Archive.  At present, all records
	are indexed together, so a search may retrieve records from any or all of the original databases.
</p>

<cfquery name="qryCounts" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT Type, Number
	FROM Record_Counts
	ORDER BY Seq
</cfquery>

<table border="1">
	<caption><b>Archive Contents</b></caption>
	<tr valign="top">
		<th align="left">Record Type</th>
		<th align="right">Count</th>
	</tr>
<cfoutput query="qryCounts">
	<tr valign="top">
		<td align="left">#Type#</td>
		<td align="right">#NumberFormat(Number, "999,999,999")#</td>
	</tr>
</cfoutput>
</table>

<a name="Searching">
<h4>How to search <a href="#Top">[top]</a></h4>
<p>Your results will vary depending on the index you use:</p>
<table border="1">
	<tr valign="top">
		<th>Index</th>
		<th>Results</th>
		<th>Examples</th>
		<th>Notes</th>
	</tr>
	<tr valign="top">
		<td>Author word(s)</td>
		<td>Bibliographic records</td>
		<td>
			<code>mark twain</code><br>
			<code>association medical</code>
		</td>
		<td>Fields indexed: 100, 110, 111, 130, 700, 710, 711, 730</td>
	</tr>
	<tr valign="top">
		<td>Call number</td>
		<td>Holdings records</td>
		<td>
			<code>KF135</code><br>
			<code>NA2 .C34 1994</code>
		</td>
		<td>Fields indexed: 852 ($h + $i, $j)
			<br>Spaces are ignored for searching, but all other characters are indexed.  This is a left-anchored, right-truncated search.
		</td>
	</tr>
	<tr valign="top">
		<td>DBCN</td>
		<td>Authority, bibliographic & holdings records</td>
		<td>
			<code>02-AAA-1111</code>
			<code>07-ABC-1234</code>
		</td>
		<td>Fields indexed: 001
			<br>OK to search with or without the hyphen
		</td>
	</tr>
	<tr valign="top">
		<td>ISBN</td>
		<td>Bibliographic records</td>
		<td>
			<code>0872929094</code>
		</td>
		<td>Fields indexed: 020
			<br>OK to search with or without the hyphen
		</td>
	</tr>
	<tr valign="top">
		<td>ISSN</td>
		<td>Bibliographic records</td>
		<td>
			<code>1080-210X</code>
		</td>
		<td>Fields indexed: 022
			<br>OK to search with or without the hyphen
		</td>
	</tr>
	<tr valign="top">
		<td>Item barcode</td>
		<td>Holdings records</td>
		<td>
			<code>L0073620833</code>
		</td>
		<td>Fields indexed: 876 $p, 877 $p, 878 $p</td>
	</tr>
	<tr valign="top">
		<td>Keyword(s)</td>
		<td>Bibliographic records</td>
		<td>
			<code>twain tom sawyer</code><br>
			<code>journal medical</code>
		</td>
		<td>Fields indexed: 001, 020, 022, 100, 110, 111, 130, 240, 242, 243, 245, 246, 247, 700, 710, 711, 730, 900</td>
	</tr>
	<tr valign="top">
		<td>OCLC number</td>
		<td>Bibliographic records</td>
		<td>
			<code>40483669</code>
			<code>00999996</code>
		</td>
		<td>Fields indexed: 035
			<br>OCLC numbers are normalized to 8 digits; include leading zeros as needed
		</td>
	</tr>
	<tr valign="top">
		<td>Orion1 number</td>
		<td>Bibliographic records</td>
		<td>
			<code>TC0035174</code>
		</td>
		<td>Fields indexed: 935</td>
	</tr>
	<tr valign="top">
		<td>Title word(s)</td>
		<td>Bibliographic records</td>
		<td>
			<code>federal reporter</code><br>
			<code>mittens gloves</code>
		</td>
		<td>Fields indexed: 240, 242, 243, 245, 246, 247</td>
	</tr>
</table>
<p>
	All bibliographic searches are done against one big keyword index, which includes all subfields except $6 from all fields specified above.
	Normalization was done by keeping English letters (A-Z) and numerals (0-9); stripping apostrophes (e.g., <code>don't</code> became
	<code>dont</code>; and replacing all other punctuation with spaces (e.g., <code>1,000</code> became <code>1 000</code>).  All diacritics
	were removed (e.g., <code>f&uuml;r</code> became <code>fur</code>); this works well for most Western European languages, but with varying success for others.
</p>
<p>
	<b>Use care</b> when doing keyword searches: while the database server's performance is excellent, if your search retrieves thousands of records,
	it can take a long time to return all of the results to your browser.  Formulate your searches to be as specific as possible.
</p>

<a name="Displays">
<h4>Record display pages <a href="#Top">[top]</a></h4>
<p>
	Most of the record display pages are similar to their Taos counterparts, and need only minimal explanation:
	<ul>
		<li>The <em>Bib Record</em> page shows the MARC bibliographic record, followed by basic summary holdings.</li>
		<li>The <em>Holdings Record</em> page shows the MARC holdings record.  Hyperlinks in the 87x $a, if any, lead to individual
			item records.
		</li>
		<li>The <em>Item Record</em> page shows data from the Taos Item Extension record, with a few additions (transaction times and counts).</li>
	</ul>
</p>
<p>
	Taos MARC records were not stored in Unicode (although the Cataloging client used Unicode for editing).  The Archive contains the records as
	they were stored within Taos, encoded in MARC-8, but displays the records in Unicode for convenience.  Known problems with the Unicode display:
	<ul>
		<li>Arabic text may not be correctly shown right-to-left</li>
		<li>Some CJK characters may display in obsolete forms</li>
	</ul>
</p>
<p>
	Since the Archive preserves data just as it was extracted from Taos, display oddities are almost certainly caused by data errors.
	However, if you need to be certain of the raw content of an archived record, or if an error occurs while using the archive, please
	<a href="mailto:lis-contact@library.ucla.edu">email LIT</a> or call x5-7557.
</p>

<p>Last updated: 22 Feb 2005</p>

</body>
</html>
