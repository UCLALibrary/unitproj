<cfif IsDefined("Cookie.edu.ucla.isis4.ticket")>
<cfset attributes.ticket = #Cookie.edu.ucla.isis4.ticket#>
<cfelse>
<cfset caller.response="NO TICKET">
<cfexit>
</cfif> 

	

		<cfparam name="attributes.appID" default="#session.appid#">
		<cfparam name="attributes.AppPass" default="3ucl1d">
		<cfparam name="attributes.ticket" default="">
		<cfparam name="attributes.userip" default="#cgi.remote_addr#">
		<cfparam name="attributes.webservice" default="https://i4w.ais.ucla.edu/iws/v4.asmx">



<cfsavecontent variable="result">
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Header>
    <wsConsumerCredential xmlns="http://isis.ais.ucla.edu/ws/">
      <id><cfoutput>#attributes.appID#</cfoutput></id>
      <password><cfoutput>#attributes.AppPass#</cfoutput></password>
    </wsConsumerCredential>

  </soap:Header>
  <soap:Body>
    <Logout xmlns="http://isis.ais.ucla.edu/ws/">
      <ticket><cfoutput>#attributes.ticket#</cfoutput></ticket>
     <userIpAddr><cfoutput>#attributes.userip#</cfoutput></userIpAddr>
    </Logout>
  </soap:Body>
</soap:Envelope>

</cfsavecontent>
<cfhttp url="#attributes.webservice#" method="post" resolveurl="no">
<cfhttpparam type="cgi" name="SOAPAction"  value="http://isis.ais.ucla.edu/ws/Logout">
  
  <cfhttpparam type="xml" name="xml" value="#result#">
</cfhttp> 

<cftry>
<cfset myxmldoc ="#XMLParse(trim(cfhttp.filecontent))#">
<cfcatch type="Any">
<cfset caller.response = "ISIS SYSTEM ERROR">
<cfexit>
</cfcatch>
</cftry>


<cftry>
<cfset response = myxmldoc["soap:Envelope"]["soap:Body"]["LogoutResponse"]["iwsresponse"]["sessioninfo"].xmlAttributes.status>

<cfcatch type="Any">
<cfset response =myxmldoc["soap:Envelope"]["soap:Body"]["LogoutResponse"]["iwsResponse"
]["errorInfo"]["errors"]["error"].xmlAttributes.detail>
<cfset caller.response="SOAP LOGIN ERROR - #response#">
<cfexit>
</cfcatch>


<cfcatch type="any">
<cfset caller.response="SOAP LOGIN ERROR - UNSPECIFIED TYPE">
</cfcatch>
</cftry>

<cfset caller.response = "LOGGED OUT">