<cfscript>
	if ( IsDefined("FORM.submit") ) {
		m_query = true;
		m_cn_start = FORM.cn_start;
		m_cn_end = FORM.cn_end;
		m_status = FORM.status;
	}
	else {
		// either Reset was submitted, or didn't come to page through form
		// make sure variables are defined and initialized
		m_query = false;
		m_cn_start = "";
		m_cn_end = "";
		m_status = "ALL";
	}
</cfscript>

<html>
<head>
	<title>PCCP Items</title>
</head>
<body>

<p><a href="index.cfm">Return to main PCCP page</a></p>

<cfinclude template="queries/qryAllStatuses.cfm">

<p>Enter starting and ending call numbers, or initial portions.  Examples: H, H62, H62B, H62 B113, etc.  Spacing and capitalization do not matter.</p>
<form name="itemlist" id="itemlist" action="itemlist.cfm" method="post">
	<label for="cn_start">Call number start:</label>
<cfoutput>
	<input name="cn_start" type="text" size="30" <cfif m_cn_start is not "">value="#m_cn_start#"</cfif>>
	<br />
	<label for="cn_end">Call number end:</label>
	<input name="cn_end" type="text" size="30" <cfif m_cn_end is not "">value="#m_cn_end#"</cfif>>
</cfoutput>
	<br />
	<label for="status">Status:</label>
	<select name="status">
	<cfoutput query="qryAllStatuses">
		<option value="#project_status#" <cfif m_status eq #project_status#>selected</cfif>>#project_status#</option>
	</cfoutput>
	</select>
	<input name="submit" type="submit" value="List items">
</form>
<hr />

<!--- Show items matching search, if any --->
<cfif m_query eq true>
	<cfinclude template="queries/qryListItems.cfm">
</cfif>
<cfif IsDefined("qryListItems")>
	<cfoutput><p>There are #qryListItems.RecordCount# items matching your search,</p></cfoutput>
	<table border="1">
		<thead>
			<tr>
				<th>Call number</th>
				<th>Status</th>
				<th>Barcode</th>
				<th>Enum</th>
				<th>Copy</th>
				<th>Author</th>
				<th>Title</th>
			</tr>
		</thead>
		<tbody>
		<cfoutput query="qryListItems">
			<tr valign="top">
				<td>#display_call_no#&nbsp;</td>
				<td>#project_status#&nbsp;</td>
				<td>#item_barcode#&nbsp;</td>
				<td>#item_enum#&nbsp;</td>
				<td>#copy_number#&nbsp;</td>
				<td>#author#&nbsp;</td>
				<td>#title_brief#&nbsp;</td>
			</tr>
		</cfoutput>
		</tbody>
	</table>
</cfif>
</body>
</html>
