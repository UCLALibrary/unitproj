<html>
<head>
<title>UCLA Music Library: Digital Audio Reserves </title>
</head>

<cfset session.reservelist="yes">

<body bgcolor="ffffff">

<p><font face="Verdana, Arial, Helvetica, sans-serif">
<font size=+1><a href="http://www.library.ucla.edu/libraries/music/" style="text-decoration: none" target="_top">UCLA Music Library</a></font><br>
<font size=+2>Digital Audio Reserves</font></font></p>

<cfif len(trim(form.instructor)) is not 0 and len(trim(form.password)) is not 0>

<cfquery name="access" datasource="#dsn#">
select * from passwords
	where passwords.instructor = '#form.instructor#'
		and passwords.password = '#form.password#'
</cfquery>

<cfif access.recordcount is not 0>

<cfset session.usern=form.instructor>

<cfquery name="yearquarter" datasource="#dsn#">
select * from currentquarter
</cfquery>
<cfquery name="class1" datasource="#dsn#">
select * from classes, currentquarter
	where classes.quarter = currentquarter.quarter
	and classes.year = currentquarter.year
	order by instructor
</cfquery>
<cfquery name="class2" datasource="#dsn#">
select * from classes, currentquarter
	where classes.quarter = currentquarter.quarter
	and classes.year = currentquarter.year
	order by department, classnumber
</cfquery>
<cfquery name="class3" datasource="#dsn#">
select * from classes, currentquarter
	where classes.quarter = currentquarter.quarter
	and classes.year = currentquarter.year
	order by title
</cfquery>

<cfoutput query="yearquarter">
<p><font face="Verdana, Arial, Helvetica, sans-serif"><b>#quarter# #year#</b>
</font></cfoutput>
<p></p>

      <p>Choose a class from one of the 
        dropdown lists below and click Submit:</p>

<form action="audioreserves.cfm" method="post">
<select name="classid">
	<option value="none">Classes arranged by Instructor:<option>
	<cfoutput query="class1">
	<option value="#class1.classid#">#class1.instructor# - #class1.department# #class1.classnumber# - #class1.title#</option>
	</cfoutput>
	<option value="none"></option>
	<option value="all">LIST AUDIO RESERVES	FOR ALL CLASSES</option>
</select>
<input type="submit" name="submitform" value="Submit">
</form>

<form action="audioreserves.cfm" method="post">
<select name="classid">
	<option value="none">Classes arranged by Department:<option>
	<cfoutput query="class2">
	<option value="#class2.classid#">#class2.department# #class2.classnumber# - #class2.title# (#class2.instructor#)</option>
	</cfoutput>
	<option value="none"></option>
	<option value="all">LIST AUDIO RESERVES	FOR ALL CLASSES</option>
</select>
<input type="submit" name="submitform" value="Submit">
</form>

<form action="audioreserves.cfm" method="post">
<select name="classid">
	<option value="none">Classes arranged by Title:<option>
	<cfoutput query="class3">
	<option value="#class3.classid#">#class3.title# - #class3.department# #class3.classnumber# (#class3.instructor#)</option>
	</cfoutput>
	<option value="none"></option>
	<option value="all">LIST AUDIO RESERVES	FOR ALL CLASSES</option>
</select>
<input type="submit" name="submitform" value="Submit">
</form>

<cfelse>
	<p><font face="Verdana, Arial, Helvetica, sans-serif">Access denied. <a href="access.htm" style="text-decoration: none">Return</a> to the previous page and try again, or choose a link below.</font></p>
</cfif>

<cfelse>
	<p><font face="Verdana, Arial, Helvetica, sans-serif">Access denied. <a href="access.htm" style="text-decoration: none">Return</a> to the previous page and try again, or choose a link below.</font></p>
</cfif>

<hr>
		
<table border="0" cellpadding="5">
  <tr><td>
<p>
<font size="-1"><b>[Email questions/problems to 
<a href="mailto:sdavison@library.ucla.edu" style="text-decoration: none">sdavison@library.ucla.edu</a>]</b></font><br>
<font size="-1"><b>[Some information <a href="digitalaudioinfo.htm" style="text-decoration: none">about these pages.</a>]</b></font>
</td><td>
<p>
<font size="-1"><b>[Back to <a href="http://www.library.ucla.edu/libraries/music/reserves" style="text-decoration: none" target="_top">Music Library Reserves Page</a></font>]</b><br>
<font size="-1"><b>[<a href="http://www.library.ucla.edu/libraries/music/" style="text-decoration: none" target="_top">Music Library Home Page</a>]</b></font>
</td></tr></table>
      
</body>
</html>
