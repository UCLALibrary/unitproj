<table border="0" cellspacing="6" cellpadding="1"><tr valign="top"><td valign="top" colspan=2>

<table bgcolor="#808080" border="0" cellpadding="3" cellspacing="3" width="120">
	<tr valign="top">
		<td align="left" bgcolor="#808080" class="title"><b>&nbsp;digital audio<br>&nbsp;reserves</b> 
		</td>
	</tr>
	<tr valign="top">
		<td align="left" bgcolor="#808080" class="smalltitle"><b>&nbsp;<cfoutput>#session.user#</cfoutput> - <a href="logout.cfm" class="smalltitle">logout</a></b> 
		</td>
	</tr>
	<tr valign="top">
		<td valign="middle" bgcolor="#99CCCC"><br>&nbsp;<strong>browse<br>&nbsp;&nbsp;recordings<br>&nbsp;&nbsp;&nbsp;by:</strong>
			<table border="0" cellpadding="3" cellspacing="3" width="100%">
				<tr>
				<td class="head">
				&nbsp;&nbsp;&nbsp;<a href="fieldlist.cfm?x=composer" class="head">composer</a><br>
				&nbsp;&nbsp;&nbsp;<a href="fieldlist.cfm?x=title" class="head">title</a><br>
				&nbsp;&nbsp;&nbsp;<a href="fieldlist.cfm?x=label" class="head">label</a><br>
				&nbsp;&nbsp;&nbsp;<a href="fieldlist.cfm?x=libraryCallNumber" class="head">call number</a><br>
				&nbsp;&nbsp;&nbsp;<a href="fieldlist.cfm?x=performer" class="head">performer</a><br>
				&nbsp;&nbsp;&nbsp;<a href="fieldlist.cfm?x=filename" class="head">filename</a><br>
				&nbsp;&nbsp;&nbsp;<a href="fieldlist.cfm?x=class" class="head">class info.</a><br><br>
				<a href="newrec.cfm" class="head"><strong>create<br>&nbsp;new record</strong></a><br><br>
				</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr valign="top">
		<td bgcolor="#99CCCC" valign="middle">
			<table border="0" cellpadding="3" cellspacing="3" width="100%">
				<tr><td valign="middle"><br>
				<a href="instructors.cfm?t=list&msg=0" class="head"><strong>instructors</strong></a><br><br></td></tr>
			</table>
		</td>
	</tr>
	<tr valign="top">
		<td bgcolor="#99CCCC" valign="middle">
			<table border="0" cellpadding="3" cellspacing="3" width="100%">
				<tr><td valign="middle"><br>
				<a href="classes.cfm?ord=yr" class="head"><strong>lists</strong></a><br><br></td></tr>
			</table>
		</td>
	</tr>
	<tr valign="top">
		<td bgcolor="#99CCCC" valign="middle">
			<table border="0" cellpadding="3" cellspacing="3" width="100%">
				<tr><td valign="middle"><br>
				<a href="search.cfm" class="head"><strong>search</strong></a><br><br></td></tr>
			</table>
		</td>
	</tr>
	<tr valign="top">
		<td bgcolor="#99CCCC" valign="middle">
			<table border="0" cellpadding="3" cellspacing="3" width="100%">
				<tr><td><br>
				<a href="help.cfm" target="help" class="head"><strong>policies &amp; procedures</strong></a><br><br></td></tr>
			</table>
		</td>
	</tr>
	<cfif trim(session.acctype) neq "readonly">
	<tr valign="top">
		<td bgcolor="#99CCCC" valign="middle">
			<table border="0" cellpadding="3" cellspacing="3" width="100%">
				<tr><td valign="middle"><br>
				<a href="admin.cfm" class="head"><strong>admin</strong></a><br><br></td></tr>
			</table>
		</td>
	</tr>
	</cfif>
	<cfif structKeyExists(session,"realuser")>
	<tr valign="top">
		<td bgcolor="#99CCCC" valign="middle">
			<table border="0" cellpadding="3" cellspacing="3" width="100%">
				<tr><td valign="middle"><br>
				<a href="restore.cfm" class="head"><strong>restore admin</strong></a><br><br></td></tr>
			</table>
		</td>
	</tr>
	</cfif>
	
</table>

<!--- <td bgcolor="#808080" width=1></td> --->
</td><td valign="top">

<!--- <td bgcolor="#808080" align="center"><b>&nbsp;<a href="logout.cfm" class="title">logout</a>&nbsp;</b>
		</td> --->


