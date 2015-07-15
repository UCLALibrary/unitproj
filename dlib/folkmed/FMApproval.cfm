<!--- Include SyllabiCentral Global Variables --->
<CFINCLUDE TEMPLATE="FMGlobal.cfm">
<CFSET FILE_NAME="FMApproval.cfm">
<CFSET FILE_TITLE="Record Approval">

<CFIF NOT IsDefined("ACTION")>
  <CFSET ACTION="List">
</CFIF>

<HTML>
<HEAD>
<TITLE>FolkMed - <CFOUTPUT>#FILE_TITLE# #ACTION#</CFOUTPUT></TITLE>

<SCRIPT LANGUAGE=JAVASCRIPT>
<!--
function CheckLength(obj, limit)
{
  if(obj.value.length > limit)
    alert(obj.name + " Field is too long. (Limit is " + limit + " characters)");
  return true;
}
-->
</SCRIPT>

</HEAD>
<CFOUTPUT>
<BODY>
<CFINCLUDE TEMPLATE="FMAdminHeader.cfm">
<CENTER>
<CFSWITCH EXPRESSION="#ACTION#">
<CFCASE VALUE="List">
<CFQUERY NAME="GETTABLES"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT TABLES_UID, TABLENAME
FROM FOLKMED_TABLES
</CFQUERY>
<CFSET Iter = 0>
<CFQUERY NAME="GETNEWRECORDS"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#"
         DEBUG>
<CFLOOP QUERY="GETTABLES">
<CFIF Iter is NOT 0>
UNION ALL
</CFIF>
SELECT FL_RECORD_UID, SUBJECT, CURE, #GETTABLES.TABLES_UID# AS TABLENUM
FROM #GETTABLES.TABLENAME#
WHERE SYSFLAGS = 0
<CFSET Iter = 1>
</CFLOOP>
</CFQUERY>
<BR>
<TABLE BORDER=1>
  <TR>
    <TH>
      Record ID
    </TH>
    <TH>
      Subject
    </TH>
    <TH>
      Cure
    </TH>
  </TR>
<CFLOOP QUERY="GETNEWRECORDS">
  <TR>
    <TD>
      <A HREF="FMApproval.cfm?Action=Confirm&UID=#GETNEWRECORDS.TABLENUM#_#GETNEWRECORDS.FL_RECORD_UID#">#GETNEWRECORDS.TABLENUM#_#GETNEWRECORDS.FL_RECORD_UID#</A>
    </TD>
    <TD>
      #GETNEWRECORDS.SUBJECT#
    </TD>
    <TD>
      #GETNEWRECORDS.CURE#
    </TD>
  </TR>
</CFLOOP>
</TABLE>
</CENTER>
</CFCASE>
<CFCASE VALUE="Confirm">

<CFSET TABLENUM = GetToken(UID, 1, "_")>
<CFSET ROWNUM = GetToken(UID, 2, "_")>

<CFQUERY NAME="GetTable"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT TableName FROM FOLKMED_TABLES WHERE TABLES_UID = #TABLENUM#
</CFQUERY>

