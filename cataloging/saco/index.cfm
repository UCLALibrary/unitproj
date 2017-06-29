<html>
<head>
<title>Subject Authority Proposal Form</title>

</head>
<body bgcolor="#ffffff" link="#000066" vlink="#A197CC" alink="#B3B3B3">

<cfinclude template="../application.cfm">
<cfinclude template="../includes/incBegin.cfm">

<center>
  <h2>UCLA Library Cataloging & Metadata Center<BR>
    LC Subject Authority Proposal Form</h2>
</center>
<hr>
<p><font size="-1">(Revised February 19, 2010)</font></p>
<h3>Instructions</h3>
<ol>
  <li> Use the pull-down menus to select the appropriate MARC 21 tag for each      field. </li>
      <li><strong>Do not explicitly code for an initial subfield </strong>in any field (i.e.,      $a, $w, $z) </li>
      <li><strong>Use the dollar sign $ </strong>to note a delimiter before the subfield code      (e.g, $x, $z) </li>
      <li><strong>If proposed heading is 100, 110, 111, or 130, supply</strong> the      appropriate indicator; 150s-151s do not require indicator; apply this instruction      to 4xxs and 5xxs also. <br>
        Do NOT include a second indicator under any circumstances!</li>
      <li> 1XX, 4XX, or 5XX <strong>headings with subdivisions</strong> require keying the      subfields by using a delimiter ($) and the appropriate MARC subfield code. </li>
      <li> Add diacritics preceding the affected letter (e.g., M(acute)exico) as      appropriate.<strong> Please save time by copying and pasting from the <a href="http://www.loc.gov/catdir/pcc/053/dlist.html" target="_blank"> list      of diacritics</a>.</strong> Using this lists helps prevent typos and provides      a uniform name for the diacritic.      </li>
<li> When citing geographic coordinates use the uniform name for the diacritic.<br>
        (e.g., 47deg. 35min. 34sec.N should be input as <strong> 47(degree) 35(miagkii znak) 34(tvyerdi znak) N</strong>) </li>
      <li>For additional help go to the <a href="http://www.loc.gov/catdir/pcc/saco/sacohelp.html">Guidelines</a> for      formulating LCSH proposals. </li>
  </ol>
<!--BEGIN FORM-->


<FORM ACTION="http://services.library.ucla.edu/cgi-bin/formmail" METHOD="post">
<!--HIDDEN FIELDS-->
<INPUT TYPE="hidden" NAME="zrequired" VALUE="zfrom,date">
<INPUT TYPE="hidden" NAME="zrecipient" VALUE="idagher@library.ucla.edu">
<INPUT TYPE="hidden" NAME="zsubject" VALUE="SACO Proposal">
<INPUT TYPE="hidden" NAME="zsort" VALUE="order:zfrom,date,f008_02,f053,1xx,ind1,f1XX_heading,4xx1,ind2,f4XX_1_heading,4xx2,ind3,f4XX_2_heading,4xx3,ind4,f4XX_3_heading,4xx4,ind5,f4XX_4_heading,5xx1,ind6,f5XX_1_heading,5xx2,ind7,f5XX_2_heading,5xx3,ind8,f5XX_3_heading,sources_1st670,sources_2nd670,sources_3rd670,sources_4th670,sources_5th670,not_found_675,f680,f781_subdivision,667_geographic_subdivision,bfm,pattern,comments">
<INPUT TYPE="hidden" NAME="ztitle" VALUE="Your SACO Proposal has been sent">

<!--FORM FIELDS-->
<p>Your name (required): <input name="zfrom" size=20>
<p>Today's date (required): <input name="date" size=20>
<p><input name="f008_02" type=radio value="i"> May Subdivide Geographically
 <input name="f008_02"
type=radio value="-"> Not Subdivided Geographically <input name="f008_02" 
type=radio value="|"> No Decision
<p>040: CLU

  <p>Input Classification Number, if appropriate (SCM H364 sec. 3)<br>
    053: 
    <input name="f053" size=60>
    <br>
    *Please note, if entering a new number a separate classification proposal 
    form must be filled out manually and submitted to the SACO coordinator on 
    the PDF form found on the PCC/SACO page. <br>
  <p> 
    <select name="1xx" size="1">
      <option>150 
      <option>151 
      <option>100 
      <option>110 
      <option>130 
      <option>111 
    </select>
    <input name="ind1" size=2>
    : 
    <input name="f1XX_heading" size=120>
  <p>
