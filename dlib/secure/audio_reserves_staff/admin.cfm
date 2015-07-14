<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>List</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<body>

<cfinclude template="head.cfm">

<h3>Administrative Functions</h3>

<ul>
<li><a href="users.cfm">Manage users</a></li>
</ul>

<ul>
<li><a href="test.cfm">View site as a non-admin user</a></li>
</ul>

<ul>
<li><a href="depts.cfm">Manage departments</a></li>
</ul>

<ul>
<li><a href="setquarter.cfm">Set current quarter</a></li>
</ul>

<ul>
<li><a href="checkStatus.cfm">List works with unknown status</a></li>
</ul>

<ul>
<li>Check audio files
<ul>
<li><a href="checkAudio.cfm?ited=no&itemid=0&start=1&typ=1">List all unchecked files</a></li>
<li><a href="checkAudio.cfm?ited=no&itemid=0&start=1&typ=2">List unchecked files currently on reserve</a></li>
<li><a href="checkAudio.cfm?ited=no&itemid=0&start=1&typ=3">List unchecked files owned by Library</a></li>
</ul>
</li>
</ul>

<cfinclude template="foot.cfm">

</body>
</html>
