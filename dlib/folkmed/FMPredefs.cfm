<CFINCLUDE TEMPLATE="FMGlobal.cfm">
<CFSET FILE_NAME="FMPredefs.cfm">
<CFSET FILE_TITLE="FolkMed Predefined Fields">

<CFIF NOT IsDefined("ACTION")>
<CFSET ACTION="Enter">
</CFIF>

<HTML>
<HEAD>
<TITLE> <CFOUTPUT>#FILE_TITLE#</CFOUTPUT> </TITLE>
</HEAD>
<CFOUTPUT>
<BODY>
</CFOUTPUT>

<CFINCLUDE TEMPLATE="FMAdminHeader.cfm">

<CFSWITCH EXPRESSION="#ACTION#">
<CFCASE VALUE="Enter">
<CFQUERY NAME="GetRegions"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT a.FL_REGION_UID, a.NumRecords, b.REGION
FROM 
(SELECT COUNT(FL_RECORD_UID) AS 'NumRecords', b.FL_REGION_UID
 FROM FOLKMED_RECORD a, FOLKMED_REGION b
 WHERE b.FL_REGION_UID *= a.CollectedRegion OR b.FL_REGION_UID *= a.OriginRegion
 GROUP BY b.FL_REGION_UID) a, FOLKMED_REGION b
WHERE b.FL_REGION_UID *= a.FL_REGION_UID
ORDER BY b.REGION
</CFQUERY>

<CFQUERY NAME="GetDateText"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT a.FL_DATETEXT_UID, a.NumRecords, b.DATETEXT
FROM 
(SELECT COUNT(FL_RECORD_UID) AS 'NumRecords', b.FL_DATETEXT_UID
 FROM FOLKMED_RECORD a, FOLKMED_DATETEXT b
 WHERE b.FL_DATETEXT_UID *= a.CollectedDate
 GROUP BY b.FL_DATETEXT_UID) a, FOLKMED_DATETEXT b
WHERE b.FL_DATETEXT_UID *= a.FL_DATETEXT_UID
ORDER BY b.DATETEXT
</CFQUERY>

<CFQUERY NAME="GetAge"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT a.FL_AGE_UID, a.NumRecords, b.AGE
FROM 
(SELECT COUNT(FL_RECORD_UID) AS 'NumRecords', b.FL_AGE_UID
 FROM FOLKMED_RECORD a, FOLKMED_AGE b
 WHERE b.FL_AGE_UID *= a.InformantAge
 GROUP BY b.FL_AGE_UID) a, FOLKMED_AGE b
WHERE b.FL_AGE_UID *= a.FL_AGE_UID
ORDER BY b.AGE
</CFQUERY>

<TABLE ALIGN='CENTER'>
  <TR>
    <TD>
<TABLE BORDER=1>
  <TR>
    <TD COLSPAN='2'  ALIGN='CENTER'>
      <H2>Regions</H2>
    </TD>
  </TR>
  <CFOUTPUT QUERY="GetRegions">
  <FORM NAME='DelRegion#FL_REGION_UID#' ACTION='FMPredefs.cfm' METHOD='POST'>
  <INPUT TYPE='HIDDEN' NAME='ACTION' VALUE='ConfirmDelete'>
  <TR>
    <TD>
    <CFIF NumRecords is 0>
      <INPUT TYPE='HIDDEN' NAME='FieldType' VALUE='Region'>
      <INPUT TYPE='HIDDEN' NAME='UID' VALUE='#FL_REGION_UID#'>
      <INPUT TYPE='SUBMIT' VALUE='Delete'>
    </CFIF>&nbsp;
    </TD>
    <TD>
      #Region#
    </TD>
  </TR>
  </FORM>
  </CFOUTPUT>
  <FORM ACTION='FMPredefs.cfm' METHOD='POST'>
  <INPUT TYPE='HIDDEN' NAME='ACTION' VALUE='ConfirmInsert'>
  <TR>
    <TD>
      <INPUT TYPE='SUBMIT' VALUE='Add New'>
      <INPUT TYPE='HIDDEN' NAME='FieldType' VALUE='Region'>
      <INPUT TYPE='HIDDEN' NAME='FieldName' VALUE='Region'>
    </TD>
    <TD>
      <INPUT TYPE='TEXT' NAME='NewField' SIZE=32 MAXLENGTH=63>
    </TD>
  </TR>
  </FORM>
