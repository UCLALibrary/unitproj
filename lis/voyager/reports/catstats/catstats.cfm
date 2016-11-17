<cfscript>
	if ( IsDefined("FORM.submit") ) {
		m_948k = FORM.948k;
		m_cataloger = FORM.cataloger;
		m_catcenter = FORM.catcenter;
		m_language = FORM.language;
		m_month = FORM.month;
		m_placecode = FORM.placecode;
		m_report = FORM.report;
		m_sqlfile = "report" & m_report & ".cfm";
		if (m_report NEQ "NONE") {
			m_query = true;
		}
		else {
			m_query = false;
		}
		// checkboxes are only defined in FORM if checked
	}
	else {
		// either Reset was submitted, or didn't come to page through form
		// make sure variables are defined and initialized
		m_948k = "";
		m_cataloger = "";
		m_catcenter = "ALL";
		m_language = "";
		m_month = "";
		m_placecode = "";
		m_report = "";
		m_sqlfile = "";
		m_query = false;
	}

</cfscript>

<html>
<head>
	<title>Cataloging Statistics Reports<cfif FindNoCase("dev", cgi.server_name) gt 0> - DEVELOPMENT</cfif></title>
</head>
<body>
<cfif m_query eq true>
	<cfinclude template="#m_sqlfile#">
