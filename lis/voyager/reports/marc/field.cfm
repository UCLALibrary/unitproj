<cfscript>
	if ( IsDefined("FORM.submit") ) {
		m_db = FORM.db;
		m_type = FORM.type;
		m_tag = FORM.tag;
		m_sort = FORM.sort;
		m_max = FORM.max;
	}
	else {
		// either Reset was submitted, or didn't come to page through form
		// make sure variables are defined and initialized
		m_db = "";
		m_type = "";
		m_tag = "";
		m_sort = "";
		m_max = 10;
	}
</cfscript>

<html>
<head>
	<title>Voyager MARC Field Reporter</title>
</head>
<body>
	<h3>Voyager MARC Field Report</h3>
	<p>Select database, record type, and MARC tag (all 3 digits, e.g., 008 or 247 or 920).</p>
<cfoutput>
	<form id='qryFields' method='post'>
		<label for='db'>Database:</label>
		<select name='db'>
			<option value='ucladb' <cfif m_db is "ucladb">selected</cfif>>UCLA</option>
			<option value='ethnodb' <cfif m_db is "ethnodb">selected</cfif>>Ethno</option>
			<option value='filmntvdb' <cfif m_db is "filmntvdb">selected</cfif>>FATA</option>
		</select>
		<label for='type'>Record Type:</label>
		<select name='type'>
			<option value='bib' <cfif m_type is "bib">selected</cfif>>Bibliographic</option>
			<option value='mfhd' <cfif m_type is "mfhd">selected</cfif>>Holdings</option>
			<option value='auth' <cfif m_type is "auth">selected</cfif>>Authority</option>
		</select>
		<label for='tag'>Tag:</label>
		<input type='text' name='tag' minlength='3' maxlength='3' size='5' required autofocus value='#m_tag#'>
		<label for='sort'>Selection:</label>
		<select name='sort'>
			<option value='asc' <cfif m_sort is "asc">selected</cfif>>First</option>
			<option value='desc' <cfif m_sort is "desc">selected</cfif>>Last</option>
		</select>
		<label for='max'>How many:</label>
		<input type='text' name='max' min='1' max='250' size='5' value='#m_max#'>
		<input type='submit' name='submit' value='Go'>
		<input type='submit' name= 'reset' value='Reset'>
	</form>
</cfoutput>

<cfif m_tag is not "">
	<cfquery name='qryFields' datasource='#DSN#' result='tmp'>
		with base as (
		  select
		    record_id
		  , field_seq
		  , indicators
		  from vger_subfields.#m_db#_#m_type#_subfield
		  where tag like '#m_tag#%'
		  order by record_id #m_sort#
		)
		, fewer as (
		  select *
		  from base
		  where rownum < (#m_max# + 101)
		  order by record_id #m_sort#
		)
		, d as (
		  select distinct
		    record_id
		  , replace(indicators, ' ', '_') as indicators
		  ,	vger_subfields.GetFieldFromSubfields(record_id, field_seq, '#m_type#', '#m_db#') as fld
		  from fewer
		  order by record_id #m_sort#
		)
		select *
		from d
		where rownum < (#m_max# + 1)
	</cfquery>

	<cfoutput>#tmp.sql#</cfoutput>
	<p><cfoutput>Displaying #qryFields.recordCount# fields</cfoutput></p>
	<table border='1'>
	<cfoutput query='qryFields'>
		<tr>
			<td>#record_id#</td>
			<td>#indicators#</td>
			<td>#fld#</td>
		</tr>
	</cfoutput>
	</table>
</cfif>

</body>
</html>
