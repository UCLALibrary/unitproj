<!--- 
	This CF page serves as a software "router" to support the Library Cost Survey Analysis project: https://docs.library.ucla.edu/x/DQTH
	During the survey, users will be redirected here when arriving on or clicking links on library web pages.
	This page then:
	* Shows a survey, if the user hasn't already seen it
	* Records the survey answers in a database
	* Records the target URL in a database
	* Sets a cookie to prevent the survey from appearing again, until the cookie expires

	This application will run in CF clustered environment so memory-resident variables (like Session scope) may not work correctly.
	Cookies must expire 30 minutes from initial setting (not 30 minutes from (re)setting).
    Also need cookies to expire when browser is closed.
	Can't read cookie "expires" field from CF or JS, so have to keep track of overall expiration via cookie value.
	* One cookie for survey session id
	* One cookie for survey expiration
	
	Survey session id (ss) cookie: don't set "expires", not stored on disk, disappears when browser is closed.
	Survey expiration (se) cookie: set "expires", stored on disk, retained when browser is closed, disappears from browser when expires

	10:00	new session
				ss=undefined, se=undefined
				set ss=123, se=10:20
	10:10	request resource
				ss=123, se=10:20
	10:20	se expires
				ss=123, se=undefined
				new session: set ss=234, se=10:40
	10:30	user closes browser
	10:35	user opens browser
				ss=undefined, se=10:40 (se >= now)
				new session: reset ss=345, se=10:55
	10:50	user closes browser
	11:00	user opens browser
				ss=undefined, se=undefined (se < now so expired)
				new session: ss=456, se=11:20

	if se >= now
		if ss //OK
		else //browser was closed
			create new ss
			create new se
		fi
	else //never created, or expired
		create new ss
		create new se
	fi
--->

<!--- Save target URL for later; if there isn't one, bounce the user back to wherever they came from --->
<cfif IsDefined("URL.TARGET") is true>
	<cfset m_target_url = URL.TARGET>
<cfelseif IsDefined("FORM.TARGET") is true>
	<cfset m_target_url = FORM.TARGET>
<cfelse>
	<cflocation url="#CGI.HTTP_REFERER#">
</cfif>

<cfscript>
	m_browser_ip = CGI.REMOTE_ADDR; // browser IP address
	m_ip_parts = ListToArray(m_browser_ip, ".");
	m_ip_num = m_ip_parts[4];
	ArrayDeleteAt(m_ip_parts, 4);
	m_ip_base = ArrayToList(m_ip_parts, ".");
	m_now = Now(); // capture current time for consistent repeated later use
	m_show_survey = false; // show survey only if no cookies or form not just submitted
	m_staff = false; // m_browser_ip corresponds to a Library staff computer
	m_survey_duration = 30; // minutes; 30 recommended by Terry Plum, approved by John Wang 20081120

	function setSessionInfo() {
		m_survsession_id = Hash(m_browser_ip & m_now);
		m_expires = DateAdd("n", m_survey_duration, m_now);
	}
	
	m_target_url = URLDecode(m_target_url);
	m_url = m_target_url;

	// Get session info from cookies, or set new values
	if (IsDefined("COOKIE.LIBCOSTSURVEY_EXPIRES")) {
		// hack: what comes out of the cookie looks like a CF date/time but apparently isn't (when reassigned to cookie's expiration, gives date in 2076)
		// adding 0 appears to coerce it back to a true CF date/time
		m_expires = DateAdd("n", 0, COOKIE.LIBCOSTSURVEY_EXPIRES);

		if (DateCompare(m_expires, m_now) GTE 0) {
			if (IsDefined("COOKIE.LIBCOSTSURVEY_SESSIONID")) {
				m_survsession_id = COOKIE.LIBCOSTSURVEY_SESSIONID;
			}
			else {
				setSessionInfo();
				m_show_survey = true;
			}
		}
 		else {
			setSessionInfo();
			m_show_survey = true;
		}
	}
	else {
		setSessionInfo();
		m_show_survey = true;
	}
	// Don't show survey if it was just submitted (not yet processed, no cookies set yet)
	if (IsDefined("FORM.SUBMIT")) {
		m_show_survey = false;
	}
