// open form for certificate generator

function OpenGenerator(mod) {
	var mdle = mod;
	var _loc = '../certificate/form.cfm?mdle=' + mdle;	
	popupsWin = 	window.open(_loc,"Certificate","toolbar=0,location=0,status=0,width=600,height=250,screenY=100,screenX=200,top=100,left=200,scrollbars=0,resizable=0");
	if (popupsWin.opener == null) {
		popupsWin.opener = self
	}
}