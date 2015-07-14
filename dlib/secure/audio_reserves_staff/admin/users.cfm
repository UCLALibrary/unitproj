<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<!--- <cfquery name="insertUser" datasource="MusAudio">
insert into login(username,password,name,loginType)
values('audiores','digit;1','Student','edit')
</cfquery> --->

<cfquery name="listUsers" datasource="MusAudio">
select * from login
</cfquery>

<body>

<h2>USERS</h2>

<table>
<tr><th>username</th><th>password</th><th>full name</th><th>userType</th></tr>
<cfoutput query="listUsers">
<tr><td>#username#</td><td>#password#</td><td>#name#</td><td>#loginType#</td></tr>
</cfoutput>
</table>

</body>
</html>