</TABLE>
    </TD>
    <TD>
<TABLE BORDER=1>
  <TR>
    <TD COLSPAN='2' ALIGN='CENTER'>
      <H2>Date</H2>
    </TD>
  </TR>
  <CFOUTPUT QUERY="GetDateText">
  <FORM NAME='DelDateText#FL_DATETEXT_UID#' ACTION='FMPredefs.cfm' METHOD='POST'>
  <INPUT TYPE='HIDDEN' NAME='ACTION' VALUE='ConfirmDelete'>
  <TR>
    <TD>
    <CFIF NumRecords is 0>
      <INPUT TYPE='HIDDEN' NAME='FieldType' VALUE='DateText'>
      <INPUT TYPE='HIDDEN' NAME='UID' VALUE='#FL_DATETEXT_UID#'>
      <INPUT TYPE='SUBMIT' VALUE='Delete'>
    </CFIF>&nbsp;
    </TD>
    <TD>
      #DateText#
    </TD>
  </TR>
  </FORM>
  </CFOUTPUT>
  <FORM ACTION='FMPredefs.cfm' METHOD='POST'>
  <INPUT TYPE='HIDDEN' NAME='ACTION' VALUE='ConfirmInsert'>
  <TR>
    <TD>
      <INPUT TYPE='SUBMIT' VALUE='Add New'>
    </TD>
    <TD>
      <INPUT TYPE='TEXT' NAME='NewField' SIZE=32 MAXLENGTH=63>
      <INPUT TYPE='HIDDEN' NAME='FieldType' VALUE='DateText'>
      <INPUT TYPE='HIDDEN' NAME='FieldName' VALUE='DateText'>
    </TD>
  </TR>
  </FORM>
</TABLE>
    </TD>
  </TR>
  <TR>
    <TD>
<TABLE BORDER=1>
  <TR>
    <TD COLSPAN='2' ALIGN='CENTER'>
      <H2>Age</H2>
    </TD>
  </TR>
  <CFOUTPUT QUERY="GetAge">
  <FORM NAME='DelAge#FL_AGE_UID#' ACTION='FMPredefs.cfm' METHOD='POST'>
  <INPUT TYPE='HIDDEN' NAME='ACTION' VALUE='ConfirmDelete'>
  <TR>
    <TD>
    <CFIF NumRecords is 0>
      <INPUT TYPE='HIDDEN' NAME='FieldType' VALUE='Age'>
      <INPUT TYPE='HIDDEN' NAME='UID' VALUE='#FL_AGE_UID#'>
      <INPUT TYPE='SUBMIT' VALUE='Delete'>
    </CFIF>&nbsp;
    </TD>
    <TD>
      #Age#
    </TD>
  </TR>
  </FORM>
  </CFOUTPUT>
  <FORM ACTION='FMPredefs.cfm' METHOD='POST'>
  <INPUT TYPE='HIDDEN' NAME='ACTION' VALUE='ConfirmInsert'>
  <TR>
    <TD>
      <INPUT TYPE='SUBMIT' VALUE='Add New'>
    </TD>
    <TD>
      <INPUT TYPE='TEXT' NAME='NewField' SIZE=32 MAXLENGTH=63>
      <INPUT TYPE='HIDDEN' NAME='FieldType' VALUE='Age'>
      <INPUT TYPE='HIDDEN' NAME='FieldName' VALUE='Age'>
    </TD>
  </TR>
  </FORM>
</TABLE>
    </TD>
  </TR>
</TABLE>
</CFCASE>
<CFCASE VALUE="ConfirmInsert">
<CFOUTPUT>
<CENTER>
<BR><FONT SIZE=+2>Confirm</FONT>
<TABLE ALIGN='CENTER' BORDER='1'>
  <TR>
    <TD>Would you like to add:</TD>
  </TR>
  <TR>
    <TD ALIGN='CENTER'><FONT SIZE=+1>#NewField#</FONT></TD>
  </TR>
  <TR>
    <TD>
      As a a choice for a #FieldType#?
      <BR>NOTE: Once records have this new #FieldType# assigned to them,
      <BR>you will not be able to change this #FieldType# name.
    </TD>
  </TR>
