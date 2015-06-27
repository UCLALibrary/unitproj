<cfscript>
function FormatPO(PO_Prefix, PO_Number) {
	PO_Number = REReplace(PO_Number, "^0", "", "ALL");
	return Trim(PO_Prefix) & Trim(PO_Number);
}
</cfscript>

