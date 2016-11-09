<cfif FileExists(#navConfigFile#)>
	<cffile action="read" file="#navConfigFile#" variable="navConfigFile">
	<cfscript>
		navConfigFile = StripCR(navConfigFile);
		navConfigFile = Trim(navConfigFile);
		if (navConfigFile neq "") {
		navConfigArray = ArrayNew(2);
			pairArray = ListToArray(navConfigFile, ";");
			x = 1;
			while (x lte ArrayLen(pairArray)) {
				navConfigArray[x][1] = SpanExcluding(pairArray[x], ",");
				pairArray[x] = RemoveChars(pairArray[x], 1, Evaluate(Len(SpanExcluding(pairArray[x], ",")) + 1));
				navConfigArray[x][2] = pairArray[x];
				x = x + 1;
			}
		}
	</cfscript>
</cfif>
<cfif not isDefined("navConfigArray") or ArrayLen(navConfigArray) eq 0>
&nbsp;
<cfelse>
	<table width="149" border="0" cellpadding="0" cellspacing="0">
	<cfoutput>
		<cfset x = 1>
		<cfloop condition="x lte ArrayLen(navConfigArray)">
	<tr valign="top">
		<td width="129" align="right" class="links"><cfif not Find(navConfigArray[x][2], SCRIPT_NAME)>
		<a href="#navConfigArray[x][2]#"></cfif>#navConfigArray[x][1]#<cfif not Find(navConfigArray[x][2], SCRIPT_NAME)></a>
		</cfif></td>
		<td width="20" align="center">&nbsp;<cfif Find(navConfigArray[x][2], SCRIPT_NAME)>
		<img src="http://www.library.ucla.edu/images/arrow_r_blk.gif"
		alt="Page you are currently viewing" width="5" height="9" vspace="4" align="middle"></cfif></td>
	 </tr>
			<cfset x = x + 1>
		</cfloop>
	</cfoutput>
	</table>
</cfif>