<CFQUERY NAME="GETRECORD"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT a.Subject, a.Cure, a.Cause, a.Sign, a.Citation, a.CardText, a.InformantEthnicity, a.InformantGender, c.Age AS 'InformantAge', a.Collector, a.CollectedPlace, d1.Region AS 'CollectedRegion', e.DateText AS 'CollectedDate', a.OriginEthnicity, a.OriginPlace, d2.Region AS 'OriginRegion', a.VolumeNumber, a.PageReference
FROM #GetTable.TableName# a, FOLKMED_AGE c, (SELECT REGION FROM FOLKMED_REGION a, #GetTable.TableName# b WHERE b.CollectedRegion*=a.FL_REGION_UID AND b.FL_RECORD_UID = #ROWNUM#) d1, (SELECT REGION FROM FOLKMED_REGION a, #GetTable.TableName# b WHERE b.OriginRegion*=a.FL_REGION_UID AND b.FL_RECORD_UID = #ROWNUM#) d2, FOLKMED_DATETEXT e
WHERE FL_RECORD_UID = #ROWNUM# AND a.InformantAge *= c.FL_AGE_UID AND a.CollectedDate *= e.FL_DATETEXT_UID
</CFQUERY>
<H2>Confirm Record Approval</H2>
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
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Subject</FONT>
    </TD>
    <TD>
      #GETRECORD.SUBJECT#
    </TD>
    <TD>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Card Text</FONT>
    </TD>
    <TD COLSPAN='3'>
      #GETRECORD.CardText#
    </TD>
  </TR>
  <TR>
    <TD>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Cure</FONT>
    </TD>
    <TD VALIGN='TOP'>
      #GETRECORD.CURE#
    </TD>
  </TR>
  <TR>
    <TD>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Cause</FONT>
    </TD>
    <TD COLSPAN='4'>
      #GETRECORD.Cause#
    </TD>
  </TR>
  <TR>
    <TD ROWSPAN='2'>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Sign</FONT>
    </TD>
    <TD ROWSPAN='2'>
      #GETRECORD.Sign#
    </TD>
    <TD>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Place Collected</FONT>
    </TD>
    <TD>
      #GETRECORD.CollectedPlace#
    </TD>
  </TR>
  <TR>
    <TD>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Region Of Collection</FONT>
    </TD>
    <TD>
      #GETRECORD.CollectedRegion#
    </TD>
  </TR>
  <TR>
    <TD>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Collector</FONT>
    </TD>
    <TD>
      #GETRECORD.Collector#
    </TD>
    <TD>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Date Collected</FONT>
    </TD>
    <TD>
      #GETRECORD.CollectedDate#
    </TD>
  </TR>
  <TR>
    <TD>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Informant Ethnicity</FONT>
    </TD>
    <TD>
      #GETRECORD.InformantEthnicity#
    </TD>
    <TD>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Place Of Origin</FONT>
    </TD>
    <TD>
      #GETRECORD.OriginPlace#
    </TD>
  </TR>
  <TR>
    <TD>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Informant Gender</FONT>
    </TD>
    <TD>
<CFSWITCH EXPRESSION="#GETRECORD.InformantGender#"><CFCASE VALUE="1">Female</CFCASE><CFCASE VALUE="2">Male</CFCASE><CFCASE VALUE="3">Not Disclosed/Unknown</CFCASE></CFSWITCH>
    </TD>
    <TD>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Region Of Origin</FONT>
    </TD>
    <TD>
      #GETRECORD.OriginRegion#
    </TD>
  </TR>
  <TR>
    <TD>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Informant Age</FONT>
    </TD>
    <TD>
      #GETRECORD.InformantAge#
    </TD>
    <TD>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Ethnicity Of Origin</FONT>
    </TD>
    <TD>
      #GETRECORD.OriginEthnicity#
    </TD>
  </TR>
  <TR>
    <TD ROWSPAN='2'>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Citation</FONT>
    </TD>
    <TD ROWSPAN='2' COLSPAN='3'>
      #GETRECORD.Citation#
    </TD>
    <TD>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Volume Number</FONT>
    </TD>
    <TD>
      #GETRECORD.VolumeNumber#
    </TD>
  </TR>
  <TR>
    <TD>
      <FONT COLOR=#FM_COLOR_HIGHLIGHT#>Page or Item Number</FONT>
    </TD>
    <TD>
      #GETRECORD.PageReference#
    </TD>
  </TR>
</TABLE>
<FORM NAME="ApproveRecord" ACTION="FMApproval.cfm" Method="POST">
<INPUT TYPE="HIDDEN" NAME="ACTION" VALUE="Approve">
<INPUT TYPE="HIDDEN" NAME="ROWNUM" VALUE="#ROWNUM#">
<INPUT TYPE="HIDDEN" NAME="TABLENUM" VALUE="#TABLENUM#">
<INPUT TYPE="BUTTON" NAME="Cancel" VALUE="Cancel" OnClick="window.history.back();">
<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="Approve Record">
</FORM>
</CFCASE>
<CFCASE VALUE="Approve">

<CFQUERY NAME="GetTable"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT TableName FROM FOLKMED_TABLES WHERE TABLES_UID = #TABLENUM#
</CFQUERY>

<CFQUERY NAME="ApproveRecord"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
UPDATE #GETTABLE.TableName# SET SYSFLAGS = 1 WHERE FL_RECORD_UID = #ROWNUM#
</CFQUERY>

<H2>Record Approved!</H2>
Go Back to <A HREF="FMApproval.cfm">List</A>...
</CFCASE>
</CFSWITCH>
</CENTER>
<P ALIGN='RIGHT'><A HREF="http:\\www.hcf.ucla.edu"><IMG BORDER=0 SRC="images/madebyHCF.jpg"></A></P>
</BODY>
</CFOUTPUT>
</HTML>