<cfparam name="q1" default="">
<cfparam name="q2" default="">
<cfparam name="q3" default="">
<cfset type = "none">
<cfset QuestionAnswer = StructNew()>
<cfloop collection="#Form#" item="VarName">
  <cfif not FindNoCase("fieldnames", LCase(VarName))>
    <cfset val = StructInsert(QuestionAnswer, "#VarName#", "#Form[VarName]#")>
  </cfif>
</cfloop>
<cfloop collection="#QuestionAnswer#" item="Q">
  <cfif #QuestionAnswer[Q]# is "a">
    <cfset type = 1>
    <cfbreak>
  <cfelse>
    <cfloop collection="#QuestionAnswer#" item="Q">
      <cfif #QuestionAnswer[Q]# is "b">
        <cfset type = 3>
		<cfbreak>
	  <cfelse>
	    <cfset type = 2>	  
	  </cfif>
	</cfloop>
  </cfif>
</cfloop>

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>Where Do You Stand?</title>

<link rel="stylesheet" type="text/css" href="css/0500.css">
<link rel="stylesheet" type="text/css" href="../css/global.css">
<style type="text/css">	<!--
	body {
		background-image: url(images/05_background3.gif);
	}
	-->
</style>
<script language="JavaScript" src="javascript/analysis_validator.js" type="text/javascript"></script>
<cfinclude template="../objects/js_Menu_Global.cfm">
</head>

<body>

<cfinclude template="../objects/navigation.cfm">
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr>
  <td></td>
  <td align="center"><img src="images/05_analysis_hed.gif" alt="Your Are..." width="201" height="67" border="0" style="margin: 10px 0 10px 0;"></td>
  <td></td>
 </tr>
 <tr valign="top">
  <td width="120" align="right" valign="bottom">
<!-- begin left column -->  

<!-- previous button -->
<form action="02.cfm" method="post">
<cfoutput>
<input type="image"
       src="images/05_previous.gif"
       alt="Previous"
       width="93"
       height="43"
       border="0">
<input type="hidden"
       name="q1"
       value="#q1#">
<input type="hidden"
       name="q2"
       value="#q1#">
<input type="hidden"
       name="q3"
       value="#q1#">
</cfoutput>
</form>

<!-- end left column -->
  </td>
  <td>
   <table width="426" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
     <td><img src="images/05_border_top.gif" width="426" height="19"></td>
    </tr>
    <tr>
     <td background="images/05_border.gif">
<div class="copy">
<!-- begin content -->  


<cfif q1 is "" or q2 is "" or q3 is "">
<h2>Error</h2>
<p>
Sorry, you must answer all of the questions.  Please return to the quiz by clicking the button below.
</p>
<cfoutput>
<div align="center">
<form action="02.cfm" method="post">
<input type="submit" value="Return to quiz" class="form">
<input type="hidden" name="q1" value="#q1#">
<input type="hidden" name="q2" value="#q2#">
<input type="hidden" name="q3" value="#q3#">
</form>
</div>
</cfoutput>
<cfelse>
<cfswitch expression="#type#">
  <cfcase value="1">
<p align="center">
<img src="images/05_analysis_cheat.gif" alt="Such a Cheater" width="189" height="105" border="0">
</p>
<p>
No one likes to be called a cheater, but the truth hurts doesn't it?  Maybe you've never been caught before. Maybe school life is too much pressure to deal with. Maybe you cheated just once when you were in a bind. But ya know, it really doesn't matter if you cheat just once or cheat a million times. If you get caught cheating at UCLA, you won't just be dealing with your parents&mdash;you'll be dealing with the Dean and you could end up getting suspended or kicked out of the University. And if you're kicked out of the University, we're talkin' the entire University of California. Forever. Not worth it, is it? 
</p>
<p>
If you're not sure how else to cope with the pressures of school, there are tons of <a href="../06/02.cfm" target="_blank">free resources and workshops on campus</a> to help students deal&mdash;try them. 
</p>
  </cfcase>
  <cfcase value="2">
<p align="center">
<img src="images/05_analysis_perfect.gif" alt="The Perfect Straightedge" width="299" height="150" border="0">
</p>
<p>
You do things by the book&mdash;at least things related to academics. You work hard and take pride in your work&mdash;and people respect you (or maybe resent you...) for this. You'll get ahead on your own merits and will be able to walk at graduation with your head held high. With the self-discipline and drive that you've developed, you'll go far. Just be sure to maintain your values and work ethic when you enter the workforce. 
</p>
<p>
There are <a href="../06/02.cfm" target="_blank">tons of free resources and workshops on campus</a> to help busy students stay on top of things and get ahead&mdash;check them out. Maybe you could even lead a workshop.   
</p>
  </cfcase>
  <cfcase value="3">
<p align="center">
<img src="images/05_analysis_flirt.gif" alt="Flirting with Disaster" width="240" height="96" border="0">
</p>
<p>
Sometimes you're naughty, sometimes you're nice. Depends on the situation. If you're tempted to cheat, it's usually because you didn't allow yourself enough time, not because you're just trying to get ahead of the pack or are a committed cheater. And if you rush an assignment, you could be in danger of <a href="../03/01.cfm" target="_blank">accidentally plagiarizing</a>. You just need to plan ahead and stay in control of your busy schedule. There are <a href="../06/02.cfm" target="_blank">tons of free resources and workshops on campus</a> to help students deal&mdash;try them! And make use of your professors' office hours. The whole point of your undergraduate education is to learn, and they're here to help you do just that. 
</p>
    </cfcase>
</cfswitch>
<div align="center">
<form action="02.cfm" method="post">
<input type="submit" value="Do over" class="form">
<cfoutput>
<input type="hidden" name="q1" value="#q1#">
<input type="hidden" name="q2" value="#q2#">
<input type="hidden" name="q3" value="#q3#">
</cfoutput>
</form>
</div>
</cfif>


<!-- end content -->
</div>
     </td>
    </tr>
    <tr>
     <td><img src="images/05_border_bottom.gif" width="426" height="19"></td>
    </tr>
   </table>
  </td>
  <td width="204" align="left" valign="bottom">
<!-- begin right column -->

<!-- next button -->
<a href="03.cfm"><img src="images/05_next.gif" alt="Next" width="68" height="44" border="0" class="next"></a>

<!-- end right column -->  
   </td>
 </tr>
 <tr>
  <td></td>
  <td align="center"><div class="logo">
<a href="http://www.library.ucla.edu/" target="_blank"><img src="images/05_ucla_logo.gif" alt="UCLA Library" width="86" height="73" border="0" ></a>
</div>
  </td>
  <td></td>
 </tr>
</table>
</body>
</html>