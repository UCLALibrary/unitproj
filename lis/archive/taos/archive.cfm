<html>
<head>
	<title>Taos Archive</title>
</head>
<body>

<p>Welcome to the Taos Archive.  Enter your search below, or refer to the <a href="help.cfm">help page</a>.</p>

<form action="results.cfm" method="post">
	<table border="0">
		<tr valign="top">
			<td><b>Index</b></td>
			<td><b>Search for</td>
			<td>&nbsp;</td>
		</tr>
		<tr valign="top">
			<td>
				<select name="index">
					<option value="Author">Author word(s)</option>
					<option value="Call Number">Call number</option>
					<option value="DBCN" selected>DBCN</option>
					<option value="ISBN">ISBN</option>
					<option value="ISSN">ISSN</option>
					<option value="Item Barcode">Item barcode</option>
					<option value="Keyword">Keyword(s)</option>
					<option value="OCLC">OCLC number</option>
					<option value="O1RN">Orion1 number</option>
					<option value="Title">Title word(s)</option>
				</select>
			</td>
			<td>
				<input type="text" name="terms">
			</td>
			<td>
				<input type="submit" name="submit" value="Search">
				<input type="reset" name="reset" value="Reset">
			</td>
		</tr>
	</table>
</form>

</body>
</html>
