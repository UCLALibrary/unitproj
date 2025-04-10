<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Class record</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<cfif url.t is "new">
	<cfquery name="new" datasource="#dsn#">
	insert into	classes(title) values(' ')
	</cfquery>
	<cfquery name="new2" datasource="#dsn#">
	select classid from classes
	order by classid
	</cfquery>
	<cfoutput query="new2">
	<cfset classid=new2.classid>
	</cfoutput>
<cfelse>
	<cfset classid=url.classid>
</cfif>

<cfquery name="srch" datasource="#dsn#">
select * from classes
where classid=#variables.classid#
</cfquery>

<cfquery name="instructors" datasource="#dsn#">
select * from instructors order by instructor
</cfquery>

<cfquery name="departments" datasource="#dsn#">
select * from departments order by department
</cfquery>

<cfquery name="classlist" datasource="#dsn#">
select * from works,link
where works.workid=link.workid
	and link.classid=#variables.classid#
order by classinfo,composer,title,works.workid
</cfquery>

<cfset isInstructor=false>
<cfif ListContainsNoCase(srch.TAs,session.user)>
	<cfset isInstructor=true>
<cfelse>
	<cfloop query="instructors">
		<cfif srch.instructorID eq instructors.instructorID and trim(instructors.UCLA_ID) eq trim(session.user)><cfset isInstructor=true></cfif>
	</cfloop>
</cfif>

<body>

<cfinclude template="head.cfm">

<cfif url.t neq "view">
<form action="classrec_action.cfm"
      method="post">
</cfif>

<h4>CLASS INFORMATION</h4>

<cfif structKeyExists(url,"needinst")>
	<font color="red">NO INSTRUCTOR WAS SELECTED</font></p>
	<p>
</cfif>

<cfif structKeyExists(url,"needdept")>
	<font color="red">NO DEPARTMENT WAS SELECTED</font></p>
	<p>
</cfif>

<table border="0"
       cellspacing="2"
       cellpadding="2">
<tr>
	<th width="100" align="right">ID:</th>
	<td width="100%"><cfoutput>#classid#</cfoutput></td>
</tr>
<tr>
	<th width="100" align="right">Instructor:</th>
	<td>
	<cfif url.t is "view">
		<cfoutput query="instructors"><cfif instructors.instructorID eq srch.instructorID>#instructors.instructor#</cfif></cfoutput>
	<cfelse>
		<select name="instructorID">
		<option value=" ">CHOOSE AN INSTRUCTOR</option>
		<cfoutput query="instructors">
		<option value="#instructorID#" <cfif srch.instructorID eq instructors.instructorID>selected</cfif>>#instructor#</option>
		</cfoutput>
		</select>
	</cfif>
	</td>
</tr>
<tr>
	<th width="100" align="right">Department:</th>
	<td>
	<cfif url.t is "view"><cfoutput query="srch">#department#</cfoutput>
	<cfelse>
		<select name="department">
		<option value=" ">CHOOSE A DEPARTMENT</option>
		<cfoutput query="departments">
		<option value="#department#" <cfif srch.department eq departments.department>selected</cfif>>#department#</option>
		</cfoutput>
		</select>
	</cfif></td>
</tr>

<cfoutput query="srch">
<input type="hidden" name="classid" value="#variables.classid#">

<tr>
	<th width="100" align="right">Class no.:</th>
	<td>
	<cfif url.t is "view">#classnumber#
	<cfelse><input type="text" name="classnumber" value="#classnumber#" size="15" maxlength="15"></cfif></td>
</tr>
<tr>
	<th width="100" align="right">SRS:</th>
	<td>
	<cfif url.t is "view">#srs#
	<cfelse><input type="text" name="srs" value="#srs#" size="9" maxlength="9"</cfif>
	</td>
</tr>
<tr>
	<th width="100" align="right">Title:</th>
	<td>
	<cfif url.t is "view">#title#
	<cfelse><input type="text" name="title" value="#title#" size="50" maxlength="150"></cfif></td>
</tr>
<tr>
	<th width="100" align="right">Year:</th>
	<td>
	<cfif url.t is "view">#year#
	<cfelse>
	<select name="year">
	<option value="2023" <cfif srch.year is "2023">selected</cfif>>2023</option>
	<option value="2022" <cfif srch.year is "2022">selected</cfif>>2022</option>
	<option value="2021" <cfif srch.year is "2021">selected</cfif>>2021</option>
	<option value="2020" <cfif srch.year is "2020">selected</cfif>>2020</option>
	<option value="2019" <cfif srch.year is "2019">selected</cfif>>2019</option>
	</select>
	</cfif></td>
</tr>
<tr>
	<th width="100" align="right">Quarter:</th>
	<td>
	<cfif url.t is "view">#quarter#
	<cfelse>
	<select name="quarter">
	<option value="Fall" <cfif srch.quarter is "Fall">selected</cfif>>Fall</option>
	<option value="Winter" <cfif srch.quarter is "Winter">selected</cfif>>Winter</option>
	<option value="Spring" <cfif srch.quarter is "Spring">selected</cfif>>Spring</option>
	<option value="Summer" <cfif srch.quarter is "Summer">selected</cfif>>Summer</option>
	</select>

	</cfif></td>
</tr>
<tr>
	<th align="right">Password:</th>
	<td>
	<cfif url.t is "view"><cfif (trim(session.acctype) neq "readonly") or (isInstructor)>#password#</cfif>
	<cfelse>
	<input type="text" name="password" value="#password#" size="20" maxlength="20">
	</cfif>
	</td>
