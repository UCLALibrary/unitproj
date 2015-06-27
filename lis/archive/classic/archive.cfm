<html>
<head>
	<title>DRA Classic Archive</title>
</head>
<body>

<p>Welcome to the DRA Classic Archive.  Enter your search below, or refer to the <a href="help.cfm">help page</a>.</p>

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
					<option value="DBCN">DBCN</option>
					<option value="FundID">Fund ID</option>
					<option value="FundName">Fund name</option>
					<option value="InvNumber">Invoice number</option>
					<option value="InvSeq">Invoice sequence number</option>
					<option value="InvSuppID">Invoice (by Supplier ID)</option>
					<option value="InvSuppName">Invoice (by Supplier name)</option>
					<option value="ISBN">ISBN</option>
					<option value="ISSN">ISSN</option>
					<option value="Keyword" selected>Keyword(s)</option>
					<option value="O1RN">Orion1 number</option>
					<option value="PoNumber">PO number</option>
					<option value="PoSuppID">PO (by Supplier ID)</option>
					<option value="PoSuppName">PO (by Supplier name)</option>
					<option value="SupplierID">Supplier ID</option>
					<option value="SupplierName">Supplier name</option>
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
