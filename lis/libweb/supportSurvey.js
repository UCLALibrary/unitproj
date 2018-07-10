function showDiv() {
	document.getElementById('extraquestions').style.display = 'inline';
}

function hideDiv() {
	document.getElementById('extraquestions').style.display = 'none';
}

function showExtraQuestions() {
	var value = document.survey.q4_purpose.value;
	// Show for sponsored (funded) research only
	if (value == '2') showDiv();
	else hideDiv();
}

function validateSurvey() {
	var errorMessage = '';
	var valid = true;
	if (document.survey.q1_status.value == '0') {
		errorMessage += 'Please select your status.\n';
		valid = false;
	}
	if (document.survey.q2_affiliation.value == '0') {
		errorMessage += 'Please select your affiliation.\n';
		valid = false;
	}
	if (document.survey.q3_location.value == '0') {
		errorMessage += 'Please select location.\n';
		valid = false;
	}
	if (document.survey.q4_purpose.value == '0') {
		errorMessage += 'Please select a purpose for using resources.\n';
		valid = false;
	}
	if (valid == false) alert(errorMessage);
	return valid;
}
