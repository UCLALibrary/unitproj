<html>
<head><title></title>

<SCRIPT LANGUAGE="JavaScript">
function closewindow() {
   self.close()
}
</SCRIPT>

</head>
<body>

<cfoutput>

<cfset jpegimag=baseaddr & "-" & k & ".jpg">
<cfif k is l>
	<cfset previmag="x">
<cfelse>
	<cfset n1=val(k)-1>
	<cfset previmag="image.cfm?k=#n1#&baseaddr=#baseaddr#&l=#l#&m=#m#">
</cfif>
<cfif k is m>
	<cfset nextimag="x">
<cfelse>
	<cfset n2=val(k)+1>
	<cfset nextimag="image.cfm?k=#n2#&baseaddr=#baseaddr#&l=#l#&m=#m#">
</cfif>

<p align="center">
<font face="Comic Sans MS" size="1">

<cfif previmag is not "x">
	<a href="#previmag#"><img border="0" width="20" height="20" align="middle" hspace="0" vspace="2" src="images/button_previous.gif"></a>
	<a href="#previmag#">PREVIOUS PAGE</a>
	|
</cfif>
<a href="javascript:closewindow()">CLOSE WINDOW</a>
<cfif nextimag is not "x">
	|
	<a href="#nextimag#">NEXT PAGE</a>
	<a href="#nextimag#"><img border="0" width="20" height="20" align="middle" hspace="0" vspace="2" src="images/button_next.gif"></a>
</cfif>
<br>
<img align="top" src="images/#jpegimag#">
<br>
<cfif previmag is not "x">
	<a href="#previmag#"><img border="0" width="20" height="20" align="middle" hspace="0" vspace="2" src="images/button_previous.gif"></a>
	<a href="#previmag#">PREVIOUS PAGE</a>
	|
</cfif>
<a href="javascript:closewindow()">CLOSE WINDOW</a>
<cfif nextimag is not "x">
	|
	<a href="#nextimag#">NEXT PAGE</a>
	<a href="#nextimag#"><img border="0" width="20" height="20" align="middle" hspace="0" vspace="2" src="images/button_next.gif"></a>
</cfif>

</font>
</p>

</cfoutput>

</body>
</html>
