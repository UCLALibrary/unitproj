<!--- Include SyllabiCentral Global Variables --->
<CFINCLUDE TEMPLATE="FMGlobal.cfm">
<CFSET FILE_NAME="FMDetail.cfm">
<CFSET FILE_TITLE="Detail Page">

<CFSET TableUID = GetToken(UID, 1, "_")>
<CFSET RowUID = GetToken(UID, 2, "_")>

<CFQUERY NAME="GetTable"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_USER_NAME#"
         PASSWORD="#FM_USER_PASS#">
SELECT TableName FROM FOLKMED_TABLES WHERE TABLES_UID = #TableUID#
</CFQUERY>

<CFQUERY NAME="GetDetail"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_USER_NAME#"
         PASSWORD="#FM_USER_PASS#">
SELECT a.Subject, a.Cure, a.Cause, a.Sign, a.Citation, a.CardText, a.InformantEthnicity, a.InformantGender, c.Age AS 'InformantAge', a.Collector, a.CollectedPlace, d1.Region AS 'CollectedRegion', e.DateText AS 'CollectedDate', a.OriginEthnicity, a.OriginPlace, d2.Region AS 'OriginRegion', a.VolumeNumber, a.PageReference
FROM #GetTable.TableName# a, FOLKMED_AGE c, (SELECT REGION FROM FOLKMED_REGION a, #GetTable.TableName# b WHERE b.CollectedRegion*=a.FL_REGION_UID AND b.FL_RECORD_UID = #RowUID#) d1, (SELECT REGION FROM FOLKMED_REGION a, #GetTable.TableName# b WHERE b.OriginRegion*=a.FL_REGION_UID AND b.FL_RECORD_UID = #RowUID#) d2, FOLKMED_DATETEXT e
WHERE FL_RECORD_UID = #RowUID# AND a.InformantAge *= c.FL_AGE_UID AND a.CollectedDate *= e.FL_DATETEXT_UID
</CFQUERY>

<HTML>
<HEAD>
<TITLE><CFOUTPUT>#FILE_TITLE#</CFOUTPUT></TITLE>
</HEAD>
<BODY BGCOLOR="#FFFFFF" link="#08b00" alink="#0ee00" vlink="#0cd00">
<CENTER><IMG SRC="images/stpl_bar.gif">
<TABLE BORDER=0>
  <TR>
    <TD ALIGN=CENTER>
      <P><IMG SRC="images/stpl_bnl.gif">
    </TD>
    <TD ALIGN=CENTER>
      <P>
      <FONT SIZE="+3" color="#08b00" face=arial, helvetica>
        <B>record detail</B>
      </FONT>
    </TD>
    <TD ALIGN=CENTER>
      <P><IMG SRC="images/stpl_bnr.gif">
    </TD>
  </tr>
</table>

<table border=0>
  <tr>
    <td>
      <center>
        <img src="images/plantborder1.jpg" width=300 height=70>
    </TD>
  </TR>
</TABLE>

<center>
<IMG SRC="images/stpl_bar.gif">
</CENTER>
<P>
<CFOUTPUT QUERY="GetDetail">
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
      <FONT color="##08b00">Condition</FONT>
    </TD>
    <TD>
      #SUBJECT#
    </TD>
    <TD>
      <CFIF Trim(CardText) is not "">
      <FONT color="##08b00">Belief</FONT>
      </CFIF>
    </TD>
    <TD COLSPAN='3'>
      #CardText#
    </TD>
  </TR>
  <TR>
    <TD>
      <CFIF Trim(CURE) is not "">
        <FONT color="##08b00">Method Of Treatment</FONT>
      </CFIF>
    </TD>
    <TD VALIGN='TOP'>
      #CURE#
    </TD>
    <TD>
      <CFIF Trim(CollectedDate) is not "">
      <FONT color="##08b00">Date Collected</FONT>
      </CFIF>
    </TD>
    <TD>
      #CollectedDate#
    </TD>
  </TR>
  <TR>
    <TD>
      <CFIF Trim(CollectedRegion) is not "">
      <FONT color="##08b00">Region Of Collection</FONT>
      </CFIF>
    </TD>
    <TD>
      #CollectedRegion#
    </TD>
    <TD>
      <CFIF Trim(CollectedPlace) is not "">
      <FONT color="##08b00">Place Collected</FONT>
      </CFIF>
    </TD>
    <TD>
      #CollectedPlace#
    </TD>
  </TR>
  <TR>
    <TD>
      <CFIF Trim(InformantEthnicity) is not "">
      <FONT color="##08b00">Informant Ethnicity</FONT>
      </CFIF>
    </TD>
    <TD>
      #InformantEthnicity#
    </TD>
    <TD>
      <CFIF Trim(OriginPlace) is not "">
      <FONT color="##08b00">Place Of Origin</FONT>
      </CFIF>
    </TD>
    <TD>
      #OriginPlace#
    </TD>
  </TR>
  <TR>
    <TD>
      <FONT color="##08b00">Informant Gender</FONT>
    </TD>
    <TD>
<CFSWITCH EXPRESSION="#InformantGender#"><CFCASE VALUE="1">Female</CFCASE><CFCASE VALUE="2">Male</CFCASE><CFCASE VALUE="3">Not Disclosed/Unknown</CFCASE></CFSWITCH>
    </TD>
    <TD>
      <CFIF Trim(OriginRegion) is not "">
      <FONT color="##08b00">Region Of Origin</FONT>
      </CFIF>
    </TD>
    <TD>
      #OriginRegion#
    </TD>
  </TR>
  <TR>
    <TD>
      <CFIF Trim(InformantAge) is not "">
      <FONT color="##08b00">Informant Age</FONT>
      </CFIF>
    </TD>
    <TD>
      #InformantAge#
    </TD>
    <TD>
      <CFIF Trim(OriginEthnicity) is not "">
      <FONT color="##08b00">Ethnicity Of Origin</FONT>
      </CFIF>
    </TD>
    <TD>
      #OriginEthnicity#
    </TD>
  </TR>
  <TR>
    <TD ROWSPAN='2'>
      <FONT color="##08b00">Citation</FONT>
    </TD>
    <TD ROWSPAN='2' COLSPAN='3'>
      #Citation#
    </TD>
    <TD>
      <FONT color="##08b00">Volume Number</FONT>
    </TD>
    <TD>
      #VolumeNumber#
    </TD>
  </TR>
  <TR>
    <TD>
      <FONT color="##08b00">Page Number</FONT>
    </TD>
    <TD>
      #PageReference#
    </TD>
  </TR>
  <TR>
    <TD>
      <FONT color="##08b00">Folkmed Record Number</FONT>
    </TD>
    <TD>
      #UID#
    </TD>
  </TR>
</TABLE>
</CFOUTPUT>
</P>

<CENTER><IMG SRC="images/stpl_bar.gif"><BR></CENTER>

<font face=arial, helvetica>
  <P> Press the
      <B><A HREF="javascript:top.history.back()"><font color="#08b00">Back</font></A></B>
      button in your browser.
  </P>
</FONT>
<CFINCLUDE TEMPLATE="FMGlobalFooter.cfm">
</BODY>
</HTML>
