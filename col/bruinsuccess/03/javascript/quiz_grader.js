// set global variables
rightAnswers = new Array("b","a","a","b","d","b","e","d")
numQuestions = rightAnswers.length
currentQuestion = 1
score = 0
answeredElement = null

// set global browser identification variables
browser = navigator.appName;
browserNum = parseInt(navigator.appVersion);
N4 = false;
N6 = false;
IE = false;
		
if ((browser == "Netscape") && (browserNum < 5))
{
	// Netscape 4.x
	layerRef = "document.layers['";
	endLayerRef = "']";
	styleRef = "";
	endFormRef = "";
	qTrackerRef = "document.layers['qTracker']."
	N4 = true;
}
else if ((browser == "Netscape") && (browserNum >= 5))
{
	// Netscape 6
	layerRef = "document.getElementById('";
	styleRef = ".style";
	endLayerRef = "')";
	formRef = "document.forms['"
	endFormRef = "']"
	N6 = true;
}
else
{
	// Internet Explorer
	layerRef = "document.all.";
	endLayerRef = "";
	styleRef = ".style";
	formRef = "document.forms['"
	endFormRef = "']"
	IE = true;
}

function checkAnswer(q)
{
	if(checkForAnswer(q))
	{	
		// determine actual answer
		if(N4) formRef = "document.layers['q" + q + "'].document."
		
		eval("questionObj = " + formRef + "q" + q + "form" + endFormRef)
		answer = questionObj.elements[answeredElement].value
		
		eval(layerRef + "q" + currentQuestion + endLayerRef + styleRef + ".visibility = 'hidden'");
		eval(layerRef + "q" + currentQuestion + answer + endLayerRef + styleRef + ".visibility = 'visible'");
		eval(layerRef + "nextQform" + endLayerRef + styleRef + ".visibility = 'visible'");
		
		
		// see if answer was right
		if(answer == rightAnswers[currentQuestion-1])
		{
			score = score + 1;
		}

		// move on to next question
		if (currentQuestion < numQuestions)
		{
			oldQuestion = currentQuestion;
			currentQuestion = currentQuestion + 1;
		}
		else
		{
			quizFinished();
		}
	}
	else
	{
		// an answer wasn't chosen
		alert("Please choose one ofthe options.");
	}
}

function checkForAnswer(q)
{
	// Determine which radio button is selected
	// Buttons are elements, so we don't want to 
	// count the answer button as a radio element
	if(N4) formRef = "document.layers['q" + q + "'].document."
	eval("questionObj = " + formRef + "q" + q + "form" + endFormRef);
	numRadioOptions = questionObj.elements.length;
	
	// loop through all radio buttons for this question and
	// see if any of them are checked
	for(i=0; i<numRadioOptions;i++)
	{
		if(questionObj.elements[i].checked) 
		{
			answeredElement = i;
			return true;
		}
	}
	return false;
}

function nextQuestion()
{	
	// hide old answer
	eval(layerRef + "q" + oldQuestion + answer + endLayerRef + styleRef + ".visibility = 'hidden'");

	// hide 'next question' button
	eval(layerRef + "nextQform" + endLayerRef + styleRef + ".visibility = 'hidden'");
	
	// show new question
	eval(layerRef + "q" + currentQuestion + endLayerRef + styleRef + ".visibility = 'visible'");

}

function quizFinished()
{
	// hide old question & show "thank you" layer
	eval(layerRef + "q" + currentQuestion + answer + endLayerRef + styleRef + ".visibility = 'hidden'");
	eval(layerRef + "q" + currentQuestion + answer + endLayerRef + styleRef + ".visibility = 'visible'");
	eval(layerRef + "nextQform" + endLayerRef + styleRef + ".visibility = 'hidden'");
	eval(layerRef + "gradeItform" + endLayerRef + styleRef + ".visibility = 'visible'");
	// display score
	if (N4) formObj = document.layers['gradeItform'].document.forms['gradeIt']
	else formObj = document.forms['gradeIt']
	formObj.finalScore.value = score;
	formObj.totalQuestions.value = numQuestions;
}
