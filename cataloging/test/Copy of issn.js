// OK, I need to clean up the code, but this works...

function convert(tobereplaced) {

 var replacement = [];
 var replaceme = [];
 var maxarray = 0;
 var x;
 var y;
 var index = 0;

 replacement = ['a&#769;', // acute
				'e&#769;',
				'i&#769;',
 				'o&#769;',
'u&#769;',  
'a&#770;', // circumflex
'e&#770;',
'i&#770;', 
'o&#770;',
'u&#770;',
'a&#768;', // grave
'e&#768;',
'i&#768;',
'o&#768;',
'u&#768;',
'a&#772;', // macron
'e&#772;',
'i&#772;',
'o&#772;',
'u&#772;',
'a&#776;', // umlaut
'e&#776;',
'i&#776;',
'o&#776;',
'u&#776;',
'c&#807;', // c with cedilla
'a&#771;', // a with tilde
'N&#771;', // N with tilde
'n&#771;', // n with tilde
'C&#807;', // C with cedilla
'A&#769;','E&#769;','I&#769;','O&#769;','U&#769;','A&#770;','E&#770;','I&#770;','O&#770;','U&#770;','A&#768;','E&#768;','I&#768;','O&#768;','U&#768;','A&#772;','E&#772;','I&#772;','O&#772;','U&#772;','A&#776;','E&#776;','I&#776;','O&#776;','U&#776;'];

 replaceme = ['á',
'é',
'í',
'ó',
'ú',
'â',
'ê',
'î',
'ô',
'û',
'à',
'è',
'ì',
'ò',
'ù',
'&#257;', // macron
'&#275;',
'&#299;',
'o-',
'&#363;',
'ä',
'ë',
'ï',
'ö',
'ü',
'ç', // c with cedilla 
'ã', // a with tilde
'Ñ', // N with tilde
'ñ', // n with tilde
'Ç', // C with cedilla
'Á','É','Í','Ó','Ú','Â','Ê','Î','Ô','Û','À','È','Ì','Ò','Ù','&#256;','&#274;','&#298;','&#332;','&#362;','Ä','Ë','Ï','Ö','Ü'];

 maxarray = replacement.length;

 for (i=1; i <= maxarray; i++) {
	x = replaceme[i-1];
	y = replacement[1];
	index = tobereplaced.indexOf(x, 0);
	
	while (index != -1) {
	  tobereplaced = tobereplaced.replace(x, y);
	  index = tobereplaced.indexOf(x, index);
	}
 }
	
	tobereplaced = tobereplaced.replace(/\n/g, '<br>'); 
	tobereplaced = tobereplaced.replace(/\\/g, '&#450;');

	return tobereplaced;
}

function main () {

 var replaced = document.getElementById('issn_portal').value;
 
 replaced = convert(replaced);
 
 document.write("<h3>Here is your converted record:</h3><br>");
 document.write(replaced);
 document.write("<br><br><a href=issn.htm>New record</a>.");

}