<select name="4xx1">
<option>450 
<option>451
<option>400
<option>410
<option>430
<option>411
</select><input name="ind2" size=2>: <input name="f4XX_1_heading" size=120>
<p>
<select name="4xx2">
<option>450 
<option>451
<option>400
<option>410
<option>430
<option>411
</select><input name="ind3" size=2>: <input name="f4XX_2_heading" size=120>
<p>
<select name="4xx3">
<option>450 
<option>451
<option>400
<option>410
<option>430
<option>411
</select><input name="ind4" size=2>: <input name="f4XX_3_heading" size=120>
<p>
<select name="4xx4">
<option>450 
<option>451
<option>400
<option>410
<option>430
<option>411
</select><input name="ind5" size=2>: <input name="f4XX_4_heading" size=120>
<p>
<select name="5xx1">
<option>550 
<option>551
<option>500
<option>510
<option>530
<option>511
</select><input name="ind6" size=2>
    : <b>(BT)</b> (Select 5XX from drop-down menu.) <b>Do not input subfields 
    $w or $a. </b>Refer to <b>SCM H 370</b> 
    <input name="f5XX_1_heading" size=120>
  <p> 
    <select name="5xx2">
      <option>550 
      <option>551 
      <option>500 
      <option>510 
      <option>530 
      <option>511 
    </select>
    <input name="ind7" size=2>
    : <b>(BT)</b> (Select 5XX from drop-down menu.) <b>Do not input subfields 
    $w or $a. </b>Refer to <b>SCM H 370</b>
    <input name="f5XX_2_heading" size=120>
  <p> 
    <select name="5xx3">
      <option>550 
      <option>551 
      <option>500 
      <option>510 
      <option>530 
      <option>511 
    </select>
    <input name="ind8" size=2>
    : <b>(RT)</b> (Select 5XX from drop-down menu.) <b>Do not input subfields 
    $w or $a. </b>Refer to <b>SCM H 370</b> 
    <input name="f5XX_3_heading" size=120>
  <p>670 Work cat.: (Include <b>subfield $b</b> when appropriate.)
    <TEXTAREA NAME="sources_1st670" ROWS=3 COLS=90 WRAP="virtual"></TEXTAREA>
  <p>670 Additional Sources: <TEXTAREA NAME="sources_2nd670" ROWS=3 COLS=90 WRAP="virtual"></TEXTAREA> 
<p>670 Additional Sources: <TEXTAREA NAME="sources_3rd670" ROWS=3 COLS=90 WRAP="virtual"></TEXTAREA> 
<p>670 Additional Sources: <TEXTAREA NAME="sources_4th670" ROWS=3 COLS=90 WRAP="virtual"></TEXTAREA> 
<p>670 Additional Sources: <TEXTAREA NAME="sources_5th670" ROWS=3 COLS=90 WRAP="virtual"></TEXTAREA> 
  <p>675 Sources not found (When supplying more than one title, precede each with 
    a <b>subfield $a</b>): 
    <input name="not_found_675" size=120 maxlength=600>
<p>680 Scope Note: <TEXTAREA NAME="f680" ROWS=3 COLS=80 WRAP="virtual"></TEXTAREA>
  <p> <b>If the 1XX is a 151, supply the 781 field according to SCM H836. Do not 
    supply initial subfield $z; supply 2nd subfield $z as needed </b>(e.g., Mexico 
    <b>$z</b> Tanchipa Mountains)
  <p>781 Geographic subdivision:
<input name="f781_subdivision" size=110>
<p>
If 781 is not appropriate for the 151 heading (e.g., a celestial body or a geographic 
entity in a city; cf. SCM H 836) supply a 667 field with this note: 
This heading is not valid for use as a geographic subdivision.

<p>667 Note: <input name="667_geographic_subdivision" size=100> 
<p>952 <input name="bfm" size=6> bib records to be changed (optional)
<p>LC pattern or SCM instruction sheet: <input name="pattern" size=90>
<p>Comments/Additional fields:<br>
<TEXTAREA NAME="comments" ROWS=3 COLS=90 WRAP="virtual"></TEXTAREA> 
<p>
<INPUT TYPE="submit" NAME="submit" VALUE="Send to Iman Dagher">
<INPUT TYPE="reset"  NAME="cancel" VALUE="Clear Form">
</FORM>

<cfinclude template="../includes/incEnd.cfm">

</BODY>
</HTML>

