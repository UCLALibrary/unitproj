<cfscript>
/**
 * Converts a hex value to a string.
 *
 * @param hex 	 Hex string. (Required)
 * @return Returns a string.
 * @author Michael Krock (michael.krock@avv.com)
 * @version 1, January 28, 2004
 */
function hexToString(hex) {

	var str = "";
	var i = 0;

	for (i=1; i LTE len(hex); i=i+2) {
		str = str & chr(inputBaseN(mid(hex,i,2),16));
	}

	return str;
}

// Convert hex string to Unicode, where original data was hex-encoded as UTF-8
function hexToUtf8String(hex) {
	return CharsetEncode(BinaryDecode(hex, "Hex"), "utf-8");
}

</cfscript>
