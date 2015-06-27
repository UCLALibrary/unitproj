<cfquery name="qryList" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		Supplier_ID
	,	Supplier_Name
	FROM Suppliers
<cfif m_Index EQ "SupplierID">
	WHERE Supplier_ID = '#m_Terms#'
	ORDER BY Supplier_ID
</cfif>
<cfif m_Index EQ "SupplierName">
	WHERE Supplier_Name LIKE '%#m_Terms#%'
	ORDER BY Supplier_Name, Supplier_ID
</cfif>

</cfquery>
