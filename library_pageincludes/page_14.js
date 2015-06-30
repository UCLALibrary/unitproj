// Function to swap images
          var imagenumber = 11 ;
          var randomnumber = Math.random() ;
          var rand1 = Math.round( (imagenumber-1) * randomnumber) + 1 ;
          images = new Array
          images[1] = "http://stats.library.ucla.edu/images/topleftpic_1.jpg"
          images[2] = "http://stats.library.ucla.edu/images/topleftpic_2.jpg"
          images[3] = "http://stats.library.ucla.edu/images/topleftpic_3.jpg"
          images[4] = "http://stats.library.ucla.edu/images/topleftpic_4.jpg"
          images[5] = "http://stats.library.ucla.edu/images/topleftpic_5.jpg"
          images[6] = "http://stats.library.ucla.edu/images/topleftpic_6.jpg"
          images[7] = "http://stats.library.ucla.edu/images/topleftpic_7.jpg"
          images[8] = "http://stats.library.ucla.edu/images/topleftpic_8.jpg"
          images[9] = "http://stats.library.ucla.edu/images/topleftpic_9.jpg"
          images[10] = "http://stats.library.ucla.edu/images/topleftpic_10.jpg"
          images[11] = "http://stats.library.ucla.edu/images/topleftpic_11.jpg"
          var image = images[rand1]
// End 

// Function to popup help windows on home page
function popupHelp(name) 
{
	_loc = '../help/' + name + '.html';
	popupsWin = window.open(_loc,"PSpopups","toolbar=no,width=500,height=500,scrollbars=yes,resizable=no");
	if (popupsWin.opener == null) 
	{ 
		popupsWin.opener = self 
	}
} 
// End 

// Function close popup window on link click
function ChangeParentDocument(url) 
{
	opener.location = url;
	window.self.close();
}
// End 

// Function close popup window
function CloseWindow() 
{
	window.self.close();
}
// End 

// Function to submit form with return key
var isNav, isIE

if (parseInt(navigator.appVersion) >= 4) 
{
	if (navigator.appName == "Netscape")
		isNav = true
	else
		isIE = true
}

function showKeyValue(evt) 
{
	var keyValue

	if (isNav) 
		keyValue = evt.which
	else
		keyValue = window.event.keyCode

	/*status = keyValue*/

	if (keyValue == 13) 
	{
		alert("we're here")
		javascript:document.login.submit();
	}
	return false
}
// End 
