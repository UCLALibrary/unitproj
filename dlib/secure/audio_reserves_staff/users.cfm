<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Manage Admin Users</title>
</head>
<LINK href="audio.css" rel="stylesheet" type="text/css">

<body>

<cfif isDefined("url.ed")>
	<cfset ed=url.ed>
<cfelse>
	<cfset ed=0>
</cfif>

<cfif isDefined("url.id")>
	<cfset id=url.id>
<cfelse>
	<cfset id=0>
</cfif>

<cfif isDefined("url.newid")>
	<cfset newid=url.newid>
<cfelse>
	<cfset newid=0>
</cfif>

<cfif isDefined("url.cancel")>
	<cfquery name="del" datasource="#dsn#">
    delete from login where id=#newid#
    </cfquery>
</cfif>

<cfinclude template="head.cfm">

<h2>Administrative Users</h2>

<cfquery name="users" datasource="#dsn#">
select * from login order by ID
</cfquery>

<cfform action="updUsers.cfm">

<table cellspacing="0" cellpadding="3" border="1">
<tr><th align="left">ID</th><th align="left">Username</th><th align="left">Full name</th><th align="left">Action</th></tr>
<cfoutput query="users">
<tr>
	<td>#users.ID#</td>
    <td>
    	<cfif variables.id is users.id and ed is 1>
        	<input name="username" type="text" value="#trim(users.username)#" size="16" maxlength="16" />
        	</td><td>
            <input name="name" type="text" value="#trim(users.name)#" size="50" maxlength="50" />            
            <input name="id" type="hidden" value="#users.id#" />
        <cfelse>
	        #users.username#
            </td><td>
            #users.name#
        </cfif>
    </td>
    <td>
    <cfif ed is 0>
    	<a href="users.cfm?ed=1&id=#users.id#">edit</a>
    <cfelseif ed is 1 and variables.id is users.id>
		<cfinput type="submit" name="submit" value="SAVE DATA" />
        [<a href="users.cfm<cfif newid is not 0>?newid=#users.id#&cancel</cfif>">cancel</a>]
    <cfelse>
    	&nbsp;
    </cfif>
</tr>
</cfoutput>
</table>

<br /><br />

<cfif ed is not 1>
	<a href="newUser.cfm">ADD NEW ADMIN USER</a>
</cfif>

</cfform>

<cfinclude template="foot.cfm">

</body>
</html>
