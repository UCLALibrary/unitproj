<cfif isdefined("URL.DBCN") is false>
	<cflocation url="archive.cfm">
</cfif>

<cfset m_DBCN = URL.DBCN>

<cfoutput>
<html>
<head>
	<title>Patron Record - #m_DBCN#</title>
	<link rel="StyleSheet" href="taos.css" type="text/css" media="screen">
</head>
</cfoutput>

<body>

<cfinclude template="qryPatronDetails.cfm">

<!--- Initialize variables as needed --->
<cfset m_FieldSeq = 0>
<cfset m_PrevFieldSeq = 0>

<cfset m_Barcode = "">
<cfset m_BirthDate = "">
<cfset m_Company = "">
<cfset m_Email = "">
<cfset m_EmailFromDate = "">
<cfset m_EmailToDate = "">
<cfset m_ExpirationDate = "">
<cfset m_Firstname = "">
<cfset m_Gender = "">
<cfset m_Lastname = "">
<cfset m_LastModified = "">
<cfset m_Middlename = "">
<cfset m_PrevBarcodes = "">
<cfset m_PrimaryLib = "">
<cfset m_ProxyFirstname = "">
<cfset m_ProxyLastname = "">
<cfset m_ProxyMiddlename = "">
<cfset m_RegistrationDate = "">
<cfset m_RegistrationLib = "">
<cfset m_Suffix = "">
<cfset m_Title = "">

<cfset m_AddressCount = 0>
<cfset m_Addresses = ArrayNew(1)>

