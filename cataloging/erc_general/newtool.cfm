<cfif
	Find("164.67",CGI.REMOTE_ADDR) GT 0 OR
	Find("128.97",CGI.REMOTE_ADDR) GT 0 OR
	Find("131.179",CGI.REMOTE_ADDR) GT 0 OR
	Find("149.142",CGI.REMOTE_ADDR) GT 0 OR
	Find("169.232",CGI.REMOTE_ADDR) GT 0 OR
	IsDefined("COOKIE.WEBTOOL")>

	<cfparam name="title_error" default="Unable to detect title. Please enter the title manually or verify URL.">
	<cfparam name="address_error" default="Please input a valid URL.">
	<cfparam name="error_msg" default="">
	<cfparam name="URL.email" default="[required]">
	<cfparam name="URL.cc_email" default="[list emails separated by commas]">
	<cfparam name="URL.title" default="[required]">
	<cfparam name="URL.address" default="[required]">
	<cfparam name="URL.summary" default="[include special instructions & comments]">
	<cfparam name="URL.isbn" default="[optional]">
	<cfparam name="URL.sfx_id" default="[optional]">
	<cfparam name="URL.serials_id" default="[optional]">
	<cfparam name="URL.selectors" default="[optional]">
	<cfparam name="URL.type" default="book">
	<cfparam name="URL.priority" default="normal">
	<cfparam name="URL.unit" default="[e.g. Biomed/RICS, YRL/CRIS, Music, Arts, etc.]">
	<cfparam name="URL.bibid" default="[required; enter 0 if no Voyager Bib ID]">
	<cfparam name="URL.po_num" default="[required]">
	<cfparam name="URL.edition" default="[required]">
	<cfparam name="URL.package" default="[Please explain in Notes field if requesting collection-level cataloging, title-level cataloging, or both.]">
	<cfparam name="titleClass" default="inputbox">
	<cfparam name="addressClass" default="inputbox">

	<cfif IsDefined("URL.get_title")>
		<cfif URL.address NEQ "" AND URL.address NEQ "[required]" and URL.address NEQ address_error>
			<cfhttp
				method="Get"
				url=#URL.address#
				resolveurl="Yes">
				<cfset URL.title = URL.title>
				<cfif URL.title EQ "" OR URL.title EQ "[required]" OR URL.title EQ title_error>
					<cfscript>
						titleStart = Find("<title>", cfhttp.FileContent);
						titleEnd = Find("</title>",cfhttp.FileContent);
						if (titleEnd - titleStart GT 0)
						{
							URL.title = Mid(cfhttp.FileContent, titleStart+7, (titleEnd-titleStart-7));
							titleClass="inputbox";
						}
						else
						{
							URL.title = title_error;
							titleClass = "inputboxerror";
						}

					</cfscript>
				</cfif>
				<cfelse>
					<cfscript>
					URL.address = address_error;
					addressClass = "inputboxerror";
					</cfscript>
				</cfif>
	</cfif>

	<html>
		<head>
			<title>REQUEST TO CATALOG Paid E-Resources</title>
			<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
			<style type="text/css">
				.text {font-family: Arial; font-size: 12px; color: #000000; font-weight: bold;}
				.webtool {border-color: #7297c3; border-style: outset; border-width: medium; background-color: #5075a1; width: 70%; font-family: Arial; font-size: 12px;}
				.webtool td {border-color: #aaaaaa; border-width: 1px; border-style: none; font-family: Arial; font-size: 12px;}
				.inputbox {background-color: #ffffcc; border-color: #5075a1; border-style: inset; height: 25px; padding: 2px; font-size: 12px;}
				.inputboxerror {background-color: pink; border-color: #5075a1; border-style: inset; height: 25px; padding: 2px; font-size: 12px;}
				.radio {background-color: #5075a1; border-color: #5075a1; border-style: none; color: #ffffff;}
				.button {border-color: #5075a1; border-width: medium; border-style: outset; height: 25px;  color: #ffffff; background-color: #5075a1; font-size: 12px;}
				.leftcol {color: #ffffff; font-weight: bold;}
				.textarea {border-color: #5075a1; border-style: inset; background-color: #ffffcc;}
				a:link {color: #000000; text-decoration: none; font-weight: bold;}
				a:visited {color: #ff0000; text-decoration: underline; font-weight: bold;}
				a:hover {color: #000000; text-decoration: underline; font-weight: bold;}
			</style>
		</head>

		<body bgcolor="#ffffff" text="#ffffff">
			<center>
				<table border="0" height="100%" width="100%">
					<tr>
						<td valign="middle" align="center">
							<form action="#CGI.SCRIPT_NAME#" enctype="multipart/form-data" method="get" name="eres" id="eres">
								<input type="hidden" name="zrecipient" value="erdb-newcat@library.ucla.edu">
								<input type="hidden" name="zsubject" value="NEW Cat Request">
								<input type="hidden" name="zsort" value="order:name,email,unit,title,address,bibid,type,priority,summary">
								<table class="webtool" id="webtool_form" cellpadding="2">
									<tr>
										<td colspan="2" align="center">
											<h2>REQUEST TO CATALOG PAID<a href="#info">*</a> E-RESOURCES</h2>
											<!--p>For licensed E-Resources please contact <a href="http://staff.library.ucla.edu/dcs/">Digital Collections Services</a></p-->
											<hr size="1" width="50%" color="#ffffff">
										</td>
									</tr>
									<!---tr>
										<td align="right" class="leftcol">Your name:</td>
										<td><input class="inputbox" type="text" id="name" name="name" value="<cfoutput>#URL.name#</cfoutput>" size="68" onfocus="checkValue(this.id)" onblur="checkValue_input(this.id)"></td>
									</tr--->
									<tr>
										<td align="right" class="leftcol">Your email:</td>
										<td><input class="inputbox" type="text" id="email" name="email" value="<cfoutput>#URL.email#</cfoutput>" size="68" onfocus="checkValue(this.id)" onblur="checkValue_input(this.id)"></td>
									</tr>
									<tr>
										<td align="right" class="leftcol">Other recipients:</td>
										<td><input class="inputbox" type="text" id="cc_email" name="cc_email" value="<cfoutput>#URL.cc_email#</cfoutput>" size="68" onfocus="checkValue(this.id)" onblur="checkValue_input(this.id)"></td>
									</tr>
									<tr>
										<td align="right" class="leftcol">Ordering unit:</td>
										<td><input class="inputbox" type="text" id="unit" name="unit" value="<cfoutput>#URL.unit#</cfoutput>" size="68" onfocus="checkValue(this.id)" onblur="checkValue_input(this.id)"></td>
									</tr>
									<tr>
										<td align="right" class="leftcol">Priority:</td>
										<td>
											<input class="radio" type="radio" name="priority" value="normal" <cfif URL.priority EQ "normal">checked</cfif>>Normal
											<input class="radio" type="radio" name="priority" value="rush" <cfif URL.priority EQ "rush">checked</cfif>>Rush
										</td>
									</tr>
									<tr>
										<td align="right" class="leftcol">URL:</td>
										<td><input class="<cfoutput>#addressClass#</cfoutput>" type="text" id="address" name="address" value="<cfoutput>#URL.address#</cfoutput>" size="68" onfocus="checkValue(this.id)" onblur="checkValue_input(this.id)">
										<input class="button" type="submit" name="get_title" value="Get Title">&nbsp<a href="#" onclick="openHelp()">Help</a></td>
									</tr>
									<tr>
										<td align="right" class="leftcol">Title:</td>
										<td><input class="<cfoutput>#titleClass#</cfoutput>" type="text" id="title" name="title" value="<cfoutput>#URL.title#</cfoutput>" size="68" onfocus="checkValue(this.id)" onblur="checkValue_input(this.id)"></td>
									</tr>
									<tr>
										<td align="right" class="leftcol">Voyager BIB ID:</td>
										<td><input class="inputbox" type="text" id="bibid" name="bibid" value="<cfoutput>#URL.bibid#</cfoutput>" size="68" onfocus="checkValue(this.id)" onblur="checkValue_input(this.id)"></td>
									</tr>
									<tr>
										<td align="right" class="leftcol">Purchase Order #:</td>
										<td><input class="inputbox" type="text" id="po_num" name="po_num" value="<cfoutput>#URL.po_num#</cfoutput>" size="68" onfocus="checkValue(this.id)" onblur="checkValue_input(this.id)"></td>
									</tr>
									<tr>
										<td align="right" class="leftcol">Coverage/Edition/Date:</td>
										<td><input class="inputbox" type="text" id="edition" name="edition" value="<cfoutput>#URL.po_num#</cfoutput>" size="68" onfocus="checkValue(this.id)" onblur="checkValue_input(this.id)"></td>
									</tr>
									<tr>
										<td align="right" class="leftcol">Resource type:</td>
										<td>
											<input class="radio" type="radio" name="type" value="book" <cfif URL.type EQ "book">checked</cfif>>Book<br>
											<input class="radio" type="radio" name="type" value="database" <cfif URL.type EQ "database">checked</cfif>>Database<br>
											<input class="radio" type="radio" name="type" value="serial" <cfif URL.type EQ "serial">checked</cfif>>Serial<br>
										</td>
									</tr>
									<tr>
										<td align="right" class="leftcol">ISSN/ISBN:</td>
										<td><input class="inputbox" type="text" id="isbn" name="isbn" value="<cfoutput>#URL.isbn#</cfoutput>" size="68" onfocus="checkValue(this.id)" onblur="checkValue_input(this.id)"></td>
									</tr>
									<tr>
										<td align="right" class="leftcol">SFX Object ID:</td>
										<td><input class="inputbox" type="text" id="sfx_id" name="sfx_id" value="<cfoutput>#URL.sfx_id#</cfoutput>" size="68" onfocus="checkValue(this.id)" onblur="checkValue_input(this.id)"></td>
									</tr>
									<tr>
										<td align="right" class="leftcol">Serials Solutions ID #:</td>
										<td><input class="inputbox" type="text" id="serials_id" name="serials_id" value="<cfoutput>#URL.serials_id#</cfoutput>" size="68" onfocus="checkValue(this.id)" onblur="checkValue_input(this.id)"></td>
									</tr>
									<tr>
										<td align="right" class="leftcol">Selector(s):</td>
										<td><input class="inputbox" type="text" id="selectors" name="selectors" value="<cfoutput>#URL.selectors#</cfoutput>" size="68" onfocus="checkValue(this.id)" onblur="checkValue_input(this.id)"></td>
									</tr>
									<tr>
										<td align="right" class="leftcol">Package Title:</td>
										<td><input class="inputbox" type="text" id="package" name="package" value="<cfoutput>#URL.package#</cfoutput>" size="110" onfocus="checkValue(this.id)" onblur="checkValue_input(this.id)"></td>
									</tr>
									<tr>
										<td align="right" class="leftcol">
											Notes:
										</td>
										<td>
											<textarea class="textarea" id="summary" name="summary" rows="6" cols="52" onfocus="checkValue_summary(this.id)"><cfoutput>#URL.summary#</cfoutput></textarea>
										</td>
									</tr>
									<!--tr>
										<td align="right" class="leftcol">Attach Documents:</td>
										<td>
											<input class="inputbox" type="file" id="upfile" name="upfile" value="" size="68" onfocus="checkValue(this.id)" onblur="checkValue_input(this.id)">
											<br/>
											[e.g. for spreadsheets or other documentation necessary for cataloging]
										</td>
									</tr-->
									<tr>
										<td></td>
										<td>
											Please check to make sure that SFX/Serials Solutions work has been completed before sending request to Cataloging (or consult Cataloging for custom processing).
										</td>
									</tr>
									<tr>
										<td></td>
										<td>
											<input class="button" type="button" name="submit_button" value="Send to Cataloging" onclick="validateForm()">
											<input class="button" type="button" value="Clear" onclick="window.location.href='newtool.cfm'">
										</td>
									</tr>
								</table>
							</form>
							<br>
							<span class="text" id="contact">
								<a name="info">*</a> To request cataloging for freely available e-resources, go here: <a href="http://unitdev.library.ucla.edu/cataloging/erc_general/webtool.cfm">http://unitdev.library.ucla.edu/cataloging/erc_general/webtool.cfm</a>
							</span>
							<br>
							<span class="text" id="contact">
								Problems? Please send us an email: <a href="mailto:erdb-newcat@library.ucla.edu?subject=Webtool problems">erdb-newcat@library.ucla.edu</a>
							</span>
						</td>
					</tr>
				</table>
			</center>

			<script type="text/javascript">
				function openHelp()
				{
					window.open("webtool_help.cfm","Help","location=no,menubar=no,toolbar=no,resizable=yes,scrollbars=yes,top=150,left=5,width=200, height=400");
				}

				function checkValue(x)
				{
					if (document.getElementById(x).value.indexOf("required") != -1)
					{
						document.getElementById(x).value = "";
					}
				}

				function checkValue_input(x)
				{
					if ( x == 'email' || x == 'title' || x == 'address' || x == 'bibid' || x == 'po_num' || x == 'edition' )
					{
						if (document.getElementById(x).value == "")
						{
							document.getElementById(x).value = "[required]";
							//alert("Please enter value");
							//document.getElementById(x).focus();
							//document.getElementById(x).style.background = "pink";
						}
					}
				}

				function checkValue_summary(x)
				{
					if (document.getElementById(x).value == "[optional]")
					{
						document.getElementById(x).value = ""
					}
				}

				function submitForm()
				{
					if (document.eres.priority[1].checked == true)
					{
						document.eres.zsubject.value = "RUSH: NEW Cat Request";
					}
					document.eres.action="http://services.library.ucla.edu/cgi-bin/formmail";
					document.eres.submit();
				}

				function validateForm()
				{
					numErrors = 0;

					/*if (document.eres.name.value == "" || document.eres.name.value == "[required]")
					{
						document.eres.name.style.background = "pink";
						numErrors = 1;
					}
					else
					{
						document.eres.name.style.background = "#ffffcc";
					}*/

					if (document.eres.email.value == "" || document.eres.email.value == "[required]")
					{
						document.eres.email.style.background = "pink";
						numErrors = 1;
					}
					else
					{
						document.eres.email.style.background = "#ffffcc";
					}

					if (document.eres.title.value == "" || document.eres.title.value == "[required]" || document.eres.title.value == "Unable to detect title. Please enter the title manually or verify URL.")
					{
						document.eres.title.style.background = "pink";
						numErrors = 1;
					}
					else
					{
						document.eres.title.style.background = "#ffffcc";
					}

					if (document.eres.address.value == "" || document.eres.address.value == "[required]" || document.eres.address.value == "Please input a valid URL.")
					{
						document.eres.address.style.background = "pink";
						numErrors = 1;
					}
					else
					{
						document.eres.address.style.background = "#ffffcc";
					}

					if (document.eres.bibid.value == "" || document.eres.bibid.value.indexOf("required") != -1 || document.eres.bibid.value == "Please input a valid bib ID.")
					{
						document.eres.bibid.style.background = "pink";
						numErrors = 1;
					}
					else
					{
						document.eres.bibid.style.background = "#ffffcc";
					}

					if (document.eres.po_num.value == "" || document.eres.po_num.value == "[required]" || document.eres.po_num.value == "Please input a valid PO number.")
					{
						document.eres.po_num.style.background = "pink";
						numErrors = 1;
					}
					else
					{
						document.eres.po_num.style.background = "#ffffcc";
					}

					if (document.eres.edition.value == "" || document.eres.edition.value == "[required]" || document.eres.edition.value == "Please input a valid edition.")
					{
						document.eres.edition.style.background = "pink";
						numErrors = 1;
					}
					else
					{
						document.eres.bibid.style.background = "#ffffcc";
					}

					if (document.eres.cc_email.value != "" && document.eres.cc_email.value != "[list emails separated by commas]" )
					{
						var modAddresses = "";
						var addresses = document.eres.cc_email.value.split(",");
						for ( i = 0; i < addresses.length; i++ )
						{
							if ( addresses[i].indexOf("@") == -1 )
							{
								modAddresses = modAddresses + "," + addresses[i] + "@library.ucla.edu";
							}
							else
							{
								var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
								if (!filter.test(addresses[i]))
								{
									document.eres.cc_email.style.background = "pink";
									numErrors = 1;
									break;
								}
								else
								{
									modAddresses = modAddresses + "," + addresses[i];
								}
							}
						}

						if (numErrors == 0)
						{
							if (modAddresses.charAt(0) == ",")
							{
								modAddresses = modAddresses.substring(1,modAddresses.length);
							}
							document.eres.cc_email.value = modAddresses;
						}
					}

					if (numErrors == 0)
					{
						if (document.eres.priority[1].checked == true)
						{
							document.eres.zsubject.value = "RUSH: NEW Cat Request";
						}
						document.eres.method = "POST";
						document.eres.action= "mailer.cfm";
						document.eres.submit();
					}
					else
					{
						alert("Please fill in the required fields (in pink) before resubmitting this form.");
					}
				}
			</script>

		</body>
	</html>
<cfelse>
	<html>
		<head><title>Unauthorized</title></head>
		<body bgcolor="pink" text="black">
			<center><h1>ERROR: Unauthorized visitor!</h1></center>
			<cflocation url="randimage/randimage2.cfm">
		</body>
	</html>
</cfif>