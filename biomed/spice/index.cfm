<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>Medicinal Spices Exhibit - UCLA Biomedical Library: History & Special Collections </title>
<LINK REL="stylesheet" TYPE="text/css" HREF="../css/spice.css" TITLE="style">
</head>
<body bgcolor="EEEDF2">
<cfquery datasource=#datasourcename# name="spiceList" cachedwithin=#CreateTimeSpan(0, 0, 0, 0)#>
Select SpiceTable.ResourceID, CommonName, Family, GenusSpecies, AltGenusSpecies, Origin, Cultivated, Description, UsefulParts, MedicinalProperties, HistoricalView, CommonName2, Family2, GenusSpecies2, AltGenusSpecies2, Origin2, Cultivated2, displayName
From SpiceTable
Order by displayName
</cfquery>
<cfparam name="displayswitch" default="">
<cfparam name="keyword" default="">
<cfif displayswitch is "1">
<cfquery datasource=#datasourcename# name="FamilyList" cachedwithin=#CreateTimeSpan(0, 0, 0, 0)#>
Select ResourceID, CommonName, CommonName2, displayName
From SpiceTable
Where Family='#family#' 
Order by CommonName, CommonName2
</cfquery>
</cfif>
<cfif displayswitch is "2">
<cfquery datasource=#datasourcename# name="kwSearch">
Select distinct ResourceID, CommonName, CommonName2, displayName, family
From SpiceTable
 Where ((CommonName LIKE '~~~')
 <cfloop list=#keyword# index=word delimiters=",  "> 
OR (CommonName LIKE '%#word#%')
OR (CommonName2 LIKE '%#word#%')
OR (displayName  LIKE '%#word#%')
OR (family  LIKE '%#word#%')
OR (Genusspecies  LIKE '%#word#%')
OR (AltGenusspecies  LIKE '%#word#%')
OR (GenusSpecies2  LIKE '%#word#%')
OR (AltGenusSpecies2  LIKE '%#word#%')
OR (origin  LIKE '%#word#%')
OR (origin2  LIKE '%#word#%')
OR (cultivated  LIKE '%#word#%')
OR (cultivated2  LIKE '%#word#%')
OR (description  LIKE '%#word#%')
OR (usefulparts  LIKE '%#word#%')
OR (medicinalProperties  LIKE '%#word#%')
OR (historicalview  LIKE '%#word#%')
</cfloop>)
ORDER by Family, displayName
</cfquery>

<cfquery datasource=#datasourcename# name="kwTextSearch">
Select spicetextfilename, doctitle
From spicetexts
Where ((content LIKE '~~~')
<cfloop list=#keyword# index=kword delimiters=",  ">
OR (content LIKE '%#kword#%')
</cfloop>)
Order by doctitle
</cfquery>
</cfif>

<!--- default parameters --->
<cfparam name = "itemSuppress" default = "no">
<cfparam name = "spiceFilename" default = "">
<cfparam name = "familySearch" default = "no">
<cfparam name = "displayID" default = ""> 
<cfset nameExcept ="FRANKINCENSE, Greater Galangal">

 <cfif ((displayswitch is not "") OR (displayID is not ""))>
 <table width="100%" border="0" bgcolor="EEEDF2" cellpadding="0" cellspacing="0">
<tr>
	<td width="332"><a href="http://www.library.ucla.edu/libraries/biomed/his/index.html" ><img src="images/spicebannerlhs.jpg" border="0"></a></td><td  bgcolor="EEEDF2">&nbsp;</td>
		<td width="424"><a href="index.cfm"><img src="images/spicebannerrhs.jpg" border="0"></a></td>
</tr>
</table>
</cfif> 
<table bgcolor="FFFFFF" cellspacing="0" cellpadding="10" border="0" width="100%">

 <cfif ((displayswitch is not "") OR (displayID is not ""))>
<tr><td></td></tr>
</cfif>
<table cellspacing="0" cellpadding="10" border="0" width="100%">
<tr><td></td></tr>
<tr> <td class="smlsans" valign="top" width="150">
 <!--- keyword search form--->
<form name="keywordSearch" action="index.cfm">
<input type="text" name="keyword"><br>
<input type="hidden" name="familySearch" value="no">
<input type="hidden" name="itemSuppress" value="yes">
<input type="hidden" name="displaySwitch" value="2">
<input type="submit" value="Keyword Search">
</form>
<strong>Learning about Spices</strong><br>

