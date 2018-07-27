<html>
<head>
	<title>UCLA Library User Survey 2018</title>
	<script type="text/javascript" src="supportSurvey.js"></script>
	<script type="text/javascript">
		window.onload = function() {            
			hideDiv();
		}
	</script>

	<link rel="stylesheet" href="./css/160.css">
	<link rel="stylesheet" href="./css/flexslider.css">
	<link rel="stylesheet" href="./css/fancybox.css">
    <link rel="stylesheet" href="./css/ucla.css">
	
    <!--<link rel="stylesheet" href="./css/fixed.css">-->
 	<link rel="stylesheet" href="./css/responsive.css">

    <link rel="stylesheet" href="./css/print.css" media="print">
	
	</head>
<body>

	<div id="header" role="banner">
		<div id="header-content">
			<img src="//www.library.ucla.edu/sites/all/themes/uclalib_omega/logo.svg" width="150" height="35">
		</div>
	</div>
	<div id="main-content" role="main">
	
	<h3>UCLA is conducting a cost analysis of library usage.  Please assist us by completing this survey.</h3>
	<p><strong>Base your response on library usage for this particular visit only.</strong></p>

	<form name="survey" id="survey" onsubmit="return validateSurvey();" method="post" action="lcas_router.cfm">
	<cfoutput>
		<input type="hidden" name="target" value="#URL.target#">
	</cfoutput>
		
		<!-- Question 1 -->
		<label for="q1_status">1. Are you a:</label>
		<select name="q1_status" id="q1_status">
			<option value="0">--- Select status ---</option>
			<option value="1">UCLA Graduate / Doctoral / Professional Student</option>
			<option value="2">UCLA Undergraduate Student</option>
			<option value="3">UCLA Faculty</option>
			<option value="4">UCLA Staff (Including Residents/Fellows, Post-Doctoral Students, etc.)</option>
			<option value="9">Visiting Scholar</option>
			<option value="10">Other, UCLA</option>
			<option value="11">Non-UCLA</option>
		</select>
		<br />
		
		<!-- Question 2 -->
		<label for="q2_affiliation">2. Are you affiliated with:</label>
		<select name="q2_affiliation" id="q2_affiliation">
			<option value="0">--- Select affiliation ---</option>
			<option value="1">College of Letters and Science</option>
			<option value="2">Henry Samueli School of Engineering and Applied Science</option>
			<option value="3">School of the Arts and Architecture</option>
			<option value="4">Graduate School of Education and Information Studies</option>
			<option value="5">Anderson School of Management</option>
			<option value="6">Luskin School of Public Affairs</option>
			<option value="7">School of Theater, Film and Television</option>
			<option value="8">Herb Alpert School of Music</option>
			<option value="9">School of Law</option>
			<option value="10">David Geffen School of Medicine</option>
			<option value="11">School of Dentistry</option>
			<option value="12">Fielding School of Public Health</option>
			<option value="13">School of Nursing</option>
			<option value="14">UCLA Health (RRMC, SMUCLA, etc.)</option>
			<option value="15">Other, UCLA</option>
			<option value="16">Non-UCLA</option>
		</select>
		<br />

		<!-- Question 3 -->
		<label for="q3_location">3. Are you located:</label>
		<select name="q3_location" id="q3_location">
			<option value="0">--- Select location ---</option>
			<option value="1">In Library</option>
			<option value="2">On campus, but not in Library</option>
			<option value="3">Off campus</option>
		</select>
		<br />

		<!-- Question 4 -->
		<label for="q4_purpose">4. Purpose for using online resources? <a target="_blank" href="purposes.html">(More info)</a></label>
		<select name="q4_purpose" id="q4_purpose" onchange="showExtraQuestions();">
			<option value="0">--- Select purpose ---</option>
			<option value="1">Instruction/Education/Departmental (Non-Funded) Research</option>
			<option value="2">Sponsored (Funded) Research</option>
			<option value="3">Other Sponsored Activities (Public Service)</option>
			<option value="4">Patient Care</option>
			<option value="5">Other Activities</option>
		</select>
		<br />
		<hr />

		<div id="extraquestions">
		<!-- Question 5 -->
		<label for="q5_sponsor">5. Sponsor or fund source name, for example, NIH, NSF, Dept. of Energy, DOD, NASA, Dept. of Education, California Institute for Regenerative Medicine, The California Endowment, Novartis Pharmaceuticals, Microelectronics Advanced Corporation, etc.?</label>
		<input name="q5_sponsor" id="q5_sponsor" type="text" maxlength="200" size="50">
		<br />

		<!-- Question 6 -->
		<label for="q6_principal">6. Principal investigator/researcher?</label>
		<input name="q6_principal" id="q6_principal" type="text" maxlength="200" size="50">
		<br />

		<!-- Question 7 -->
		<label for="q7_grant">7. Name of the grant?</label>
		<input name="q7_grant" id="q7_grant" type="text" maxlength="200" size="50">
		<br />
		</div>
		
		<!-- Submit button -->
		<input name="submit" id="submit"  type="submit" value="Submit the survey"< />
	
	</form>
	</div>
</body>
</html>
