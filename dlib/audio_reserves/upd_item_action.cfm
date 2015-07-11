<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Update Item action</title>
</head>

<body>

<cfquery datasource="#dsn#">
	update works
		set
			composer='#form.cmp#',
			title='#form.ttl#',
			performers='#form.prf#',
			note1='#form.nt1#',
			note2='#form.nt2#',
			label='#form.lbl#',
			labelnumber='#form.lbn#',
			librarycallnumber='#form.cln#'
		where
			workid=#form.wid#
</cfquery>

<cfgridupdate grid="itmupdgrid" datasource="#dsn#" tablename="items">

<cflocation url="aud_res_upd_lst.cfm?cid=#form.cid#" addtoken="No">

</body>
</html>
