<cfscript>
	if ( IsDefined("FORM.submit") ) {
		m_query = true;
		m_barcode = Trim(FORM.barcode);
		m_box_number = FORM.boxnumber;
	}
	else {
		// either Reset was submitted, or didn't come to page through form
		// make sure variables are defined and initialized
		m_query = false;
		m_barcode = "";
		m_box_number = "";
	}
</cfscript>

<html>
<head>
	<title>PCCP - Box Items</title>
</head>
<body>

<p><a href="index.cfm">Return to main PCCP page</a></p>
<p>Select box and scan item(s) for that box.</p>

<!--- If "New box" (0) was selected, create a new box and pre-select it in the barcode form below --->
<cfif m_box_number eq 0>
  <cfinclude template="queries/qryAddBox.cfm">
  <cfinclude template="queries/qryGetLatestBox.cfm">
  <cfset m_box_number = qryGetLatestBox.box_number>
</cfif>

<!--- Update item record, assigning it to a box --->
<cfif m_barcode neq "" and m_box_number gt 0>
	<cfinclude template="queries/qryAddItemToBox.cfm">
	<cfif result_AddItemToBox.RecordCount neq 1>
		<cfoutput><p><b>ERROR adding barcode #m_barcode# to box #m_box_number# - item not found or has incorrect status</b></cfoutput>
	</cfif>
</cfif>

<!--- Get full list of boxes --->
<cfinclude template="queries/qryBoxes.cfm">

<!--- Display form for adding an item (barcode) to a box --->
<form name="shipment" id="shipment" action="boxitems.cfm" method="post">
	<label for="boxnumber">Select a box:&nbsp;</label>
	<select name="boxnumber">
		<option value="0">New box</option>
	<cfoutput query="qryBoxes">
		<option value="#box_number#" <cfif m_box_number eq #box_number#>selected</cfif>>Box #box_number#</option>
	</cfoutput>
	</select>
	<label for="barcode">Barcode:&nbsp;</label>
	<input type="text" name="barcode" size="15" maxlength="15" autofocus>
	<input type="submit" name="submit" value="GO">
</form>

<!--- Display list of items in current box, latest first --->
<cfif m_box_number gt 0>
	<cfinclude template="queries/qryGetItemsForBox.cfm">
	<cfoutput><p>Box <b>#m_box_number#</b> contains <b>#qryGetItemsForBox.RecordCount#</b> item(s)</p></cfoutput>
	<table border="1">
		<thead>
			<tr>
				<th>Barcode</th>
				<th>Call number</th>
				<th>ISBN</th>
				<th>Author</th>
				<th>Title</th>
				<th>Imprint</th>
			</tr>
		</thead>
		<tbody>
		<cfoutput query="qryGetItemsForBox">
			<tr valign="top">
				<td>#item_barcode#&nbsp;</td>
				<td>#display_call_no#&nbsp;</td>
				<td>#isbn#&nbsp;</td>
				<td>#author#&nbsp;</td>
				<td>#title_brief#&nbsp;</td>
				<td>#imprint#&nbsp;</td>
			</tr>
		</cfoutput>
		</tbody>
	</table>
</cfif>

</body>
</html>