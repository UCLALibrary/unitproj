<cfscript>
/**
 * Parses MARC record and formats with HTML.
 * @param record	MARC record
 * @return out		String containing HTML-formatted data
 */
function marcToHtml(record) {
	var out = "";
	var leader = mid(record, 1, 24);
	var baseAddress = InputBaseN(mid(leader, 13, 5), 10);

	var directory = mid(record, 25, baseAddress - 25);

	var dirEntry = "";
	var dirPos = 0;
	var tag = "";
	var fieldLength = 0;
	var fieldStart = 0;

	var indicators = "";
	var field = "";
	var formattedField = "";
	var sfCode = "";
	var sfText = "";
	var subfields = "";
	var sfPos = 1;

	out = out & "<table border='0'>";
	out = out & "<tr><td>LDR</td><td colspan='2'>" & leader & "</td></tr>";

	for (dirPos = 0; dirPos LT (len(directory) / 12); dirPos = dirPos + 1) {
		dirEntry = mid(directory, (dirPos * 12) + 1, 12);
		tag = mid(dirEntry, 1, 3);
		fieldLength = InputBaseN(mid(dirEntry, 4, 4), 10);
		fieldStart = InputBaseN(mid(dirEntry, 8, 5), 10);
		field = mid(record, baseAddress + fieldStart + 1, fieldLength - 1);
		if (mid(tag, 1, 2) EQ "00") {
			indicators = "";
			// 004: allow link to related record (holdings to bib)
			if (tag EQ "004") {
				field = "<a href='showMarc.cfm?DBCN=" & field & "'>" & field & "</a>";
			}
		}
		else {
			indicators = mid(field, 1, 2);
			field = mid(field, 3, len(field) - 2);
		}
		indicators = replace(indicators, " ", "&nbsp;", "all");

		out = out & "<tr>";
		out = out & "<td><span class='tag'>" & tag & "</span></td>";
		if (indicators EQ "") {
			// no indicators, no subfields
			out = out & "<td colspan='2'>" & field & "</td>";
		}
		else {
			out = out & "<td><span class='indicators'>" & indicators & "</span></td>";
			// iterate through subfields
			formattedField = "";
			subfields = ListToArray(field, chr(31));
			for (sfPos = 1; sfPos LTE ArrayLen(subfields); sfPos = sfPos + 1) {
				sfCode = mid(subfields[sfPos], 1, 1);
				sfText = mid(subfields[sfPos], 2, len(subfields[sfPos]) - 1);
				if (sfPos GT 1) { formattedField = formattedField & "&nbsp;"; }
				formattedField = formattedField & "<span class='subfield'>" & "$" & sfcode & "</span>" & "&nbsp;";
				if ( (tag EQ "876" or tag EQ "877" or tag EQ "878") and sfCode EQ "a") {
					formattedField = formattedField & "<a href='showItem.cfm?ID=" & sfText & "'>" & sfText & "</a>";
				}
				else {
					formattedField = formattedField & sfText;
				}
			}
			out = out & "<td>" & formattedField & "</td>";
		}
		out = out & "</tr>";


	}
	out = out & "</table>";

	return out;
}

/**
 * Parses MARC record and formats with HTML.
 * @param record	Unicode MARC record
 * @return out		String containing HTML-formatted data
 *
 * This version handles records which have already been converted from MARC-8 to Unicode (UCS-2)
 * CFMX 7 is like Java: strings are in Unicode, not UTF-8
 * At present, conversion routines just convert bytes, but Unicode conversion has changed UTF-8 bytes to UCS-2 characters
 * For example, e (with combining acute) is 65 CC 81 in UTF-8, but 0065 0301 in UCS-2
 * So, this version parsed tags from directory, but fields based on field terminator (ASCII 30)
 */
function marcToHtmlUnicode(record) {
	var out = "";
	var leader = mid(record, 1, 24);
	var baseAddress = InputBaseN(mid(leader, 13, 5), 10);

	var directory = mid(record, 25, baseAddress - 25);

	var dirEntry = "";
	var dirPos = 0;
	var tag = "";

	var indicators = "";
	var field = "";
	var formattedField = "";
	var sfCode = "";
	var sfText = "";
	var subfields = "";
	var sfPos = 1;

	var data = "";
	var tags = ArrayNew(1);
	var fields = "";
	var tagNum = 1;
	var FT = 30; // field terminator
	var SF = 31; // subfield marker

	out = out & "<table border='0'>";
	out = out & "<tr><td>LDR</td><td colspan='2'>" & leader & "</td></tr>";

	for (dirPos = 0; dirPos LT (len(directory) / 12); dirPos = dirPos + 1) {
		dirEntry = mid(directory, (dirPos * 12) + 1, 12);
		// CF arrays are 1-based
		tags[dirPos + 1] = mid(dirEntry, 1, 3);
	}

	data = mid(record, baseAddress, len(record) - baseAddress); // don't want final field terminator & record terminator
	fields = ListToArray(data, chr(FT)); //

	for (tagNum = 1; tagNum LTE ArrayLen(tags); tagNum = tagNum + 1) {
		tag = tags[tagNum];
		field = fields[tagNum];

		// indicators differ based on fixed-field (tag starts with 00) or variable-field (all others)
		if (mid(tag, 1, 2) EQ "00") {
			indicators = "";
			// 004: allow link to related record (holdings to bib)
			if (tag EQ "004") {
				field = "<a href='showMarc.cfm?DBCN=" & field & "'>" & field & "</a>";
			}
		}
		else {
			indicators = mid(field, 1, 2);
			field = mid(field, 3, len(field) - 2);
		}
		indicators = replace(indicators, " ", "&nbsp;", "all");

		out = out & "<tr>";
		out = out & "<td><span class='tag'>" & tag & "</span></td>";
		if (indicators EQ "") {
			// no indicators, no subfields
			out = out & "<td colspan='2'>" & field & "</td>";
		}
		else {
			out = out & "<td><span class='indicators'>" & indicators & "</span></td>";
			// iterate through subfields
			formattedField = "";
			subfields = ListToArray(field, chr(SF));
			for (sfPos = 1; sfPos LTE ArrayLen(subfields); sfPos = sfPos + 1) {
				sfCode = mid(subfields[sfPos], 1, 1);
				sfText = mid(subfields[sfPos], 2, len(subfields[sfPos]) - 1);
				if (sfPos GT 1) { formattedField = formattedField & "&nbsp;"; }
				formattedField = formattedField & "<span class='subfield'>" & "$" & sfcode & "</span>" & "&nbsp;";
				if ( (tag EQ "876" or tag EQ "877" or tag EQ "878") and sfCode EQ "a") {
					formattedField = formattedField & "<a href='showItem.cfm?ID=" & sfText & "'>" & sfText & "</a>";
				}
				else {
					formattedField = formattedField & sfText;
				}
			}
			out = out & "<td>" & formattedField & "</td>";
		}
		out = out & "</tr>";
	} // for tagNum loop

	out = out & "</table>";
	return out;
} // function

</cfscript>
