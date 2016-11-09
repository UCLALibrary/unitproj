</div>
<!-- begin footer -->
<cfif not prt>
</table>
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td nowrap="nowrap">
</cfif>
<div id="footer">
<p>
Updated:
	<cfoutput>
		<cfif isDefined("updatedDT")>
			<cfif isDate(updatedDT)>
				#DateFormat(updatedDT, "mmmm d, yyyy")#
			<cfelse>
				Unrecognized date format			
			</cfif>			
		<cfelse>
			Unknown
		</cfif>
	</cfoutput><br>
</p>
</div>
<cfif not prt>
		</td>
	</tr>
</table>
</cfif>
</body>
</html>
