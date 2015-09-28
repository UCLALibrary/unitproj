<cfparam name="TermID" default="0">

<cfif TermID neq 0>
 <cfquery name = "Glossary" datasource = #dsn_np#>
  <cfoutput>
SELECT *
FROM Glossary
WHERE TermID = #TermID#
  </cfoutput>
 </cfquery>
</cfif>

<cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Glossary: #Glossary.Term#</title>
<link rel="stylesheet" type="text/css" href="css/global.css">
<script language="JavaScript" type="text/javascript">
<!--
function GoAndClose(url) {
            opener.location = url;
			window.self.close();
          }
function CloseWindow() {
			window.self.close();
          }
function Citation(target) {
	_loc = target;
	popupsWin = 	window.open(_loc,"Citation","toolbar=no,width=640,height=200,screenY=20,screenX=20,top=20,left=20,scrollbars=yes,resizable=yes");
	if (popupsWin.opener == null) {
		popupsWin.opener = self
	}
}
//-->
</script>
</head>

<body>

<p>
<strong>#Glossary.Term#</strong>: #Glossary.Definition#

</p>

<div class="close">
<form>
<input type="button" value="Close" class="form" onClick="CloseWindow()">
</form>
</div>


</body>
</html>
</cfoutput>
