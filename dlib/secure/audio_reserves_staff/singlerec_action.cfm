<cfif isDefined("form.status")>
	<cfif form.status eq 5>
		<cfset deleteOn=form.deleteOn>
	<cfelse>
		<cfset deleteOn="">
	</cfif>
	<cfset status=form.status>
<cfelse>
	<cfset status=0>
	<cfset deleteOn="">
</cfif>
<cfif isDefined("form.liborder")>
	<cfset liborder=1>
<cfelse>
	<cfset liborder=0>
</cfif>
<cfif isDefined("form.incl")>
	<cfset incl=1>
<cfelse>
	<cfset incl=0>
</cfif>
<cfif not structKeyExists(form,"edannot") and not structKeyExists(form,"editems")>
<cfquery name="upd" datasource="#dsn#">
update works
			set
				composer='#form.composer#',
				title='#form.title#',
				performers='#form.performers#',
				note1='#form.note1#',
				note2='#form.note2#',
				label='#form.label#',
				labelnumber='#form.labelnumber#',
				librarycallnumber='#form.librarycallnumber#',
				ramlink='#form.ramlink#',
				baseaddress='#form.baseaddress#',
				classinfo='#form.classinfo#',
				status=#variables.status#,
				recsource='#form.recsource#',
				deleteOn='#variables.deleteOn#',
				liborder=#variables.liborder#,
				exlink='#form.exlink#',
				incl=#variables.incl#,
                video=#form.video#,
                embedURL=#form.embedURL#
			where
				workid=#form.workid#
</cfquery>
</cfif>

<cfset form_num=1>
<cfloop condition="structKeyExists(form,'annotation#form_num#')">
<cfquery name="updLink" datasource="#dsn#">
update link
		set
			annotation='#form["annotation#form_num#"]#'
		where
			id=#form["id#form_num#"]#
</cfquery>
<cfset form_num=form_num+1>
</cfloop>

<cfif not structKeyExists(form,"edannot")>
<cfset form_num=1>
<cfloop condition="structKeyExists(form,'id#form_num#')">
	<cfquery name="Items" datasource="#dsn#">
	  select itemid from items
	  where workid=#form.workid#
	</cfquery>

	<cfset itemsStruct=StructNew()>
    <cfloop index="looper" from="1" to="#ListLen(StructKeyList(form))#">
		<cfif left(ListGetAt(StructKeyList(form),looper),len("ITEMS#form_num#-")) eq "ITEMS#form_num#-">
			<cfset itemid=right(ListGetAt(StructKeyList(form),looper),len(ListGetAt(StructKeyList(form),looper))-len("ITEMS#form_num#-"))>
			<cfif isNumeric(form["order#form_num#-#itemid#"])>
				<cfset itemsStruct["#itemid#"]=form["order#form_num#-#itemid#"]>
			<cfelse>
				<cfset itemsStruct["#itemid#"]=999>
			</cfif>
		</cfif>
	</cfloop>
	<cfif StructCount(itemsStruct) eq 0>
		<cfset itemsStruct["-1"]=1>
	</cfif>
<!---	<cfset hiddenTracks="">
	<cfloop query="Items">
		<cfif not structKeyExists(form,"items#form_num#")>
			<cfset hiddenTracks=ListAppend(hiddenTracks,itemid)>
		<cfelseif not ListContains(#form["items#form_num#"]#,itemid)><cfset hiddenTracks=ListAppend(hiddenTracks,itemid)>
		</cfif>
	</cfloop>
 --->

	<cfquery name="updItems" datasource="#dsn#">
	  update link
	  	set
	  		items='#ArrayToList(StructSort(itemsStruct,"numeric"))#'
	  	where
	  		id=#form["id#form_num#"]#
	</cfquery>
	<cfset form_num=form_num+1>
</cfloop>
</cfif>

<cflocation url="singlerec.cfm?ed=no&ited=no&id=#form.workid#" addtoken="No">