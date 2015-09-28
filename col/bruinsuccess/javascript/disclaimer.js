// open disclaimer

function OpenDisclaimer() {
	var _loc = 'disclaimer.cfm';
	popupsWin = 	window.open(_loc,"Disclaimer","toolbar=0,location=0,status=0,width=426,height=250,screenY=100,screenX=200,top=100,left=200,scrollbars=1,resizable=0");
	if (popupsWin.opener == null) {
		popupsWin.opener = self
	}
}

function GoAndClose(encoded_url) {
	_loc = encoded_url;
	if (opener) {
		opener.location = _loc;
		window.self.close();
	}
	else {
		location = _loc;
	}
}

function CloseWindow () {
		window.self.close();
}