<a class="nonunder" href="index.cfm?spicefilename=whatisaspice.txt&itemsuppress=yes&displayswitch=0">What&nbsp;is&nbsp;a&nbsp;spice?</a><br>
<a class="nonunder" href="index.cfm?spicefilename=important.txt&itemsuppress=yes&displayswitch=0">Why&nbsp;were&nbsp;spices&nbsp;important?</a><br>
<a class="nonunder" href="index.cfm?spicefilename=SourcesOfSpices.txt&itemsuppress=yes&displayswitch=0">Sources&nbsp;of&nbsp;spices</a><br>
<a class="nonunder" href="index.cfm?spicefilename=perfume.txt&itemsuppress=yes&displayswitch=0">Perfumes&nbsp;and&nbsp;Incenses&nbsp;</a><br>
<a class="nonunder" href="index.cfm?spicefilename=Aphrodisiacs.txt&itemsuppress=yes&displayswitch=0">Use&nbsp;of&nbsp;spices&nbsp;as&nbsp;aphrodisiacs</a><br>

<a class="nonunder" href="index.cfm?spicefilename=SpicesAsMeds.txt&itemsuppress=yes&displayswitch=0">Use&nbsp;of&nbsp;spices&nbsp;as&nbsp;medicines</a><br>
<a class="nonunder" href="index.cfm?spicefilename=Culinary.txt&itemsuppress=yes&displayswitch=0">Culinary&nbsp;herbs</a><br>
<a class="nonunder" href="index.cfm?spicefilename=TimelineHistorySpiceTrade.txt&itemsuppress=yes&displayswitch=0">A&nbsp;spice&nbsp;timeline</a><br><br>
<strong>Table of Spices</strong><br>
<cfoutput query="spiceList">
<a class="nonunder" href="index.cfm?displayID=#ResourceID#">#REReplaceNoCase(DisplayName, " ", "&nbsp;", "all")#</a><br>
</cfoutput><br>
<a class="nonunder" href="index.cfm?spicefilename=credits.txt&itemsuppress=yes&displayswitch=0">Contacts&nbsp;and&nbsp;Acknowledgments</a><br>
</td>
   <td valign="top" class="smlsans" align="left" rowspan="2">
   	<cfif itemSuppress is "yes">
	<cfswitch expression=#displayswitch#>
	<cfcase value=0>
	
<cfif keyword is "">
<cfinclude template=#spicefilename#>
<cfelse>
<!--- stop words --->
<cfset stopWords="a,though,about,each,through,above,throughout,ed,thru,thus,across,eg,like,to,after,either,else,all,etc,also,until,although,ml,up,except,find,more,for,an,and,get,so,as,some,of,on,only,if,onto,with,but,by,the,in,into,over,do,or">

