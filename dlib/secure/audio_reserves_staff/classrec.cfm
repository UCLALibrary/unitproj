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
	<option value="2015" <cfif srch.year is "2015">selected</cfif>>2015</option>
	<option value="2014" <cfif srch.year is "2014">selected</cfif>>2014</option>
	<option value="2013" <cfif srch.year is "2013">selected</cfif>>2013</option>
	<option value="2012" <cfif srch.year is "2012">selected</cfif>>2012</option>
	<option value="2011" <cfif srch.year is "2011">selected</cfif>>2011</option>
	<option value="2010" <cfif srch.year is "2010">selected</cfif>>2010</option>
	<option value="2009" <cfif srch.year is "2009">selected</cfif>>2009</option>
	<option value="2008" <cfif srch.year is "2008">selected</cfif>>2008</option>
	<option value="2007" <cfif srch.year is "2007">selected</cfif>>2007</option>
	<option value="2006" <cfif srch.year is "2006">selected</cfif>>2006</option>
	<option value="2005" <cfif srch.year is "2005">selected</cfif>>2005</option>
	<option value="2004" <cfif srch.year is "2004">selected</cfif>>2004</option>
	<option value="2003" <cfif srch.year is "2003">selected</cfif>>2003</option>
	<option value="2002" <cfif srch.year is "2002">selected</cfif>>2002</option>
	<option value="2001" <cfif srch.year is "2001">selected</cfif>>2001</option>
	<option value="2000" <cfif srch.year is "2000">selected</cfif>>2000</option>
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