</TABLE>
<FORM NAME="AddElement" ACTION="FMPredefs.cfm">
  <INPUT TYPE='HIDDEN' NAME='ACTION' VALUE='Insert'>
  <INPUT TYPE='HIDDEN' NAME='FieldName' VALUE='#FieldName#'>
  <INPUT TYPE='HIDDEN' NAME='FieldType' VALUE='#FieldType#'>
  <INPUT TYPE='HIDDEN' NAME='NewField' VALUE='#NewField#'>
  <INPUT TYPE='SUBMIT' VALUE='Add New #FieldType# Type'>
</FORM>
</CENTER>
</CFOUTPUT>
</CFCASE>
<CFCASE VALUE="Insert">
<CFOUTPUT>
<CENTER>
<BR><FONT SIZE=+2>Insert</FONT>
<CFQUERY NAME="INSERTTYPE"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
INSERT INTO FOLKMED_#UCASE(FieldType)#
(#FieldName#)
VALUES
('#NewField#')
</CFQUERY>
<TABLE ALIGN='CENTER' BORDER='1'>
  <TR>
    <TD ALIGN='CENTER'><FONT SIZE=+1>#NewField#</FONT></TD>
  </TR>
  <TR>
    <TD>
      Has Been Sucessfully Added!
      <BR>NOTE: Once records have this new #FieldType# assigned to them,
      <BR>you will not be able to change this #FieldType# name.
    </TD>
  </TR>
</TABLE>
      <BR><H2><A HREF="FMPredefs.cfm">Continue...</A></H2>
</CENTER>
</CFOUTPUT>
</CFCASE>
<CFCASE VALUE="ConfirmDelete">

<CFQUERY NAME="GetField"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT *
FROM FOLKMED_#FieldType#
WHERE FL_#FieldType#_UID = #UID#
</CFQUERY>

<CFSWITCH EXPRESSION="#FieldType#">
<CFCASE VALUE="Cure">
  <CFSET NewField = #GetField.CureAbbrev#>
</CFCASE>
<CFDEFAULTCASE>
  <CFSET NewField = #GetField[FieldType]#>
</CFDEFAULTCASE>
</CFSWITCH>

<CFOUTPUT>
<CENTER>
<BR><FONT SIZE=+2>Confirm</FONT>
<TABLE ALIGN='CENTER' BORDER='1'>
  <TR>
    <TD>Would you like to Remove:</TD>
  </TR>
  <TR>
    <TD ALIGN='CENTER'><FONT SIZE=+1>#NewField#</FONT></TD>
  </TR>
  <TR>
    <TD>
      As a a choice for a #FieldType#?
    </TD>
  </TR>
</TABLE>
<FORM NAME="DelElement" ACTION="FMPredefs.cfm">
  <INPUT TYPE='HIDDEN' NAME='ACTION' VALUE='Delete'>
  <INPUT TYPE='HIDDEN' NAME='NewField' VALUE='#NewField#'>
  <INPUT TYPE='HIDDEN' NAME='FieldType' VALUE='#FieldType#'>
  <INPUT TYPE='HIDDEN' NAME='UID' VALUE='#UID#'>
  <INPUT TYPE='SUBMIT' VALUE='Remove #FieldType# Type'>
</FORM>
</CENTER>
</CFOUTPUT>
</CFCASE>
<CFCASE VALUE="Delete">
<CFOUTPUT>
<CENTER>
<BR><FONT SIZE=+2>Remove</FONT>

<CFQUERY NAME="DELETETYPE"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
DELETE
FROM FOLKMED_#UCase(FieldType)#
WHERE FL_#FieldType#_UID = #UID#
</CFQUERY>

<TABLE ALIGN='CENTER' BORDER='1'>
  <TR>
    <TD ALIGN='CENTER'><FONT SIZE=+1>#NewField#</FONT></TD>
  </TR>
  <TR>
    <TD>
      Has Been Sucessfully Removed!
    </TD>
  </TR>
</TABLE>
<BR><H2><A HREF="FMPredefs.cfm">Continue...</A></H2>
</CENTER>
</CFOUTPUT>
</CFCASE>
</CFSWITCH>
<P ALIGN='RIGHT'><A HREF="http:\\www.hcf.ucla.edu"><IMG BORDER=0 SRC="images/madebyHCF.jpg"></A></P>
</BODY>
</HTML>