</cfscript>

<!--- Cached query (1 hour) with staff IP addresses, for whom the survey should not show --->
<cfquery name="qryAllStaffIP" datasource="#LCAS_DSN#" cachedwithin="#CreateTimeSpan(0,1,0,0)#">
	select *
	from lcas_staff_ip_addresses
</cfquery>

<!--- Look up the current IP --->
<cfquery name="qryStaffIP" dbtype="query">
	select count(*) as ip_matches
	from qryAllStaffIP
	where start_ip_base = '#m_ip_base#'
	and #m_ip_num# between start_ip_num and end_ip_num
</cfquery>

<cfif qryStaffIP.ip_matches GT 0>
	<cfset m_staff = true>
	<cfset m_show_survey = false>
</cfif>

<!--- DEBUGGING ONLY--->
<cfif Find("127.0.0.1", CGI.HTTP_HOST) GT 0>
	<cfoutput>
	<ul>
		<li>Target URL: #m_target_url#</li>
		<li>Real URL: #m_url#</li>
		<li>Host: #CGI.HTTP_HOST#</li>
		<li>User IP: #m_browser_ip#</li>
		<li>ip base: #m_ip_base#</li>
		<li>ip num: #m_ip_num#</li>
		<li>Timestamp: handled by database</li>
		<li>Now per CF: #m_now#</li>
		<li>Survey expires: #m_expires#</li>
		<li>Survey session ID: #m_survsession_id#</li>
		<li>Staff PC: #m_staff#</li>
		<li>Show survey: #m_show_survey#</li>
	</ul>
	<p onclick="javascript:window.location='#m_target_url#';">Continue to #m_target_url# ?</p>
	<p onclick="javascript:alert('Cookie: ' + unescape(document.cookie));">Cookie</p>
	</cfoutput>
</cfif>

<!--- Show survey, or record data (target URL data, and survey if submitted) --->
<cfif m_show_survey EQ true>
	<cfinclude template="lcas_survey.cfm">
<cfelse>
	<!--- If survey was submitted, record its data --->
	<cfif isdefined("FORM.SUBMIT")>
		<cfinclude template="lcas_recordsurvey.cfm">
	</cfif>
	
	<!--- Set/update cookies --->
	<cfif Find("127.0.0.1", CGI.HTTP_HOST) GT 0>
		<!--- 2 minute cookie expiration makes testing easier; otherwise use default of 30 minutes set above --->
		<cfset m_expires = DateAdd("n", 2, m_now)>  
	</cfif>
	<cfcookie name="LIBCOSTSURVEY_EXPIRES" value="#m_expires#" domain=".library.ucla.edu" expires="#m_expires#">
	<cfcookie name="LIBCOSTSURVEY_SESSIONID" value="#m_survsession_id#" domain=".library.ucla.edu">
	
	<!--- Capture URL data, regardless of whether survey was submitted --->
	<cfquery name="qryInsertLCAS_URL" datasource="LCAS">
		insert into lcas_urls_2018 (browser_ip, target_url, session_id)
		values (
			  <cfqueryparam value="#m_browser_ip#" cfsqltype="cf_sql_varchar">
			, <cfqueryparam value="#m_target_url#" cfsqltype="cf_sql_varchar">
			, <cfqueryparam value="#m_survsession_id#" cfsqltype="cf_sql_varchar">
		)
	</cfquery>

	<!--- Send user to the requested site after capturing data--->
	<!--- DEBUG / TEST ONLY --->
	<cfif Find("127.0.0.1", CGI.HTTP_HOST) GT 0>
		<cfoutput>Survey data captured; in production, you would be redirected to #m_target_url#</cfoutput>
		<cfabort>
	<cfelse>
		<cflocation url="#m_target_url#">
	</cfif>
</cfif>

