<cfscript>
	if ( IsDefined("FORM.submit") ) {
		m_collection = UCase(FORM.collection);
		m_query = true;
	}
	else {
		// either Reset was submitted, or didn't come to page through form
		// make sure variables are defined and initialized
		m_collection = "";
		m_query = false;
	}
</cfscript>

<html>
	<head>
		<title>Archivists' Toolkit Report AT-23</title>
	</head>
	<body>
		<p>This application generates Excel files of data for an Archivists' Toolkit report, per specs on <a href="https://jira.library.ucla.edu/browse/AT-23">AT-23</a>.</p>
		<p>Please enter the complete collection number with periods and leading zeroes, like <em>LSC.0293</em>, <em>LSC.1204</em> or <em>LSC.2010.06</em>.</p>
		<p>It can take 30-60 seconds to generate files for large collections - please be patient, and only click "Run Report" once.</p>
		<p>Depending on your browser settings, Excel files may be downloaded automatically, or you may be prompted to open/save.</p>
		<hr>
		<cfoutput>
		<form action="at23.cfm" method="post">
			<label for="collection">Collection:</label>
			<input type="text" size="30" maxlength="30" name="collection" id="collection" autofocus <cfif m_collection is not "">value="#m_collection#"</cfif>>
			<input name="submit" id="submit" type="submit" value="Run Report">
			<input name="reset" id="reset" type="submit" value="Reset">
		</form>
		</cfoutput>
		
		<cfif m_query eq true>
			<cfset m_filename = #m_collection# & ".xlsx">
			<!--- Make sure collection has enough delimiters by appending a period, so part 3 will always exist, though may be empty --->
			<cfset m_delimiter = ".">
			<cfset m_collection &= m_delimiter>
			<cfset parts = ListToArray(#m_collection#, m_delimiter, true)>

			<cfquery datasource="#dsn#" name="qryMain">
				<cfinclude template="sql/at23_base_sql.cfm">
				<cfinclude template="sql/at23_main.sql">
			</cfquery>

			<cfquery datasource="#dsn#" name="qrySeries">
				<cfinclude template="sql/at23_base_sql.cfm">
				<cfinclude template="sql/at23_series.sql">
			</cfquery>

			<cfquery datasource="#dsn#" name="qrySubseries">
				<cfinclude template="sql/at23_base_sql.cfm">
				<cfinclude template="sql/at23_subseries.sql">
			</cfquery>

			<cfquery datasource="#dsn#" name="qryFiles">
				<cfinclude template="sql/at23_base_sql.cfm">
				<cfinclude template="sql/at23_files.sql">
			</cfquery>

			<cfscript>
				// Create Excel workbook with first sheet named "Main", and in Excel 2007+ XML format
				workbook = SpreadsheetNew("Main", "true");
				
				// Create and format header row for current sheet
				SpreadsheetAddRow(workbook, "TItle, Note Type, Content");
				SpreadsheetFormatRow(workbook, {bold=true, underline=true}, 1);
				// Put data from main query on Main sheet, which was created with the workbook
				SpreadsheetAddRows(workbook, qryMain);
				
				// Add the 3 other sheets, make each active, add header row, and add data from the relevant query to each sheet
				SpreadsheetCreateSheet(workbook, "Series");
				SpreadsheetSetActiveSheet(workbook, "Series");
				SpreadsheetAddRow(workbook, "TItle, Note Type, Content");
				SpreadsheetFormatRow(workbook, {bold=true, underline=true}, 1);
				SpreadsheetAddRows(workbook, qrySeries);
				
				SpreadsheetCreateSheet(workbook, "Subseries");
				SpreadsheetSetActiveSheet(workbook, "Subseries");
				SpreadsheetAddRow(workbook, "TItle, Note Type, Content");
				SpreadsheetFormatRow(workbook, {bold=true, underline=true}, 1);
				SpreadsheetAddRows(workbook, qrySubseries);
				
				SpreadsheetCreateSheet(workbook, "Files");
				SpreadsheetSetActiveSheet(workbook, "Files");
				// Files data is different from other sheets
				SpreadsheetAddRow(workbook, "TItle, Date Expression, Label 1, Label 2, Label 3, Note Type, Content");
				SpreadsheetFormatRow(workbook, {bold=true, underline=true}, 1);
				SpreadsheetAddRows(workbook, qryFiles);

				// Autosize each column to width of its data, using underlying POI Excel library functions
				// Sheets/columns are 0-based here for POI functions.
				// First 3 sheets have 3 columns; 4th has 7, handle separately.
				// Hostek not yet using CF 2016 so SpreadsheetGetColumnCount function not available.
				for (sheet = 0; sheet <= 3; sheet++) {
					if (sheet <= 2) {
						numCols = 3;
					}
					else {
						numCols = 7;
					}
					for (col = 0; col < numCols; col++) {
						workbook.getWorkBook().getSheetAt( javacast("int", sheet) ).autoSizeColumn( javacast("int", col) );
					}
				}
				
				// Set main sheet as active for when users open the file in Excel
				SpreadsheetSetActiveSheet(workbook, "Main");
			</cfscript>
			
			<cfheader name="content-disposition" value="attachment; filename=#m_filename#">
			<cfcontent type="application/msexcel" variable="#spreadsheetReadBinary(workbook)#" reset="true">

		</cfif>
		
	</body>
</html>