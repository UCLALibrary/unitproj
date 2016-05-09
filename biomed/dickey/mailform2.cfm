<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Sending Mail</title>
	
	
</head>



<body>

	<cfmail 
		to="kdonahue@library.ucla.edu"
		from="#sender#"
		subject="Patron requesting information about the Dickey site"
	>
	#the_message#
	</cfmail>
	
<cfinclude template="tablestart.html">

	<tr><td colspan="4">
	<br>
	<b>Message Sent</b><br>
	<br>
	Your message, <br>
	
	<blockquote><i><cfoutput>#the_message#</cfoutput></i></blockquote>
	has been sent to the administrators of the Dickey collection.  Thank you!
	<br><br>
	<div align="right"><a href="mailform.cfm">Back to the Collection Description</a>
	</div>
	</td></tr>
	</table>
</body>
</html>
