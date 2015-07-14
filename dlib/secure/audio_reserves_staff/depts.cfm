<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Manage Departments</title>
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
    delete from departments where id=#newid#
    </cfquery>
</cfif>

<cfinclude template="head.cfm">

<h2>Departments</h2>

<cfquery name="depts" datasource="#dsn#">
select * from departments order by ID
</cfquery>

<cfform action="updDepts.cfm">

<table cellspacing="0" cellpadding="3" border="1">
<tr><th align="left">ID</th><th align="left">Department</th><th align="left">Action</th></tr>
<cfoutput query="depts">
<tr>
	<td>#depts.ID#</td>
    <td>
    	<cfif variables.id is depts.id and ed is 1>
        	<input name="department" type="text" value="#trim(depts.department)#" size="50" maxlength="50" />
            <input name="id" type="hidden" value="#depts.id#" />
        <cfelse>
	        #depts.department#
        </cfif>
    </td>
    <td>
    <cfif ed is 0>
    	<a href="depts.cfm?ed=1&id=#depts.id#">edit</a>
    <cfelseif ed is 1 and variables.id is depts.id>
		<cfinput type="submit" name="submit" value="SAVE DATA" />
        [<a href="depts.cfm<cfif newid is not 0>?newid=#depts.id#&cancel</cfif>">cancel</a>]
    <cfelse>
    	&nbsp;
    </cfif>
</tr>
</cfoutput>
</table>

<br /><br />

<cfif ed is not 1>
	<a href="newDept.cfm">ADD NEW DEPARTMENT</a>
</cfif>

</cfform>

<cfinclude template="foot.cfm">

</body>
</html>
