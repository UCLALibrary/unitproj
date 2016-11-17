<cfscript>
	// make sure variables are defined and initialized
	m_donor_code = "";
	m_excel = false;
	// HTML reset doesn't work with dynamically populated forms, so Reset is an form submit action
	if ( (IsDefined("FORM.reset") eq true) ) {
		m_donor_code = "";
		m_excel = false;
	}
	else {
		if ( IsDefined("FORM.donor_code") ) {
			m_donor_code = Trim(FORM.donor_code);
		}
		if ( IsDefined("FORM.excel") ) {
			m_excel = true;
		}
	}
</cfscript>

<html>
<head>
	<title>FATA Donor Report</title>
	<style type="text/css">
		tr { text-align: left; vertical-align: top; }
		th { text-align: center; font-weight: bold; }

	</style>
</head>
<body>
	<cfoutput>
		<form name="search" action="donor_report.cfm" method="post">
			Inventory code:&nbsp;<input type="text" name="donor_code" id="donor_code" size="10" maxlength="10" value="#m_donor_code#">
			<input type="submit" name="submit" value="Search">
			<input type="submit" name="reset" value="Reset">
		</form>
	</cfoutput>

	<!--- Do search, if something to search for --->
	<cfif m_donor_code NEQ "">
		<cfquery name="qryDonorInfo" datasource="#DSN#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
		SELECT
			bt.bib_id
		,	mm.mfhd_id
		,	CASE WHEN bt.uniform_title IS NULL THEN vger_support.unifix(bt.title) ELSE vger_support.unifix(bt.uniform_title || ': ' || bt.title) END AS title
		,	bt.pub_dates_combined AS dates
		,	l.location_code
		,	mm.display_call_no AS inventory_number
		,	vger_subfields.GetFieldFromSubfields(s.record_id,
				(SELECT Min(field_seq) FROM vger_subfields.filmntvdb_mfhd_subfield WHERE record_id = s.record_id AND tag LIKE '903%'), 'mfhd', 'filmntvdb') AS phys_desc
		,	Decode(SubStr(mm.field_008, 8, 1), 'd', 'deposit', 'g', 'gift', 'unknown') AS acq_method
		,	vger_subfields.GetSubfields(s.record_id, '852q, 866z, 866x', 'mfhd', 'fata') AS notes
		,	ib.item_barcode
		FROM vger_subfields.filmntvdb_mfhd_subfield s
		INNER JOIN filmntvdb.mfhd_master mm ON s.record_id = mm.mfhd_id
		INNER JOIN filmntvdb.location l ON mm.location_id = l.location_id
		INNER JOIN filmntvdb.bib_mfhd bm ON mm.mfhd_id = bm.mfhd_id
		INNER JOIN filmntvdb.bib_text bt ON bm.bib_id = bt.bib_id
		LEFT OUTER JOIN filmntvdb.mfhd_item mi ON mm.mfhd_id = mi.mfhd_id
		LEFT OUTER JOIN filmntvdb.item_barcode ib ON mi.item_id = ib.item_id
		LEFT OUTER JOIN filmntvdb.item_barcode_status ibs
			ON ib.barcode_status = ibs.barcode_status_type
			AND ibs.barcode_status_desc = 'Active'
		WHERE s.tag = '905c'
		AND s.subfield = '#m_donor_code#'
		ORDER BY filmntvdb.Norm2(title), mm.mfhd_id
		</cfquery>

		<cfif qryDonorInfo.RecordCount EQ 0>
			<cfoutput>
				<p>Your search for <strong>#m_donor_code#</strong> found no records.</p>
			</cfoutput>
		<cfelse>
			<cfoutput>
				<cfquery name="qryMfhdCount" dbtype="query">
					SELECT COUNT(DISTINCT mfhd_id) AS mfhd_count FROM qryDonorInfo
				</cfquery>
				<cfset m_mfhd_count = qryMfhdCount.mfhd_count>
				<p>Your search for <strong>#m_donor_code#</strong> found #m_mfhd_count# holdings record(s):</p>
			</cfoutput>
			<table border="1">
				<tr>
					<th>Bib ID</th>
					<th>Title</th>
					<th>Dates</th>
					<th>Loc</th>
					<th>Inv Number</th>
					<th>Phys Desc</th>
					<th>Acq Method</th>
					<th>Notes</th>
					<th>Barcodes</th>
				</tr>
			<cfoutput query="qryDonorInfo" group="mfhd_id">
				<tr>
					<td>#bib_id#&nbsp;</td>
					<td>#title#&nbsp;</td>
					<td>#dates#&nbsp;</td>
					<td>#location_code#&nbsp;</td>
					<td>#inventory_number#&nbsp;</td>
					<td>#phys_desc#&nbsp;</td>
					<td>#acq_method#&nbsp;</td>
					<td>#notes#&nbsp;</td>
					<td><cfoutput>#item_barcode#&nbsp;<br></cfoutput></td>
				</tr>
			</cfoutput>
		</cfif> <!--- found records --->
	</cfif> <!--- m_donor_code --->
</body>
</html>
