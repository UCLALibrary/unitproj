<cfif IsDefined("FORM.dsn") is true>
	<cfquery name="qryCheckDSN" datasource="#FORM.dsn#">
		select @@version as sql_version
	</cfquery>

	<cfoutput query="qryCheckDSN">
		<p>#FORM.dsn# is using #sql_version#</p>
	</cfoutput>
</cfif>

<html
<head>
	<title>
		CF SQL Tester
	</title>
	<body>
		<form action="test_sql.cfm" method="post">
		Enter DSN:
		<input type="text" name="dsn">
		<input type="submit" name="submit" value="Test">
		</form>
	</body>
</html>
