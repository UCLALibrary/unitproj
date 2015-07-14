<cfset session.acctype=session.realtype>
<cfset session.user=session.realuser>
<cfscript>
structDelete(session,"realtype");
structDelete(session,"realuser");
</cfscript>
<cflocation url="index.cfm" addtoken="no">