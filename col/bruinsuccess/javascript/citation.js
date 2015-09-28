function Citation(target) {
	_loc = 'citations.cfm';
	popupsWin = 	window.open(_loc+'\#'+target,"Citation","toolbar=no,width=640,height=200,screenY=20,screenX=20,top=20,left=20,scrollbars=yes,resizable=yes");
	if (popupsWin.opener == null) {
		popupsWin.opener = self
	}
}

function GoAndClose(encoded_url) {
	_loc = encoded_url;
	if (opener) {
		window.open(_loc);
		window.self.close();
	}
	else {
		location = _loc;
	}
}
