// open glossary

function Gloss(param) {
	var _loc = '../glossary.cfm?TermID=' + param;	
	GlossaryTerm = 	window.open(_loc,"Glossary","toolbar=0,location=0,status=0,width=500,height=250,screenY=20,screenX=20,top=20,left=20,scrollbars=1,resizable=1");
	if (GlossaryTerm.opener == null) {
		GlossaryTerm.opener = self
	}
}