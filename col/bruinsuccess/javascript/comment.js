// open disclaimer

function OpenCommentForm() {
	var _loc = 'http://unitproj.library.ucla.edu/col/bruinsuccess/about/feedback.cfm';
	popupsWin = 	window.open(_loc,"Comment","toolbar=0,location=0,status=0,width=426,height=450,screenY=100,screenX=200,top=100,left=200,scrollbars=0,resizable=1");
	if (popupsWin.opener == null) {
		popupsWin.opener = self
	}
}