<cfset hyph=find("-",form.newquarter)>
<cfset ln=len(form.newquarter)>
<cfset newquarter=left(form.newquarter,hyph-1)>
<cfset newyear=mid(form.newquarter,hyph+1,ln-hyph)>
<cfquery name="setq" datasource="#dsn#">
update currentquarter
set quarter='#variables.newquarter#',
	year='#variables.newyear#'
</cfquery>
<cflocation url="setquarter.cfm?m=done" addtoken="No">