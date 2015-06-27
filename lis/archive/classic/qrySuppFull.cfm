<cfquery name="qrySuppHeaders" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		*
	FROM Suppliers
	WHERE Supplier_ID = '#m_Supplier_ID#'
</cfquery>

<cfquery name="qrySuppAddresses" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		*
	FROM Addresses
	WHERE Supplier_ID = '#m_Supplier_ID#'
	ORDER BY Address_Type
</cfquery>

<cfquery name="qrySuppAccounts" datasource="#DSN#" CACHEDWITHIN="#CreateTimeSpan(0, 0, 10, 0)#">
	SELECT
		*
	FROM Accounts
	WHERE Supplier_ID = '#m_Supplier_ID#'
	ORDER BY Account_ID
</cfquery>
