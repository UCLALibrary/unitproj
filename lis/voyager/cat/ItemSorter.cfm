<cfscript>
	// Make sure variables are defined and initialized
	if (IsDefined("FORM.getData")) {
		m_itemseq = "";
		m_mfhdid = FORM.mfhdId;
		m_sorted = FORM.sortitems;
	}
	else if (IsDefined("FORM.saveData")) {
		m_itemseq = FORM.itemseq;
		m_mfhdid = FORM.mfhdId;
		m_sorted = false;
	}
	else {
		m_itemseq = "";
		m_mfhdid = 0;
		m_sorted = false;
	}

	m_testmode = false;
	if (m_testmode EQ true) {
		m_server = "ils-db-test.library.ucla.edu";
		m_version = "2009.1.1";
		m_port = 7010;
	} else {
		m_server = "ils-db-prod.library.ucla.edu";
		m_version = "2009.1.1";
		m_port = 7010;
	}
</cfscript>

<html>
<head>
	<title>Voyager Item Sorter <cfif m_testmode EQ true>TESTDB</cfif></title>
	<script language="JavaScript" src="../../js/table_manipulation.js" type="text/javascript"></script>
	<script language="JavaScript" type="text/javascript">
		function md(currRowIdx) {
			// local function with hardcoded tableId to reduce size of final page due to large tables
			// move current row down by 1
			moveRow('itemList', currRowIdx, currRowIdx + 1);
			resetRowNumbers();
			setChanged(true);
		}

		function mu(currRowIdx) {
			// local function with hardcoded tableId to reduce size of final page due to large tables
			// move current row up by 1
			moveRow('itemList', currRowIdx, currRowIdx - 1);
			resetRowNumbers();
			setChanged(true);
		}

		function mt(currRowIdx) {
			// local function with hardcoded tableId to reduce size of final page due to large tables
			// move current row to position specified by user
			var targetRowIdx = prompt("Move row to position: ", "");
			if ( (targetRowIdx != null) && (targetRowIdx != "") && (targetRowIdx > 0) ) {
				targetRowIdx = targetRowIdx - 1; // rows are 0-based, users are 1-based
				moveRow('itemList', currRowIdx, targetRowIdx);
				resetRowNumbers();
				setChanged(true);
			}
		}

		function setChanged(changed) {
			var btn = document.getElementById('saveData');
			if (changed == true) {
				btn.disabled = false;
			} else {
				btn.disabled = true;
			}
		}

		function makeItemPostData() {
			// Copies itemids from table rows into comma-delimited list for http posting
			var items = "";
			var table = document.getElementById('itemList');
			if (table) {
				var trows = table.tBodies[0].rows;
				for (rowIdx = 0; rowIdx < trows.length; rowIdx++) {
					if (rowIdx > 0) {
						items = items + ",";
					}
					items = items + trows[rowIdx].id;
				}
				document.getElementById('itemseq').value = items;
			}
		}

		function resetRowNumbers() {
			// Updates table's rownumbers after user sorts/moves rows around
			var table = document.getElementById('itemList');
			if (table) {
				var trows = table.tBodies[0].rows;
				for (rowIdx = 0; rowIdx < trows.length; rowIdx++) {
					var trow = trows[rowIdx];
					var tcell = trow.cells[0];
					tcell.innerHTML = rowIdx + 1;
				}
			}
		}

	</script>
</head>
<body>

<!--- Form to retrieve Voyager item data for a given mfhd (holdings record) --->
<cfoutput>
<form name="getItems" action="itemsorter.cfm" method="post">
	<label for="mfhdid">MFHD ID:</label>
	<input name="mfhdId" id="mfhdId" type="text" size="10" maxlength="8" value="<cfif m_mfhdid GT 0>#m_mfhdid#</cfif>" autofocus />
	<select name="sortitems" id="sortitems">
		<option value="false" <cfif m_sorted EQ false>selected</cfif>>unsorted</option>
		<option value="true" <cfif m_sorted EQ true>selected</cfif>>sorted</option>
	</select>
	<input name="itemseq" id="itemseq" type="hidden" value="" />
	<input name="getData" id="getData" type="submit" value="Get items" />
	<input name="saveData" id="saveData" type="submit" value="Save changes" <cfif m_sorted EQ false>disabled</cfif> onClick="makeItemPostData();" />
	<a href="logout.cfm">Log out</a>
</form>
</cfoutput>

<cfscript>
	if (m_mfhdid GT 0) {
		// Create and instantiate an itemSorter
		itemSorter = createObject("Java", "edu.ucla.library.libservices.voyager.objects.ItemSorter");
		retval = itemSorter.init(m_server, m_version, m_port);

		// If item sequence data is being saved from previous page, update Voyager
		if (m_itemseq NEQ "") {
			retval = itemSorter.resequenceItems(JavaCast("String", m_itemseq));
		}

		// Retrieve current item data from Voyager
		// If no items, CF items array is undefined... and CFMX can't use IsDefined() on arrays, so need to use try/catch for "expression exception"
		try {
			items = itemSorter.getItems(m_mfhdid, m_sorted);
			itemcount = ArrayLen(items);
		} catch (expression e) {
			itemcount = 0;
			//WriteOutput(e.type);
		}

		// Display some basic info
		WriteOutput("<p>MFHD #m_mfhdid# has #itemcount# item(s)</p>");

		if (itemcount GT 0) {
			// Table of item data, with links to allow user to move rows around
			WriteOutput("<table border='1' name='itemList' id='itemList'>");
			// One row for each item, from array returned by itemSorter.getItems()
			for (rownum = 1; rownum LTE itemcount; rownum = rownum + 1) {
				item = items[rownum];
				itemid = item.getItemId();
				barcode = item.getBarcode();
				enumeration = item.getEnumeration();
				WriteOutput("<tr id='#itemid#'>");
					WriteOutput("<td>" & rownum & "</td>");
					WriteOutput("<td>" & barcode & "</td>");
					WriteOutput("<td>" & enumeration & "</td>");
					WriteOutput("<td>");
						WriteOutput("<a href='###rownum#' onclick='mu(getRowNum(this));'>up</a>&nbsp;");
						WriteOutput("<a href='###rownum#' onclick='md(getRowNum(this));'>down</a>&nbsp;");
						WriteOutput("<a href='###rownum#' onclick='mt(getRowNum(this));'>move</a>&nbsp;");
					WriteOutput("</td>");
				WriteOutput("</tr>");
			}
			WriteOutput("</table>");
		}
	}
</cfscript>

</body>
</html>
