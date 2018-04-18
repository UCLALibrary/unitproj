<cfif isDefined("form.status")>
	<cfset status=form.status>
<cfelse>
	<cfset status=0>
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
<cfquery name="newrec" datasource="#dsn#">
insert into works
	(
	composer,
	title,
	performers,
	note1,
	note2,
	label,
	labelnumber,
	librarycallnumber,
	ramlink,
	baseaddress,
	classinfo,
	locator,
	status,
	recsource,
	deleteOn,
	liborder,
	incl,
    video,
    embedURL
	)
values
	(
	'#form.composer#',
	'#form.title#',
	'#form.performers#',
	'#form.note1#',
	'#form.note2#',
	'#form.label#',
	'#form.labelnumber#',
	'#form.librarycallnumber#',
	'#form.ramlink#',
	'#form.baseaddress#',
	'#form.classinfo#',
	'$sd$',
	#variables.status#,
	'#form.recsource#',
	'#form.deleteOn#',
	#variables.liborder#,
	#variables.incl#,
    #form.video#,
    '#form.embedURL#'
	)
</cfquery>
<cfquery name="loc" datasource="#dsn#">
select workid from works where locator='$sd$'
</cfquery>
<cfoutput query="loc">
	<cfset m_workid=loc.workid>
</cfoutput>
<cfquery name="del" datasource="#dsn#">
update works set locator='' where workid=#m_workid#
</cfquery>

<cfif form.caption neq "">

	<cfif form.ordr is "">
		<cfset m_ordr=0>
	<cfelse>
		<cfset m_ordr=val(form.ordr)>
	</cfif>
	<cfquery name="upd" datasource="#dsn#">
	insert into items
		(
		workid,
		ordr,
		volume,
		disc,
		side,
		track,
		caption,
		include
		)
	values
		(
		#m_workid#,
		#m_ordr#,
		'#form.volume#',
		'#form.disc#',
		'#form.side#',
		'#form.track#',
		'#form.caption#',
		1
		)
	</cfquery>

</cfif>

<cflocation url="singlerec.cfm?ed=no&ited=no&id=#m_workid#" addtoken="No">
