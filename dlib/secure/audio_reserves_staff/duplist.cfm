<cfset classid=url.classid>

<cfquery name="srch" datasource="#dsn#">
select * from classes 
where classid=#variables.classid#
</cfquery>

<cfquery name="classlist" datasource="#dsn#">
select * from link
where classid=#variables.classid#
</cfquery>

<cfset newtitle=srch.title&"  *** DUPLICATE ***">

<cfquery name="insertclass" datasource="#dsn#">
insert into 
	classes (
    	instructorID,
    	department,
    	classnumber,
    	title,
    	year,
    	quarter,
    	password,
    	facultyNote,
    	TAs)
    values (
    	#srch.instructorID#,
		'#srch.department#',
		'#srch.classnumber#',
		'#variables.newtitle#',
		'#srch.year#',
		'#srch.quarter#',
		'#srch.password#',
		'#srch.facultyNote#',
		'#srch.TAs#')
</cfquery>

<cfquery name="findID" datasource="#dsn#">
	select classid from classes
	order by classid
</cfquery>
<cfoutput query="findID">
	<cfset newclassid=findID.classid>
</cfoutput>

<cfloop query="classlist">
	<cfquery name="insertlinks" datasource="#dsn#">
	insert into
		link (
    		workID,
        	classID,
        	annotation,
        	items)
    	values (
    		#classlist.workID#,
            #variables.newclassid#,
            '#classlist.annotation#',
            '#classlist.items#')
	</cfquery>
</cfloop>

<cflocation url="classrec.cfm?t=view&classid=#variables.newclassid#&listadd=no">