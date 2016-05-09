<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Mail Form</title>
	
	<script language="Javascript">
	function validateAddress(incoming) {
	var emailstring = incoming;
	var ampIndex = emailstring.indexOf("@");
	var afterAmp = emailstring.substring((ampIndex + 1), emailstring.length);
		// find a dot in the portion of the string after the ampersand only
	var dotIndex = afterAmp.indexOf(".");
		// determine dot position in entire string (not just after amp portion)
	dotIndex = dotIndex + ampIndex + 1;
		// afterAmp will be portion of string from ampersand to dot
	afterAmp = emailstring.substring((ampIndex + 1), dotIndex);
		// afterDot will be portion of string from dot to end of string
	var afterDot = emailstring.substring((dotIndex + 1), emailstring.length);
	var beforeAmp = emailstring.substring(0,(ampIndex));
	var email_regex = /^[\w\d\!\#\$\%\&\'\*\+\-\/\=\?\^\_\`\{\|\}\~]+(\.[\w\d\!\#\$\%\&\'\*\+\-\/\=\?\^\_\`\{\|\}\~])*\@(((\w+[\w\d\-]*[\w\d]\.)+(\w+[\w\d\-]*[\w\d]))|((\d{1,3}\.){3}\d{1,3}))$/;
		// index of -1 means "not found"
	if ((emailstring.indexOf("@") != "-1") &&
		(emailstring.length > 5) &&
		(afterAmp.length > 0) &&
		(beforeAmp.length > 1) &&
		(afterDot.length > 1) &&
		(email_regex.test(emailstring)) ) {
		  return true;
	} else {
			alert("Please enter a valid email address.");
			return false;
	}
}

	
	</script>
	

</head>
<body>
<cfinclude template="tablestart.html">
<tr><td colspan="4">
<br>
<b>Reproduction of Images</b><br>
<br>
For information about the reproduction of these images or about the other images in the collection, contact:<br>
<br>
History & Special Collections<br>
Louise M. Darling Biomedical Library<br>
12-077 CHS, Box 951798<br>
UCLA, Los Angeles, CA 90095-1798<br>
kdonahue@library.ucla.edu<br>
(telephone) 310 825-6940<br>
(fax) 310 825-0465<br>
<br>
http://www.library.ucla.edu/libraries/biomed/his/index.html<br></td>
</tr>

<tr><td colspan="4">
<br>
<b>Collection Description and History of the Project</b><br>
<br>
Donald Ryder Dickey Photographic Collection<br>
Collection 59<br>
<br>
The photographs are from The Donald Ryder Dickey Photographic Collection. 
Collection 59 in the History & Special Collections, Louise M. Darling Biomedical Library, UCLA and  
form part of the larger Donald R. Dickey Collection of Vertebrate Zoology Collection which consists of 
bird and mammal specimens, bird eggs, field notes, and an extensive library.  
The animal specimens are housed in the Organismic Biology, Ecology and Evolution Department in Life Sciences 
at UCLA and are used for teaching and research.<br>
<br>
History of the Photographs Online<br>
<br>
These images were mounted on the CDL/LOC's (California Digital Library/Library of California) Environmental Information Resources site, Environment Images Collection (http://www.eip.cdlib.org/eip/digital/ucla_biomed.html) whose emphasis was on California. The collection provides a view of the rich biodiversity of California in the early part of the 20th century. Many of the areas in which these birds and mammals were collected and photographed are now much changed by California's population growth.  The photographs also provide a wonderful window on the ways and means of field biology in the teens and twenties.  <br>
<br>
When the CDL/LOC decided not to support the site, we decided to mount the images on our site and make it searchable on the web using ColdFusion. For additional information use the contact information above or from the Home Page.<br>

<cfinclude template="footer.cfm">

</td></tr>
</table>
</body>
</html>
