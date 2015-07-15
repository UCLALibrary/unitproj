<!--- Include SyllabiCentral Global Variables --->
<CFINCLUDE TEMPLATE="FMGlobal.cfm">
<CFSET FILE_NAME="FMSearch.cfm">
<CFSET FILE_TITLE="Search Page">


<CFIF NOT IsDefined("SearchType")>
  <CFSET SearchType = "Keyword">
</CFIF>
<CFIF SearchType is "Keyword">
  <CFSET OnImg = "images/sral.jpg">
  <CFSET OffImg = "images/sraa.jpg">
<CFELSE>
  <CFSET OnImg = "images/slar.jpg">
  <CFSET OffImg = "images/saar.jpg">
</CFIF>

<HTML>
<HEAD>
<TITLE>Folkmed - <CFOUTPUT>#FILE_TITLE# - #SearchType#</CFOUTPUT> Search</TITLE>
<script language="JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v3.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</HEAD>

<BODY BGCOLOR=<CFOUTPUT>#FM_COLOR_BACKGROUND#</CFOUTPUT> text=<CFOUTPUT>#FM_COLOR_HIGHLIGHT#</CFOUTPUT> link=<CFOUTPUT>#FM_COLOR_HIGHLIGHT#</CFOUTPUT> alink="#0ee00" vlink="#0cd00">


<P><CFFORM NAME="SearchForm" ACTION="FMResults.cfm" METHOD="POST"> 
<P>

<CENTER><IMG SRC="images/stpl_bar.gif">
<TABLE BORDER=0>
  <TR>
    <TD ALIGN=CENTER>
      <P><IMG SRC="images/stpl_bnl.gif">
    </TD>
    <TD ALIGN=CENTER>
      <P><IMG SRC="images/fmsb.gif" WIDTH=41 HEIGHT=41 ALIGN=middle>
    </TD>
    <TD ALIGN=CENTER>
      <P><FONT SIZE="+3" face=arial, helvetica><B>search</B></FONT>
    </TD>
    <TD ALIGN=CENTER>
      <P><IMG SRC="images/stpl_bnr.gif">
    </TD>
  </TR>
</TABLE>

<TABLE BORDER=0 WIDTH="100%">
  <TR>
    <TD ALIGN=center>
      <P><FONT SIZE="+1" face=arial, helvetica><B>ucla folk medicine database</B></FONT>
    </TD>
  </TR>
</TABLE>

<IMG SRC="images/stpl_bar.gif"></CENTER>
<P>
<CENTER>
<P><IMG NAME="SearchTypeImage" SRC="<CFOUTPUT>#OnImg#</CFOUTPUT>" usemap="#search_map" BORDER=0>
<map name="search_map">
<area shape="rect" href="FMSearch.cfm?SearchType=Keyword" coords="0,0,137,19">
<area shape="rect" href="FMSearch.cfm?SearchType=Keyword" coords="0,20,56,28">
<area shape="rect" href="FMSearch.cfm?SearchType=Advanced" onMouseOver="MM_swapImage('Image1','','images/sraa.jpg',1)" onMouseOut="MM_swapImgRestore()" coords="53,28,190,47">
<area shape="rect" href="FMSearch.cfm?SearchType=Advanced" coords="127,20,190,27">
</map>
<P><IMG SRC="images/stpl_bar.gif">

<CFSWITCH EXPRESSION="#SearchType#">
<CFCASE VALUE="Advanced">

<CFQUERY NAME="FINDAGE">
SELECT FL_AGE_UID, AGE
FROM FOLKMED_AGE
ORDER BY AGE
</CFQUERY>

<CFQUERY NAME="FINDDATETEXT">
SELECT FL_DATETEXT_UID, DATETEXT, ISNUMERIC(LEFT(Datetext, 1)) AS EntryType
FROM FOLKMED_DATETEXT
ORDER BY EntryType, DATETEXT ASC
</CFQUERY>

