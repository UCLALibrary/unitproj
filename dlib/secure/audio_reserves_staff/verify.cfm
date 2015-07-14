<!--- 
RETURNS: caller.response ; caller.uclaid ; caller.ticket
 --->

<!--- CHECK TICKET (COOKIE) --->
<cfif IsDefined("Cookie.edu.ucla.isis4.ticket")>
	<cfset attributes.ticket = #Cookie.edu.ucla.isis4.ticket#>
<!--- IF NO TICKET, EXIT --->
<cfelse>
	<cfset caller.response="NO TICKET">
	<cfexit>
</cfif>

<!--- CHECK FOR VARIABLES AND PROVIDE IF ABSENT --->
<cfparam name="attributes.appID" default="#session.appid#">
<cfparam name="attributes.AppPass" default="3ucl1d">
<cfparam name="attributes.ticket" default="">
<cfparam name="attributes.userip" default="#cgi.remote_addr#">
<cfparam name="attributes.ReturnExtendedAttributes" default="false">
<cfparam name="attributes.webservice" default="https://i4w.ais.ucla.edu/iws/v4.asmx">

<!--- CREATE SOAP REQUEST --->
<cfsavecontent variable="result">
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
<soap:Header>
	<wsConsumerCredential xmlns="http://isis.ais.ucla.edu/ws/">
		<id><cfoutput>#attributes.appID#</cfoutput></id>
		<password><cfoutput>#attributes.AppPass#</cfoutput></password>
	</wsConsumerCredential>
</soap:Header>
<soap:Body>
	<VerifySession xmlns="http://isis.ais.ucla.edu/ws/">
		<ticket><cfoutput>#attributes.ticket#</cfoutput></ticket>
		<userIpAddr><cfoutput>#attributes.userip#</cfoutput></userIpAddr>
		<returnExtendedAttributes><cfoutput>#attributes.ReturnExtendedAttributes#</cfoutput></returnExtendedAttributes>
	</VerifySession>
</soap:Body>
</soap:Envelope>
</cfsavecontent>

<!--- SEND HTTP REQUEST --->
<cfhttp url="#attributes.webservice#" method="post" resolveurl="no">
	<cfhttpparam type="header" name="SOAPAction"  value="http://isis.ais.ucla.edu/ws/VerifySession">
	<cfhttpparam type="xml" name="xml" value="#result#">
</cfhttp> 

<cftry>
	<!--- PARSE RESPONSE --->
	<cfset myxmldoc ="#XMLParse(trim(cfhttp.filecontent))#">
	<cfcatch type="Any">
		<!--- CATCH ERRORS --->
		<cfset caller.response = "ISIS SYSTEM ERROR">
		<cfexit>
	</cfcatch>
</cftry>

<cftry>
	<cfset response = myxmldoc["soap:Envelope"]["soap:Body"]["VerifySessionResponse"]["iwsresponse"]["sessioninfo"].xmlAttributes.status>
	<cfset ticket = myxmldoc["soap:Envelope"]["soap:Body"]["VerifySessionResponse"]["iwsresponse"]["sessioninfo"]["ticket"].xmlAttributes>
	<!--- SAVE TICKET --->
	<cfloop collection="#ticket#" item="ticketvalue">
		<cfoutput>
			<cfset caller.ticket = #ticket[ticketvalue]#>
		</cfoutput>
	</cfloop>
	<!--- SAVE ID --->
	<cfset uclaId = myxmldoc["soap:Envelope"]["soap:Body"]["VerifySessionResponse"]["iwsresponse"]["sessioninfo"]["uclaId"].xmlAttributes>
	<cfloop collection="#uclaId#" item="IDvalue">
		<cfoutput>
			<cfset caller.uclaId = #uclaId[IDvalue]#>
		</cfoutput>
	</cfloop>
	<!--- CATCH ERRORS --->
	<cfcatch type="Any">
		<cfset response =myxmldoc["soap:Envelope"]["soap:Body"]["VerifySessionResponse"]["iwsResponse"]["errorInfo"]["errors"]["error"].xmlAttributes.detail>
		<cfset caller.response="SOAP LOGIN ERROR - #response#">
		<cfexit>
	</cfcatch>
	<cfcatch type="any">
		<cfset caller.response="SOAP LOGIN ERROR - UNSPECIFIED TYPE">
	</cfcatch>
</cftry>

<!--- SAVE RESPONSE --->
<cfif #response# is "expired">
	<cfset caller.response = "EXPIRED TICKET">
<cfelseif #response# is "Unintialized">
	<cfset caller.response = "UNINITIALIZED TICKET">
<cfelseif #response# is "ActivewithCachedCredentials">
	<cfset caller.response = "ACTIVE TICKET/CACHED CREDENTIALS">
<cfelseif #response# is "ActiveWithMultipleCredentials">
	<cfset caller.response = "ACTIVE TICKET/MULTIPLE CREDENTIALS">
	<cfexit>
<cfelse>
	<cfset caller.response = "ACTIVE TICKET">
</cfif>