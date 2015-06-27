<html>
<head>
	<title>DRA Classic Archive - Help</title>
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
	The Classic Archive contains every piece of information from every type of record used by UCLA: bibliographic (Netcat), fund, invoice,
	purchase order, and supplier.  Some functions in Classic were not used (bindery, check-in, selection lists), so there are no records to
	archive for those.
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
		<td>DBCN</td>
		<td>Bibliographic records</td>
		<td>
			<code>ABC-1234</code>
		</td>
		<td>Fields indexed: 001
			<br>OK to search with or without the hyphen
		</td>
	</tr>
	<tr valign="top">
		<td>Fund ID</td>
		<td>Fund records</td>
		<td>
			<code>LBAR02</code><br>
			<code>*-EJW</code>
		</td>
		<td>Use wildcard (?, % or *) to broaden search</td>
	</tr>
	<tr valign="top">
		<td>Fund name</td>
		<td>Fund records</td>
		<td>
			<code>Chemistry</code>
		</td>
		<td>Looks for search terms as exact substring in Classic "Fund Note" field</td>
	</tr>
	<tr valign="top">
		<td>Invoice number</td>
		<td>Invoice records</td>
		<td>
			<code>15098881-01</code><br>
			<code>NNELJ990428</code>
		</td>
		<td>Must enter invoice number exactly, including all punctuation</td>
	</tr>
	<tr valign="top">
		<td>Invoice sequence number</td>
		<td>Invoice records</td>
		<td>
			<code>G5459</code><br>
			<code>K0531</code>
		</td>
		<td>From "check number" field in Classic</td>
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
		<td>Keyword(s)</td>
		<td>Bibliographic records</td>
		<td>
			<code>twain tom sawyer</code><br>
			<code>journal medical</code>
		</td>
		<td>Fields indexed: 001, 020, 022, 100, 110, 111, 130, 240, 242, 243, 245, 246, 247, 700, 710, 711, 730, 900</td>
	</tr>
	<tr valign="top">
		<td>Orion1 number</td>
		<td>Bibliographic records</td>
		<td>
			<code>TC0035174</code>
		</td>
		<td>Fields indexed: 900</td>
	</tr>
	<tr valign="top">
		<td>PO number</td>
		<td>Purchase order records</td>
		<td>
			<code>COL-110405</code><br>
			<code>TC0225036LW01</code>
		</td>
		<td>Must enter PO prefix (if any) and PO number exactly (no space between), including all punctuation</td>
	</tr>
	<tr valign="top">
		<td>Supplier ID</td>
		<td>Supplier records</td>
		<td>
			<code>EBS</code><br>
			<code>T0068534UR01</code>
		</td>
		<td>Must enter exact supplier id</td>
	</tr>
	<tr valign="top">
		<td>Supplier name</td>
		<td>Supplier records</td>
		<td>
			<code>ebsco</code><br>
			<code>university press</code>
		</td>
		<td>Looks for search terms as exact substring in Classic "Supplier name" field</td>
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
	All bibliographic searches are done against one big keyword index, which includes all subfields except $6 from all specified fields.
	Normalization was done by keeping English letters (A-Z) and numerals (0-9); stripping apostrophes (e.g., <code>don't</code> became
	<code>dont</code>; and replacing all other punctuation with spaces (e.g., <code>1,000</code> became <code>1 000</code>).  All diacritics
	were removed (e.g., <code>für</code> became <code>fur</code>); this works well for most Western European languages, but with varying success for others.
</p>

<a name="Displays">
<h4>Record display pages <a href="#Top">[top]</a></h4>
<p>
	Most of the record display pages are similar to their Classic counterparts, and don't need further explanation.  However, there are two exceptions:
	the <em>Invoice line/loc details page</em> and <em>PO line/order details page</em>.  These are reached via the hyperlinked line numbers on the main
	Invoice and PO pages, respectively.
</p>
<p>
	These two detail pages are <em>"dumps"</em> of the corresponding Classic data records.  Each record's fields are listed in alphabetical order (by
	field name), along with the value of the field.  This was done for two reasons: simplicity and accuracy.
</p>
<p>
	Each of these records is quite long, requiring several screens in Classic, many of which were never used by UCLA staff.
	In addition, some of the data was <em>interpreted</em> by Classic - either calculated (some currency conversions & totals) or translated (some codes).
	Since the Archive's purpose is to preserve what was in Classic - not to reproduce Classic - these secondary records are being displayed in this
	"dump" format.
</p>

</body>
</html>