</tr>
<tr>
	<th align="right">Faculty Note:</th>
	<td>
	<cfif url.t is "view">#facultyNote#
	<cfelse>
	<textarea wrap="virtual"
			name="facultyNote"
			rows="3"
			cols="69"
			class="general">#facultyNote#</textarea>
	</cfif>
	</td>
</tr>
<tr>
	<th align="right" valign="top">TAs:</th>
	<td>
	<cfif url.t is "view"><cfloop index="looper" list="#TAs#">#looper#<br></cfloop>
	<cfelse>
	<cfloop index="looper" from="1" to="#ListLen(TAs)#">
		<input type="text" name="TA#looper#" value="#ListGetAt(TAs,looper)#" size="20" maxlength="20"><br>
	</cfloop>
	<input type="text" name="TA#looper#" value="" size="20" maxlength="20">
	</cfif>
	</td>
</tr>
<tr><th></th><td><a href="../../audio_reserves/eres.cfm?i=#classid#" class="go2">PUBLIC WEBSITE</a></td></tr>
<tr>
	<th width="100"></th>
	<td>
	<cfif url.t is "view">
		<cfif (trim(session.acctype) neq "readonly") or (isInstructor)>
			<a href="classrec.cfm?t=edit&classid=#classid#&listadd=no" class="go2">EDIT RECORD</a>
			<cfif classlist.recordcount is 0>
				/ <a href="delete_classrec.cfm?classid=#classid#" class="go2">DELETE RECORD</a>
			</cfif>
            </td></tr>
            <tr><td></td><td>
        	<a href="duplist.cfm?classid=#classid#" class="go2">DUPLICATE THIS LIST</a>
		</cfif>
	<cfelse>
	&nbsp;</td></tr><tr><td></td><td>
	<input type="submit" value="SAVE">
	</td>
    </tr>
	</cfif>


<tr><td colspan="2">&nbsp;</td></tr>
</cfoutput>

<cfif url.t is "view">
	<tr><td colspan="2"><hr noshade></td></tr>
	<tr><td colspan="2">
	<p><b><u>LISTENING LIST</u></b></p>

	<cfif url.listadd is "yes">
		<cfquery name="complist" datasource="#dsn#">
		select workid,composer,title,label,labelnumber,librarycallnumber,classinfo from works
		<cfif url.addby is "id">
		order by workid
		<cfelseif url.addby is "cn">
		order by librarycallnumber,workid
		<cfelseif url.addby is "ct">
		order by composer,title,workid
		<cfelseif url.addby is "ci">
		order by classinfo,workid
		</cfif>
		</cfquery>
		<form action="classaddrec.cfm" method="post">
		<input type="hidden" name="classid" value="<cfoutput>#variables.classid#</cfoutput>">
		<select name="workid">
		<cfoutput query="complist">
		<option value="#complist.workid#">
		<cfif url.addby is "id">
			ID: #workid#
			<cfif composer neq ""> &mdash; #trim(left(composer,20))#... </cfif>
			<cfif title neq ""> &mdash; #trim(left(title,20))#...</cfif>
			<cfif librarycallnumber neq ""> &mdash; #librarycallnumber#</cfif>
		<cfelseif url.addby is "cn">
			<cfif librarycallnumber neq "">#librarycallnumber#</cfif>
			 &mdash; ID: #workid#
			<cfif composer neq ""> &mdash; #trim(left(composer,20))#... </cfif>
			<cfif title neq ""> &mdash; #trim(left(title,20))#...</cfif>
		<cfelseif url.addby is "ct">
			<cfif composer neq "">#trim(left(composer,20))#... </cfif>
			<cfif title neq ""> &mdash; #trim(left(title,20))#...</cfif>
			 &mdash; ID: #workid#
			<cfif librarycallnumber neq ""> &mdash; #librarycallnumber#</cfif>
		<cfelseif url.addby is "ci">
			<cfif classinfo neq "">#trim(left(classinfo,20))#...</cfif>
			 &mdash; ID: #workid#
			<cfif composer neq ""> &mdash; #trim(left(composer,20))#... </cfif>
			<cfif title neq ""> &mdash; #trim(left(title,20))#...</cfif>
		</cfif>
		</option>
		</cfoutput>
		</select>
		<input type="submit" value="ADD">
		</form>
	<cfelseif (trim(session.acctype) neq "readonly") or (isInstructor)>
		<cfoutput><p>ADD TO LIST: FIND BY
		[<a href="classrec.cfm?t=view&listadd=yes&addby=id&classid=#classid#" class="go2">ID</a>] /
		[<a href="classrec.cfm?t=view&listadd=yes&addby=cn&classid=#classid#" class="go2">CALL NUMBER</a>] /
		[<a href="classrec.cfm?t=view&listadd=yes&addby=ct&classid=#classid#" class="go2">COMPOSER &amp; TITLE</a>] /
		[<a href="classrec.cfm?t=view&listadd=yes&addby=ci&classid=#classid#" class="go2">CLASS INFO</a>]
		</p></cfoutput>
	</cfif>

	<table border="1" cellspacing="0" cellpadding="2">
	<cfset n=1>
	<cfoutput query="classlist">
	<tr><td align="right">#n#</td><td><cfif incl>[#classinfo#] </cfif>#composer# <em>#title#</em></td><td width="60" align="center"><a href="singlerec.cfm?ed=no&ited=no&id=#workid#" class="go2">GO TO</a></td>
<cfif (trim(session.acctype) neq "readonly") or (isInstructor)>
<td width="75" align="center"><a href="classlistdelete.cfm?workid=#workid#&classid=#classid#" class="go2">REMOVE</a></td>
</cfif>
</tr>
	<cfset n=n+1>
	</cfoutput>
	</table>
	</td></tr>
<cfelse>
	</form>
</cfif>
</table>

<cfinclude template="foot.cfm">

</body>
</html>