<CFQUERY NAME="FINDREGION">
SELECT FL_REGION_UID, Region
FROM FOLKMED_REGION
ORDER BY Region
</CFQUERY>

<CFQUERY NAME="FINDETHNICITY">
SELECT DISTINCT OriginEthnicity AS ETHNICITY
FROM FOLKMED_RECORD
ORDER BY ETHNICITY
</CFQUERY>

<CFOUTPUT>
<TABLE BORDER=0 WIDTH="500">
  <TR>
    <TD width=80%>
<TABLE BORDER='0'>
  <TR>
    <TH></TH>
    <TH></TH>
    <TH></TH>
    <TH></TH>
    <TH></TH>
    <TH></TH>
  </TR>
  <TR>
    <TD>
      Condition
    </TD>
    <TD>
      <INPUT TYPE="TEXT" NAME="SUBJECT" LENGTH="32" MAXLENGTH="255">
    </TD>
    <TD>
      Therapy
    </TD>
    <TD COLSPAN='3'>
      <INPUT TYPE="TEXT" NAME="CardText" LENGTH="32" MAXLENGTH="255">
    </TD>
  </TR>
  <TR>
    <TD>
      Method Of Treatment
    </TD>
    <TD VALIGN='TOP'>
      <INPUT TYPE="TEXT" NAME="Cure" LENGTH="32" MAXLENGTH="255">
    </TD>
    <TD>
      Place Collected
    </TD>
    <TD>
      <INPUT TYPE="TEXT" NAME="CollectedPlace" LENGTH="32" MAXLENGTH="255">
    </TD>
  </TR>
  <TR>
    <TD>
      Region Of Collection
    </TD>
    <TD>
      <SELECT MULTIPLE NAME="CollectedRegion">
        <OPTION VALUE="">-- Any --</OPTION>
      <CFLOOP QUERY="FINDREGION">
        <OPTION VALUE="#FINDREGION.FL_REGION_UID#">#Trim(FINDREGION.REGION)#</OPTION>
      </CFLOOP>
      </SELECT>
    </TD>
    <TD>
      Date Collected
    </TD>
    <TD>
      <SELECT MULTIPLE NAME="CollectedDate">
        <OPTION VALUE="">-- Any --</OPTION>
      <CFLOOP QUERY="FINDDATETEXT">
        <OPTION VALUE="#FINDDATETEXT.FL_DATETEXT_UID#">#Trim(FINDDATETEXT.DATETEXT)#</OPTION>
      </CFLOOP>
      </SELECT>
    </TD>
  </TR>
  <TR>
    <TD>
      Informant Ethnicity
    </TD>
    <TD>
      <INPUT TYPE="TEXT" NAME="InformantEthnicity" LENGTH="32" MAXLENGTH="255">
    </TD>
    <TD>
      Place Of Origin
    </TD>
    <TD>
      <INPUT TYPE="TEXT" NAME="OriginPlace" LENGTH="32" MAXLENGTH="255">
    </TD>
  </TR>
  <TR>
    <TD>
      Informant Gender
    </TD>
    <TD>
      <SELECT MULTIPLE NAME='InformantGender' SIZE="3">
        <OPTION VALUE="1">Female
        <OPTION VALUE="2">Male
      </SELECT>
    </TD>
    <TD>
      Region Of Origin
    </TD>
    <TD>
      <SELECT MULTIPLE NAME="OriginRegion">
        <OPTION VALUE="">-- Any --</OPTION>
<CFLOOP QUERY="FINDREGION">
        <OPTION VALUE="#FINDREGION.FL_REGION_UID#">#Trim(FINDREGION.REGION)#</OPTION>