</cfif>
<form name="reports" id="reports" action="catstats.cfm" method="post">
<cfoutput>
<table border="0">
	<tr valign="top" align="left">
		<th>Report</th>
		<th>Cataloging Center</th>
		<th>Month</th>
		<th>Cataloger</th>
		<th>Lang</th>
		<th>Place</th>
		<th>948 $k</th>
	</tr>
	<tr valign="top" align="left">
		<td>
			<select name="report" id="report">
				<!--- Numbering is important - value is used to find the correct CFM file --->
				<option value="01" <cfif m_report is "01">selected</cfif>> 1: New titles by format & difficulty</option>
				<option value="02" <cfif m_report is "02">selected</cfif>> 2: Maintenance by format & difficulty</option>
				<option value="03" <cfif m_report is "03">selected</cfif>> 3: New titles by 948 $e & difficulty</option>
				<option value="04" <cfif m_report is "04">selected</cfif>> 4: Maintenance by 948 $e & difficulty</option>
				<option value="05" <cfif m_report is "05">selected</cfif>> 5: National contributions</option>
				<option value="06" <cfif m_report is "06">selected</cfif>> 6: Authority contributions</option>
				<option value="07" <cfif m_report is "07">selected</cfif>> 7: New titles by format & enc level</option>
				<option value="08" <cfif m_report is "08">selected</cfif>> 8: New titles by format & record source</option>
				<option value="09" <cfif m_report is "09">selected</cfif>> 9: Maintenance (broad)</option>
				<option value="10" <cfif m_report is "10">selected</cfif>>10: Maintenance (details)</option>
				<option value="11" <cfif m_report is "11">selected</cfif>>11: National contributions by format</option>
				<option value="NONE" <cfif m_report is "NONE">selected</cfif>>--- Cleanup reports ---</option>
				<option value="c01" <cfif m_report is "c01">selected</cfif>>Invalid 948 $a</option>
				<option value="c03" <cfif m_report is "c03">selected</cfif>>Invalid 948 $c</option>
				<option value="c02" <cfif m_report is "c02">selected</cfif>>Invalid 948 $d</option>
				<option value="c09" <cfif m_report is "c09">selected</cfif>>Invalid 948 $e</option>
				<option value="c08" <cfif m_report is "c08">selected</cfif>>Invalid 948 $g</option>
				<option value="c07" <cfif m_report is "c07">selected</cfif>>Invalid 948 $h</option>
				<option value="c04" <cfif m_report is "c04">selected</cfif>>Missing and incorrect subfields</option>
				<option value="c05" <cfif m_report is "c05">selected</cfif>>No 948 field</option>
				<option value="c06" <cfif m_report is "c06">selected</cfif>>Repeated nonrepeatable subfields</option>
			</select>
		</td>
		<td>
			<select name="catcenter" id="catcenter">
				<option value="ALL" <cfif m_catcenter is "ALL">selected</cfif>>--- ALL ---</option>
				<option value="bhd" <cfif m_catcenter is "bhd">selected</cfif>>Biomed History Division</option>
				<option value="cmc" <cfif m_catcenter is "cmc">selected</cfif>>Cataloging & Metadata Center</option>
				<option value="cmc crs" <cfif m_catcenter is "cmc crs">selected</cfif>>Cataloging & Metadata Center CRS</option>
				<option value="cmc crs shp" <cfif m_catcenter is "cmc crs shp">selected</cfif>>Cataloging & Metadata Center CRS SHP</option>
				<option value="cmc mono" <cfif m_catcenter is "cmc mono">selected</cfif>>Cataloging & Metadata Center Mono</option>
				<option value="clk" <cfif m_catcenter is "clk">selected</cfif>>Clark Library</option>
				<option value="eal" <cfif m_catcenter is "eal">selected</cfif>>East Asian Library</option>
				<option value="iml" <cfif m_catcenter is "iml">selected</cfif>>Instructional Media Library</option>
				<option value="law" <cfif m_catcenter is "law">selected</cfif>>Law Library</option>
				<option value="macq" <cfif m_catcenter is "pacq">selected</cfif>>Music Acquisitions</option>
				<option value="pacq" <cfif m_catcenter is "pacq">selected</cfif>>Print Acquisitions</option>
				<option value="spc" <cfif m_catcenter is "spc">selected</cfif>>Special Collections (YRL)</option>
				<option value="isr" <cfif m_catcenter is "ssda">selected</cfif>>SSDA</option>
				<option value="ues" <cfif m_catcenter is "ues">selected</cfif>>University Elementary School</option>
			</select>
		</td>
		<td>
			<select name="month" id="month">
				<option value="ALL" <cfif m_month is "ALL">selected</cfif>>-- ALL ---</option>
			<cfscript>
				// list months from now back to July 2007 (when stats capture began)
				// 20080625 akohler: per slayne, added support for fiscal years
				start = CreateDate(2007, 07, 01);
				end = Now();
				while (DateCompare(end, start, "d") gte 0) {
					month = Month(end);
					shortmonth = Left(MonthAsString(month), 3);
					year = Year(end);
					value = year & IIf(month lt 10, "0" & month, month);
					displayvalue = shortmonth & "&nbsp;" & year;
					WriteOutput('<option value="#value#" #IIf(value eq m_month, DE("selected"), DE(""))#>#displayvalue#</option>');
					// if the month is July, add an entry for the fiscal year starting that month
					if (month eq 7) {
						// include start and end yyyymm; will be used for BETWEEN comparison in SQL so final month is one greater than end of fiscal year
						value = year & "07-" & year + 1 & "07";
						displayvalue = "FY&nbsp;" & year & "/" & year + 1;
						WriteOutput('<option value="#value#" #IIf(value eq m_month, DE("selected"), DE(""))#>#displayvalue#</option>');
					}
					end = DateAdd("m", -1, end);
				}
			</cfscript>
			</select>
		</td>
		<td>
			<input name="cataloger" id="cataloger" type="text" size="10" <cfif m_cataloger is not "">value="#m_cataloger#"</cfif>>
		</td>
		<td>
			<input name="language" id="language" type="text" size="3" maxlength="3" <cfif m_language is not "">value="#m_language#"</cfif>>
		</td>
		<td>
			<input name="placecode" id="placecode" type="text" size="3" maxlength="3" <cfif m_placecode is not "">value="#m_placecode#"</cfif>>
		</td>
		<td>
			<input name="948k" id="948k" type="text" size="15" <cfif m_948k is not "">value="#m_948k#"</cfif>>
		</td>
	</tr>
	<tr valign="top" align="left">
		<td colspan="6">
			<input name="submit" id="submit" type="submit" value="Run Report">
			<input name="reset" id="reset" type="submit" value="Reset">
		</td>
	</tr>
</table>
</cfoutput>
</form>
<hr>
<cfif IsDefined("qry948")>
	<cfif qry948.RecordCount GT 0>
	<cfset metadata = getMetaData(qry948)>
	<table border="1">
	<cfoutput>
		<tr>
		<cfloop index="col" from="1" to="#ArrayLen(metadata)#">
			<th>#metadata[col].Name#
			</th>
		</cfloop>
		</tr>
	</cfoutput>
		<cfoutput query="qry948">
			<tr valign="top">
			<cfloop index="col" from="1" to="#ArrayLen(metadata)#">
				<td <cfif metadata[col].TypeName eq "NUMBER">align="right"</cfif>>
					<cfset m_cellvalue = qry948["#metadata[col].Name#"][currentRow]>
					<cfif m_cellvalue neq "0">#m_cellvalue#</cfif>
					&nbsp;
				</td>
			</cfloop>
			</tr>
		</cfoutput>
	</table>
	<cfelse>
		There are no statistics matching your criteria.
	</cfif>
</cfif>

</body>
</html>
