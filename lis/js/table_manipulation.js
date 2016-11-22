function getRowNum(element) {
	// element should be in a table cell, in a table row
	var rowNum = -1;
	var tag = element.tagName;
	while (tag != "") {
		element = element.parentNode;
		tag = element.tagName;
		if (tag == "TR") {
			rowNum = element.rowIndex;
			break;
		}
		// safety check, in case we're not in a table after all
		if (tag == "HTML") {
			break;
		}
	}
	return rowNum;
}

function moveRow(tableId, fromRowIdx, toRowIdx) {
	// Moves a table's row from one point to another, within that table
	// Should just be able to use insertBefore like this: tbody.insertBefore(rowToInsert, rowToInsertBefore)
	//   but IE6, at least, gives invalid argument unless we use rows[].parentNode (at MS, one isn't parent of one's own children?)
	// Also for IE6, the index into tbody.rows[] also apparently must match the rowToInsertBefore... can't just use row[0] (nor are children related?)
	var table = document.getElementById(tableId);
	var tbody = table.tBodies[0];
	var trows = tbody.rows;
	var maxRowIdx = trows.length - 1; // zero-based array
	var targetRow = null;
	if ( (fromRowIdx >= 0) && (fromRowIdx <= maxRowIdx) && (toRowIdx >= 0) && (toRowIdx <= maxRowIdx) ) {
		if (fromRowIdx > toRowIdx) {
			// moving "up" to row x = inserting before row x (push everything down starting at x)
			targetRow = trows[toRowIdx];
			targetRow.parentNode.insertBefore(trows[fromRowIdx], targetRow);
			//tbody.rows[toRowIdx].parentNode.insertBefore(trows[fromRowIdx], trows[toRowIdx]);
		} else {
			// moving "down" to row x = inserting before row x+1, UNLESS moving to final row
			// since there's no x+1 for final row: insert before final row, then move final row up by 1
			if (toRowIdx < maxRowIdx) {
				targetRow = trows[toRowIdx + 1];
				targetRow.parentNode.insertBefore(trows[fromRowIdx], targetRow);
				//tbody.rows[toRowIdx + 1].parentNode.insertBefore(trows[fromRowIdx], trows[toRowIdx + 1]);
			} else {
				targetRow = trows[maxRowIdx];
				targetRow.parentNode.insertBefore(trows[fromRowIdx], targetRow);
				//tbody.rows[maxRowIdx].parentNode.insertBefore(trows[fromRowIdx], trows[maxRowIdx]);

				targetRow = trows[maxRowIdx - 1];
				targetRow.parentNode.insertBefore(trows[maxRowIdx], targetRow);
				//tbody.rows[maxRowIdx - 1].parentNode.insertBefore(trows[maxRowIdx], trows[maxRowIdx - 1]);
			}
		}
	}
}