</CFLOOP>
      </SELECT>
    </TD>
  </TR>
  <TR>
    <TD>
      Informant Age
    </TD>
    <TD>
      <SELECT MULTIPLE NAME="InformantAge">
        <OPTION VALUE="">-- Any --</OPTION>
        <OPTION VALUE="4">infant</OPTION>
        <OPTION VALUE="2">child</OPTION>
        <OPTION VALUE="3">teenager</OPTION>
        <OPTION VALUE="5">adult</OPTION>
        <OPTION VALUE="1">senior</OPTION>
      </SELECT>
    </TD>
    <TD>
      Ethnicity Of Origin
    </TD>
    <TD>
      <INPUT TYPE="TEXT" NAME="OriginEthnicity" LENGTH="32" MAXLENGTH="255">
    </TD>
  </TR>
  <TR>
    <TD>
      Citation
    </TD>
    <TD COLSPAN='5' ALIGN='LEFT'>
      <INPUT TYPE="TEXT" NAME="Citation" LENGTH="32" MAXLENGTH="255">
    </TD>
  </TR>
</TABLE>
    </td>
<!---  Graphic Removed from Search Page - rmg
    <td width=70>
      <img src="images/cod.jpg" width=70 height=200>
    </td>
--->
  </TR>
</TABLE>
</CFOUTPUT>

</CFCASE>
<CFCASE VALUE="Keyword">
<BR><BR>
<TABLE BORDER=0 WIDTH="500">
  <TR>
    <TD width=80%>
      <table border=0 cellpadding=5 cellspacing=0>
        <TR>
          <TD WIDTH="33%" ALIGN="RIGHT">
              <font face=arial, helvetica><b>keyword search:</b>
          </TD>
          <TD COLSPAN=2>
            <INPUT TYPE=text NAME='Text' SIZE=30>
          </TD>
        </TR>
      </TABLE>
    </td>
<!---  Graphic Removed from Search Page - rmg
    <td width=70>
      <img src="images/cod.jpg" width=70 height=200>
    </td>
--->
  </TR>
</TABLE>

</CFCASE>
</CFSWITCH>

<BR>
<BR>
<CENTER><IMG SRC="images/stpl_bar.gif"> 
<CENTER>
<TABLE BORDER=0 WIDTH="500">
  <TR>
    <TD WIDTH="33%">
      <P ALIGN=right>
      <font face=arial, helvetica><B>when searching:</B>
    </TD>
    <TD>
      <DL>
        <DT>
          <INPUT TYPE=radio NAME="BoolOp" VALUE=AND CHECKED="">
          <font face=arial, helvetica >match all words between fields (and)
        </DT>
        <DT>
          <INPUT TYPE=radio NAME="BoolOp" VALUE=OR>
          <font face=arial, helvetica>match any words between fields (or)
        </DT>
      </DL>
    </TD>
  </TR>
</TABLE>

<TABLE BORDER=0 WIDTH="100%">
  <TR>
    <TD WIDTH="33%">
      <P ALIGN=right>
      <font face=arial, helvetica ><B>return:</B>
    </TD>
    <TD>
      <font face=arial, helvetica >
      <P>
      <SELECT NAME="MaxRecords">
        <OPTION VALUE=5>5
        <OPTION VALUE=10 SELECTED="">10
        <OPTION VALUE=20>20
        <OPTION VALUE=30>30
        <OPTION VALUE=50>50
        <OPTION VALUE=all>all
      </SELECT>
      <B> records at a time.</B>
    </TD>
  </TR>
</TABLE>

<P>
<IMG SRC="images/stpl_bar.gif">
<BR>
<INPUT TYPE=submit NAME="Find" VALUE="Start Search">
<SPACER TYPE=horizontal SIZE=15>
<INPUT TYPE=reset VALUE="Reset this form">
</P>
</CENTER>
<P>
<A HREF="default.htm"><font face=arial, helvetica><b>return home</b></A></CFFORM>
</P>
<CFINCLUDE TEMPLATE="FMGlobalFooter.cfm">
</BODY>
</HTML>