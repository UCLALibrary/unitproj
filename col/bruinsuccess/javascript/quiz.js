function QuizClick(which){ 
	if (document.getElementById)
	{
		document.getElementById(which).style.visibility='visible'
	}
	else if (document.all)
	{ //ie
		document.all[which].style.visibility='visible'
	}
	else if (document.layers)
	{
		document.layers[which].style.visibility='visible';
	}
}	
function QuizOff(which){ 
	if (document.getElementById)
	{
		document.getElementById(which).style.visibility='hidden'
	}
	else if (document.all)
	{ //ie
		document.all[which].style.visibility='hidden'
	}
	else if (document.layers)
	{
		document.layers[which].style.visibility='hidden';
	}
}
