<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Log In -- Subject Authority Proposal Form</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="login_form.css" type="text/css">
</head>

<body>

<p class="main">
   Welcome to the Subject Authority Submission Form.<br><br>
   Please log in below. <br>
</p>

<form name="saco_password" method="post" action="<cfoutput>#CGI.SCRIPT_NAME#</cfoutput>">
<table border="0" cellspacing="0" cellpadding="2" id="login_form">
  <tr>
    <td>
         Username:
    </td>
	<td>
		 <input type="text" name="username" maxlength="12" size="15">
	</td>
  </tr>
  <tr>
    <td>
         Password:
	</td>
    <td>
		 <input type="password" name="password" maxlength="12" size="15">
         <input type="submit" name="saco_login_button" value="Login" class="submit">
    </td>
  </tr>
</table>
</form>

<p class="main">
Problems logging in? Contact your TAC.
</p>

</body>
</html>