<cfset question=#keyword#>
<!--- removes stop words from query with parameter "question"--->
<cfset newquestionspace=insert(#question#, " ", "1")>
<cfset length=len(newquestionspace)>
<cfset newquestion=insert(" ","#newquestionspace#", "#length#")>
<CFLOOP INDEX="word" LIST="#question#" DELIMITERS=" ">
	<CFLOOP INDEX="sWord" LIST="#stopWords#" DELIMITERS=",">
		<cfif #word# is #sWord#>
			<cfset newquestion2=REReplaceNoCase(newquestion, "[^A-Za-z0-9]#word#[^A-Za-z0-9]", " ", "all")>
		<cfset newquestion=#newquestion2#>
		</cfif>
	</cfloop>
</cfloop>
<!--- end stop words and returns "newquestion"--->

<cfset newquestionL=LTrim(newquestion)>
<cfset newquestion=RTrim(newquestionL)>
<cfset stopkeyword=#newquestion#>
<!--- end stop words --->

<cfquery name="getTextnow" datasource="#datasourcename#" cachedwithin=#CreateTimeSpan(365, 0, 0, 0)#>
	Select content
	From spicetexts
	Where spicetextfilename ='<cfoutput>#spicefilename#</cfoutput>'
	</cfquery>
<cfoutput query="getTextnow">
<CF_HIGHLIGHT String="#content#"
              SubString="#ReReplaceNoCase(stopkeyword, " ",",","all")#"
			  OpenTag="<span class=tab0><b>"
			  CloseTag="</b></span>">
</cfoutput>	
		<cfoutput>#CF_HIGHLIGHT#</cfoutput>	  
</cfif>

	</cfcase>
	<cfcase value=1><table width=100% cellpadding="5" bgcolor="" border="0"><th colspan="2" bgcolor="EEEDF2">Family Search Results: <cfoutput>#family#</cfoutput></th><cfoutput query="familyList"><tr><td class="smlsans" align="right" valign="top"><a class="nonunder" href="index.cfm?displayID=#ResourceID#">#REReplaceNoCase(DisplayName, " ", "&nbsp;", "all")#</a><br></td>
<td  valign="top" align="left" class="smlsans">
<a class="nonunder" href="images/#ReReplaceNoCase(CommonName, " ", "", "all")#.jpg"><img src="thumbs/#ReReplaceNoCase(CommonName, " ", "", "all")#.jpg" alt="#CommonName#" border="0"  height="100"></a> 
<br><font color="A6A6A6">Click image to enlarge</font></td></tr></cfoutput>
</table></cfcase>
	<cfcase value=2>
	<h3>Keyword Search Results: <cfoutput>#EncodeForHTML(keyword)#</cfoutput></h3>
<table width=100% cellpadding="3" cellspacing="2" bgcolor="" border="0"><th colspan="4" bgcolor="EEEDF2">Document Search </th>

<cfif kwtextsearch.RecordCount is '0'><tr><td colspan="4" class="medsans" align="center">No Documents Found</td></tr><cfelse><tr><td class="smlsans" align="right" valign="top" width="10%"><strong>Documents</strong></td><td class="smlsans" align="left" valign="top" width="300" colspan="2">

	<CFOUTPUT query="kwtextsearch"><A href="index.cfm?spicefilename=#spicetextfilename#&keyword=#EncodeForHTML(keyword)#&itemsuppress=yes&displayswitch=0" class="nonunder">#doctitle#</A><br>
	</CFOUTPUT></td><td class="smlsans" align="left" valign="top">&nbsp;</td></tr>
</CFIF> 

</table>
<br>
<table width=100% cellpadding="3" cellspacing="3" bgcolor="" border="0">
<th colspan="4" bgcolor="EEEDF2">Spice Search</th>
<cfif kwsearch.recordcount is '0'><tr><td colspan="4" class="medsans" align="center">No Spices Found</td></tr><cfelse><tr><td class="smlsans" align="left" valign="top" width="15%"><strong>Family</strong></td><td class="smlsans" align="left" valign="top"><strong>Common&nbsp;Name</strong></td><td>&nbsp;</td><td class="smlsans" align="right" valign="top" width="10%">&nbsp;</td></tr><cfoutput query="kwsearch" group="family"><tr><td class="smlsans" align="left" valign="top"><a class="nonunder" href="index.cfm?familySearch=yes&family=#family#&itemsuppress=yes&displayswitch=1">#family#</a></td><td class="smlsans" align="left" valign="top"><cfoutput><a class="nonunder" href="index.cfm?displayID=#ResourceID#&keyword=#EncodeForHTML(keyword)#">#REReplaceNoCase(DisplayName, " ", "&nbsp;", "all")#</a>
<br>
</cfoutput></td><td>&nbsp;</td><td class="smlsans" align="right" valign="top" width="10%">&nbsp;</td></tr></cfoutput></cfif></table>
	</cfcase>
	<cfdefaultcase>error</cfdefaultcase>
	</cfswitch>
	
	<cfelseif displayID is "">
	<!--- title screen --->
	<table cellspacing="5" border="0" width="100%">
	<tr><td align="left" ><br><br><p style="margin-left:1.5cm;"><img src="images/spicelogo7.jpg" alt="Spices: Exotic Flavors & Medicines"  border="0"><br><br><br></p></td></tr>
<tr><td class="lrgsans" align="left"><p style="margin-left:1.5cm;"><a href="http://www.library.ucla.edu/libraries/biomed/his/index.html"><img src="images/historydivision.jpg" alt="History & Special Collections"  border="0"></a><br><a href="http://www.library.ucla.edu/libraries/biomed/"><img src="images/louisedarling.jpg" alt="Louise M. Darling Biomedical Library"  border="0"></a><br><a href="http://www.ucla.edu"><img src="images/uclalink.jpg" alt="UCLA"  border="0"></a></p>
</td></tr>
<tr><td class="justify" align="left"><br><p style="margin-left:1.5cm; margin-right:1cm;"><font size="+1"><i>Spice</i></font>  The very word conjures up visions of exotic tastes and places and well it should. For spices were exotic, especially for Western Europeans.  They were sought in far-flung parts of the world for their culinary and in many instances for their medicinal value.  Our love affair with spices continues. Today we have the spices of the world at our fingertips and we use them to create the dishes of many cultures.  We also continue to be interested in their medicinal value, unproven at times by western medicine, but the cachet of the ages remains.  The exhibit explores the many facets of spices.</p></td></tr>
</table>
	
	<cfelse>
	<!--- stop words --->
<cfset stopWords="a,though,about,each,through,above,throughout,ed,thru,thus,across,eg,like,to,after,either,else,all,etc,also,until,although,ml,up,except,find,more,for,an,and,get,so,as,some,not,of,on,only,if,onto,with,but,by,the,in,into,over,do,or">

<cfset question=#keyword#>
<!--- removes stop words from query with parameter "question"--->
<cfset newquestionspace=insert(#question#, " ", "1")>
<cfset length=len(newquestionspace)>
<cfset newquestion=insert(" ","#newquestionspace#", "#length#")>
<CFLOOP INDEX="word" LIST="#question#" DELIMITERS=" ">
	<CFLOOP INDEX="sWord" LIST="#stopWords#" DELIMITERS=",">
		<cfif #word# is #sWord#>
			<cfset newquestion2=REReplaceNoCase(newquestion, "[^A-Za-z0-9]#word#[^A-Za-z0-9]", " ", "all")>
		<cfset newquestion=#newquestion2#>
		</cfif>
	</cfloop>
</cfloop>
<!--- end stop words and returns "newquestion"--->
<cfset newquestionL=LTrim(newquestion)>
<cfset newquestion=RTrim(newquestionL)>
<cfset stopkeyword=#newquestion#>
<!--- end stop words --->

	<table cellspacing="5" border="0">
	<cfoutput query="spiceList"><cfif displayID is ResourceID><tr><td class="smlsans" align="right" valign="top"><font color="A6A6A6">Common&nbsp;Name</font></td><td class="smlsans" align="left" valign="top">
<CF_HIGHLIGHT String="#commonName#"
              SubString="#ReReplaceNoCase(stopkeyword, " ",",","all")#"
			  OpenTag="<span class=tab0><b>"
			  CloseTag="</b></span>">
#CF_HIGHLIGHT#
</td>
	<td rowspan="10" valign="top" align="center" class="smlsans">
<a class="nonunder" href="images/#ReReplaceNoCase(CommonName, " ", "", "all")#.jpg"><img src="thumbs/#ReReplaceNoCase(CommonName, " ", "", "all")#.jpg" alt="#CommonName#" border="0"  width="200"></a> 
<br><font color="A6A6A6">Click image to enlarge</font></td></tr>
	<tr><td class="smlsans" align="right" valign="top"><font color="A6A6A6">Genus&nbsp;Species</font></td><td class="smlsans" align="left" valign="top"><em>#GenusSpecies#</em><cfif altgenusspecies is not ""> or <em>#altgenusspecies#</em></cfif>
</td></tr>
	<tr><td class="smlsans" align="right" valign="top"><font color="A6A6A6">Family</font></td><td class="smlsans" align="left" valign="top"><a class="nonunder" href="index.cfm?familySearch=yes&family=#family#&itemsuppress=yes&displayswitch=1">#family#</a></td></tr>
	<tr><td class="smlsans" align="right" valign="top"><font color="A6A6A6">Origin</font></td><td class="smlsans" align="left" valign="top"><CF_HIGHLIGHT String="#origin#"
              SubString="#ReReplaceNoCase(stopkeyword, " ",",","all")#"
			  OpenTag="<span class=tab0><b>"
			  CloseTag="</b></span>">
#CF_HIGHLIGHT#</td></tr>
	<tr><td class="smlsans" align="right" valign="top"><font color="A6A6A6">Cultivated</font></td><td class="smlsans" align="left" valign="top"><CF_HIGHLIGHT String="#cultivated#"
              SubString="#ReReplaceNoCase(stopkeyword, " ",",","all")#"
			  OpenTag="<span class=tab0><b>"
			  CloseTag="</b></span>">
#CF_HIGHLIGHT#</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<cfif CommonName2 is ""><tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr></cfif>
<!--- display secondary spice --->
<cfif ((displayID is ResourceID) AND (CommonName2 is not ""))><tr><td class="smlsans" align="right" valign="top"><font color="A6A6A6">Common&nbsp;Name</font></td><td class="smlsans" align="left" valign="top"><CF_HIGHLIGHT String="#commonName2#"
              SubString="#ReReplaceNoCase(stopkeyword, " ",",","all")#"
			  OpenTag="<span class=tab0><b>"
			  CloseTag="</b></span>">
#CF_HIGHLIGHT#</td><td rowspan="7" valign="top" align="right"  class="smlsans"></td></tr>
	<tr><td class="smlsans" align="right" valign="top"><font color="A6A6A6">Genus&nbsp;Species</font></td><td class="smlsans" align="left" valign="top"><em>#GenusSpecies2#</em><cfif altgenusspecies2 is not ""> or <em>#altgenusspecies2#</em></cfif>
</td></tr>
	<tr><td class="smlsans" align="right" valign="top"><font color="A6A6A6">Family</font></td><td class="smlsans" align="left" valign="top"><a class="nonunder" href="index.cfm?familySearch=yes&family=#family#&itemsuppress=yes&displayswitch=1">#family2#</a></td></tr>
	<tr><td class="smlsans" align="right" valign="top"><font color="A6A6A6">Origin</font></td><td class="smlsans" align="left" valign="top"><CF_HIGHLIGHT String="#origin2#"
              SubString="#ReReplaceNoCase(stopkeyword, " ",",","all")#"
			  OpenTag="<span class=tab0><b>"
			  CloseTag="</b></span>">
#CF_HIGHLIGHT#</td></tr>
<tr><td class="smlsans" align="right" valign="top"><font color="A6A6A6">Cultivated</font></td><td class="smlsans" align="left" valign="top"><CF_HIGHLIGHT String="#cultivated2#"
              SubString="#ReReplaceNoCase(stopkeyword, " ",",","all")#"
			  OpenTag="<span class=tab0><b>"
			  CloseTag="</b></span>">
#CF_HIGHLIGHT#</td></tr>
</cfif>
<!--- end display secondary spice --->
	
	<tr><td class="smlsans" align="right" valign="top"><font color="A6A6A6">Description</font></td><td class="justify" align="left" valign="top" colspan="2"><CF_HIGHLIGHT String="#description#"
              SubString="#ReReplaceNoCase(stopkeyword, " ",",","all")#"
			  OpenTag="<span class=tab0><b>"
			  CloseTag="</b></span>">
#CF_HIGHLIGHT# See a list of spices by <a class="nonunder" href="index.cfm?spicefilename=taste.txt&itemsuppress=yes&displayswitch=0">Taste&nbsp;and&nbsp;Hotness</a>.</td></tr>
	<tr><td class="smlsans" align="right" valign="top"><font color="A6A6A6">Useful&nbsp;Parts</font></td><td class="justify" align="left" valign="top" colspan="2"><CF_HIGHLIGHT String="#usefulparts#"
              SubString="#ReReplaceNoCase(stopkeyword, " ",",","all")#"
			  OpenTag="<span class=tab0><b>"
			  CloseTag="</b></span>">
#CF_HIGHLIGHT#</td></tr>
	<tr><td class="smlsans" align="right" valign="top"><font color="A6A6A6">Medicinal&nbsp;Properties</font></td><td class="justify" align="left" valign="top" colspan="2"><CF_HIGHLIGHT String="#medicinalproperties#"
              SubString="#ReReplaceNoCase(stopkeyword, " ",",","all")#"
			  OpenTag="<span class=tab0><b>"
			  CloseTag="</b></span>">#CF_HIGHLIGHT#<br><a class="nonunder" href="index.cfm?spicefilename=activeProperties.txt&itemsuppress=yes&displayswitch=0">See&nbsp;chemicals&nbsp;in&nbsp;spices.</a></td></tr>
<tr><td class="smlsans" align="right" valign="top"><font color="A6A6A6">Historical&nbsp;View</font></td><td colspan="1" class="justify" align="left" valign="top" colspan="1"><CF_HIGHLIGHT String="#historicalview#"
              SubString="#ReReplaceNoCase(stopkeyword, " ",",","all")#"
			  OpenTag="<span class=tab0><b>"
			  CloseTag="</b></span>">
#CF_HIGHLIGHT#</td><td align="right" class="smlsans" valign="top"><table cellspacing="10"><tr><td align="left" class="smlsans" valign="top"><cfif CommonName2 is not "">#commonName#<br></cfif><a class="nonunder" href="images/historical_#ReReplaceNoCase(CommonName, " ", "", "all")#.jpg"><img src="thumbs/historical_#ReReplaceNoCase(CommonName, " ", "", "all")#.jpg" alt="#CommonName#" border="0" ></a><br><font color="A6A6A6">Click image to enlarge</font></td>
 <cfif CommonName2 is not "">
<td align="left" class="smlsans" valign="top">#commonName2#<br><a class="nonunder" href="images/historical_#ReReplaceNoCase(CommonName2, " ", "", "all")#.jpg"><img src="thumbs/historical_#ReReplaceNoCase(CommonName2, " ", "", "all")#.jpg" alt="#CommonName2#" border="0" ></a><br><font color="A6A6A6">Click image to enlarge</font>
</td></cfif></tr></table></td></tr>
	</cfif></cfoutput></td></table>
	</cfif>
</tr>
</tr>
</table>
<cfinclude template="footer.cfm">
</body>
</html>