<!--- Loop through the data --->
<cfoutput query="qryPatronDetails">
	<cfif Field_Seq GT m_FieldSeq>

		<cfset m_PrevFieldSeq = m_FieldSeq>
		<cfset m_FieldSeq = Field_Seq>
	</cfif>

	<cfswitch expression=#Tag#>
		<cfcase value="005">
			<cfset m_LastModified = Subfield>
		</cfcase>
		<cfcase value="008">
			<cfset m_RegistrationDate = CreateDate(Mid(Subfield, 1, 4), Mid(Subfield, 5, 2), Mid(Subfield, 7, 2))>
			<cfset m_ExpirationDate = CreateDate(Mid(Subfield, 9, 4), Mid(Subfield, 13, 2), Mid(Subfield, 15, 2))>
		</cfcase>
		<cfcase value="010d">
			<cfset m_Barcode = Subfield>
		</cfcase>
		<cfcase value="010e">
			<cfif m_PrevBarcodes EQ "">
				<cfset m_PrevBarcodes = Subfield>
			<cfelse>
				<cfset m_PrevBarcodes = m_PrevBarcodes & " *** " & Subfield>
			</cfif>
		</cfcase>
		<cfcase value="100a">

			<cfset m_Lastname = Subfield>
		</cfcase>
		<cfcase value="100b">
			<cfset m_Firstname = Subfield>
		</cfcase>
		<cfcase value="100c">
			<cfset m_Middlename = Subfield>
		</cfcase>
		<cfcase value="100d">
			<cfset m_Suffix = Subfield>
		</cfcase>
		<cfcase value="100e">
			<cfset m_Title = Subfield>
		</cfcase>
		<cfcase value="100f">
			<cfset m_BirthDate = Subfield>
		</cfcase>
		<cfcase value="100g">
			<cfset m_Gender = Subfield>
		</cfcase>
		<cfcase value="110a">
			<cfset m_Company = Subfield>
		</cfcase>
		<cfcase value="200a">
			<cfif m_FieldSeq GT m_PrevFieldSeq>
				<!--- New field: increment array, add new structure to hold address data --->
				<cfset m_AddressCount = m_AddressCount + 1>
				<cfset m_Addresses[m_AddressCount] = StructNew()>
				<cfset rc = StructInsert(m_Addresses[m_AddressCount], "AddressPt1", "")>
				<cfset rc = StructInsert(m_Addresses[m_AddressCount], "AddressPt2", "")>
				<cfset rc = StructInsert(m_Addresses[m_AddressCount], "City", "")>
				<cfset rc = StructInsert(m_Addresses[m_AddressCount], "County", "")>
				<cfset rc = StructInsert(m_Addresses[m_AddressCount], "State", "")>
				<cfset rc = StructInsert(m_Addresses[m_AddressCount], "PostalCode", "")>
				<cfset rc = StructInsert(m_Addresses[m_AddressCount], "Country", "")>
				<cfset rc = StructInsert(m_Addresses[m_AddressCount], "Phone", "")>
				<cfset rc = StructInsert(m_Addresses[m_AddressCount], "Fax", "")>
				<cfset rc = StructInsert(m_Addresses[m_AddressCount], "PrimaryFromDate", "")>
				<cfset rc = StructInsert(m_Addresses[m_AddressCount], "PrimaryToDate", "")>

				<cfset m_Addresses[m_AddressCount].AddressPt1 = Subfield>
			<cfelse>
				<!--- Same field: 2nd address part/line --->
				<cfset m_Addresses[m_AddressCount].AddressPt2 = Subfield>
			</cfif>
		</cfcase>
		<cfcase value="200b">
			<cfset m_Addresses[m_AddressCount].City = Subfield>
		</cfcase>
		<cfcase value="200c">
			<cfset m_Addresses[m_AddressCount].County = Subfield>
		</cfcase>
		<cfcase value="200d">
			<cfset m_Addresses[m_AddressCount].State = Subfield>
		</cfcase>
		<cfcase value="200e">
			<cfset m_Addresses[m_AddressCount].PostalCode = Subfield>
		</cfcase>
		<cfcase value="200f">
			<cfset m_Addresses[m_AddressCount].Country = Subfield>
		</cfcase>
		<cfcase value="200g">
			<cfset m_Addresses[m_AddressCount].Phone = Subfield>
		</cfcase>
		<cfcase value="200h">
			<cfset m_Addresses[m_AddressCount].Fax = Subfield>
		</cfcase>
		<cfcase value="200i">
			<cfset m_Addresses[m_AddressCount].PrimaryFromDate = Subfield>
		</cfcase>
		<cfcase value="200j">
			<cfset m_Addresses[m_AddressCount].PrimaryToDate = Subfield>
		</cfcase>
		<cfcase value="210b">
			<cfset m_Email = Subfield>
		</cfcase>
		<cfcase value="210i">
			<cfset m_EmailFromDate = Subfield>
		</cfcase>
		<cfcase value="210j">
			<cfset m_EmailToDate = Subfield>
		</cfcase>
		<cfcase value="300f">
			<cfset m_PrimaryLib = Subfield>
		</cfcase>
		<cfcase value="300g">
			<cfset m_RegistrationLib = Subfield>
		</cfcase>
		<cfcase value="400a">
			<cfset m_ProxyLastname = Subfield>
		</cfcase>
		<cfcase value="400b">
			<cfset m_ProxyFirstname = Subfield>
		</cfcase>
		<cfcase value="400c">
			<cfset m_ProxyMiddlename = Subfield>
		</cfcase>
	</cfswitch>
</cfoutput>

<cfoutput>
<table border="1">
	<tr>
		<td class="label">Name</td>
		<td class="data">&nbsp;#m_Title# #m_Firstname# #m_Middlename# #m_Lastname# #m_Suffix#</td>
		<td class="label">Registration Date</td>
		<td class="data">&nbsp;#DateFormat(m_RegistrationDate, "mm/dd/yyyy")#</td>
		<td class="label">Expiration Date</td>
		<td class="data">&nbsp;#DateFormat(m_ExpirationDate, "mm/dd/yyyy")#</td>
	</tr>
	<tr>
		<td class="label">Barcode</td>
		<td class="data">&nbsp;#m_Barcode#</td>
		<td class="label">Previous Barcode(s)</td>
		<td class="data" colspan="3">&nbsp;#m_PrevBarcodes#</td>
	</tr>
<cfif m_AddressCount GT 0>
	<cfloop index="i" from="1" to="#m_AddressCount#">
	<tr>
		<td class="data">
			&nbsp;	#m_Addresses[i].AddressPt1##m_Addresses[i].AddressPt2#<br>
					#m_Addresses[i].City#
					<!--- etc., if still needed... waiting for decision from CSC/dsloane 31 Jan 2005 --->
		</td>
	</tr>
	</cfloop>
</cfif>
</table>
</cfoutput>

</body>
</html>
