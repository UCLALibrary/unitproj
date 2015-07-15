<!--- Include SyllabiCentral Global Variables --->
<CFINCLUDE TEMPLATE="FMGlobal.cfm">
<CFSET FILE_NAME="FMEntry.cfm">
<CFSET FILE_TITLE="FolkMed Record">

<CFIF NOT IsDefined("ACTION")>
  <CFSET ACTION="Enter">
</CFIF>

<HTML>
<HEAD>
<TITLE>FolkMed - <CFOUTPUT>#ACTION# #FILE_TITLE#</CFOUTPUT></TITLE>

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
<CENTER><BR><BR><H2>#ACTION# Record</H2></CENTER>

<CFSWITCH EXPRESSION="#ACTION#">
<CFCASE VALUE="Enter">

<CFQUERY NAME="FINDREGION"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT FL_REGION_UID, Region
FROM FOLKMED_REGION
ORDER BY Region
</CFQUERY>

<CFQUERY NAME="FINDDATETEXT"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT FL_DATETEXT_UID, DateText
FROM FOLKMED_DATETEXT
ORDER BY DateText
</CFQUERY>

<CFQUERY NAME="FINDAGE"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT FL_AGE_UID, Age
FROM FOLKMED_AGE
ORDER BY Age
</CFQUERY>
<CFFORM NAME="RecordEntry" ACTION="FMEntry.cfm">
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
      Subject
    </TD>
    <TD>
      <CFINPUT TYPE="TEXT" NAME="SUBJECT" REQUIRED="YES" SIZE="16" MAXLENGTH="255">
    </TD>
    <TD>
      Card Text
    </TD>
    <TD COLSPAN='3'>
      <TEXTAREA NAME="CardText"></TEXTAREA>
    </TD>
  </TR>
  <TR>
    <TD>
      Cure
    </TD>
    <TD VALIGN='TOP'>
      <TEXTAREA onChange="CheckLength(this, 255)" NAME="Cure"></TEXTAREA>
    </TD>
  </TR>
  <TR>
    <TD>
      Cause
    </TD>
    <TD COLSPAN='4'>
      <TEXTAREA onChange="CheckLength(this, 255)" NAME="Cause"></TEXTAREA>
    </TD>
  </TR>
  <TR>
    <TD ROWSPAN='2'>
      Sign
    </TD>
    <TD ROWSPAN='2'>
      <TEXTAREA onChange="CheckLength(this, 255)" NAME="Sign"></TEXTAREA>
    </TD>
    <TD>
      Place Collected
    </TD>
    <TD>
      <CFINPUT TYPE="TEXT" NAME="CollectedPlace" REQUIRED="YES" SIZE="16" MAXLENGTH="64">
    </TD>
  </TR>
  <TR>
    <TD>
      Region Of Collection
    </TD>
    <TD>
      <CFSELECT NAME="CollectedRegion" REQUIRED="YES" MULTIPLE="NO" QUERY="FINDREGION" VALUE="FL_REGION_UID" DISPLAY="REGION">
      </CFSELECT>
    </TD>
  </TR>
  <TR>
    <TD>
      Collector
    </TD>
    <TD>
      <CFINPUT TYPE="TEXT" NAME="Collector" REQUIRED="YES" SIZE="16" MAXLENGTH="64">
    </TD>
    <TD>
      Date Collected
    </TD>
    <TD>
      <CFSELECT NAME="CollectedDate" REQUIRED="YES" MULTIPLE="NO" QUERY="FINDDATETEXT" VALUE="FL_DATETEXT_UID" DISPLAY="DATETEXT">
      </CFSELECT>
    </TD>
  </TR>
  <TR>
    <TD>
      Informant Ethnicity
    </TD>
    <TD>
      <CFINPUT TYPE="TEXT" NAME="InformantEthnicity" REQUIRED="NO" SIZE="16" MAXLENGTH="64">
    </TD>
    <TD>
      Place Of Origin
    </TD>
    <TD>
      <CFINPUT TYPE="TEXT" NAME="OriginPlace" REQUIRED="NO" SIZE="16" MAXLENGTH="64">
    </TD>
  </TR>
  <TR>
    <TD>
      Informant Gender
    </TD>
    <TD>
      <SELECT NAME='InformantGender'>
        <OPTION VALUE="1">Female
        <OPTION VALUE="2">Male
        <OPTION VALUE="3">Not Disclosed/Unknown
      </SELECT>
    </TD>
    <TD>
      Region Of Origin
    </TD>
    <TD>
      <CFSELECT NAME="OriginRegion" REQUIRED="YES" MULTIPLE="NO" QUERY="FINDREGION" VALUE="FL_REGION_UID" DISPLAY="REGION">
      </CFSELECT>
    </TD>
  </TR>
  <TR>
    <TD>
      Informant Age
    </TD>
    <TD>
      <CFSELECT NAME="InformantAge" REQUIRED="YES" MULTIPLE="NO" QUERY="FINDAGE" VALUE="FL_AGE_UID" DISPLAY="AGE">
      </CFSELECT>
    </TD>
    <TD>
      Ethnicity Of Origin
    </TD>
    <TD>
      <CFINPUT TYPE="TEXT" NAME="OriginEthnicity" REQUIRED="NO" SIZE="16" MAXLENGTH="64">
    </TD>
  </TR>
  <TR>
    <TD ROWSPAN='2'>
      Citation
    </TD>
    <TD ROWSPAN='2' COLSPAN='3'>
      <TEXTAREA onChange="CheckLength(this, 255)" NAME="Citation"></TEXTAREA>
    </TD>
    <TD>
      Volume Number
    </TD>
    <TD>
      <CFINPUT TYPE="TEXT" NAME="VolumeNumber" VALIDATE="integer" REQUIRED="NO" SIZE="8" MAXLENGTH="64">
    </TD>
  </TR>
  <TR>
    <TD>
      Page Number
    </TD>
    <TD>
      <CFINPUT TYPE="TEXT" NAME="PageReference" REQUIRED="NO" SIZE="16" MAXLENGTH="16">
    </TD>
  </TR>
</TABLE>
<INPUT TYPE='HIDDEN' NAME='ACTION' VALUE='Confirm'>
<INPUT TYPE='SUBMIT' VALUE='Enter Record'>
</CFFORM>
</CFCASE>

<CFCASE VALUE="Confirm">

<CFQUERY NAME="GetColRegion"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT Region
FROM FOLKMED_REGION
WHERE FL_REGION_UID = #CollectedRegion#
ORDER BY Region
</CFQUERY>

<CFQUERY NAME="GetOriRegion"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT Region
FROM FOLKMED_REGION
WHERE FL_REGION_UID = #OriginRegion#
ORDER BY Region
</CFQUERY>

<CFQUERY NAME="GetColDate"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT DateText
FROM FOLKMED_DATETEXT
WHERE FL_DATETEXT_UID = #CollectedDate#
ORDER BY DateText
</CFQUERY>

<CFQUERY NAME="GetInfAge"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT Age
FROM FOLKMED_AGE
WHERE FL_AGE_UID = #InformantAge#
ORDER BY Age
</CFQUERY>

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
      Subject
    </TD>
    <TD>
      #SUBJECT#
    </TD>
    <TD>
      Card Text
    </TD>
    <TD COLSPAN='3'>
      #CardText#
    </TD>
  </TR>
  <TR>
    <TD>
      Cure
    </TD>
    <TD VALIGN='TOP'>
      #CURE#
    </TD>
  </TR>
  <TR>
    <TD>
      Cause
    </TD>
    <TD COLSPAN='4'>
      #Cause#
    </TD>
  </TR>
  <TR>
    <TD ROWSPAN='2'>
      Sign
    </TD>
    <TD ROWSPAN='2'>
      #Sign#
    </TD>
    <TD>
      Place Collected
    </TD>
    <TD>
      #CollectedPlace#
    </TD>
  </TR>
  <TR>
    <TD>
      Region Of Collection
    </TD>
    <TD>
      #GetColRegion.Region#
    </TD>
  </TR>
  <TR>
    <TD>
      Collector
    </TD>
    <TD>
      #Collector#
    </TD>
    <TD>
      Date Collected
    </TD>
    <TD>
      #GetColDate.DateText#
    </TD>
  </TR>
  <TR>
    <TD>
      Informant Ethnicity
    </TD>
    <TD>
      #InformantEthnicity#
    </TD>
    <TD>
      Place Of Origin
    </TD>
    <TD>
      #OriginPlace#
    </TD>
  </TR>
  <TR>
    <TD>
      Informant Gender
    </TD>
    <TD>
<CFSWITCH EXPRESSION="#InformantGender#"><CFCASE VALUE="1">Female</CFCASE><CFCASE VALUE="2">Male</CFCASE><CFCASE VALUE="3">Not Disclosed/Unknown</CFCASE></CFSWITCH>
    </TD>
    <TD>
      Region Of Origin
    </TD>
    <TD>
      #GetOriRegion.Region#
    </TD>
  </TR>
  <TR>
    <TD>
      Informant Age
    </TD>
    <TD>
      #GetInfAge.Age#
    </TD>
    <TD>
      Ethnicity Of Origin
    </TD>
    <TD>
      #OriginEthnicity#
    </TD>
  </TR>
  <TR>
    <TD ROWSPAN='2'>
      Citation
    </TD>
    <TD ROWSPAN='2' COLSPAN='3'>
      #Citation#
    </TD>
    <TD>
      Volume Number
    </TD>
    <TD>
      #VolumeNumber#
    </TD>
  </TR>
  <TR>
    <TD>
      Page Number
    </TD>
    <TD>
      #PageReference#
    </TD>
  </TR>
</TABLE>
<FORM ACTION='FMEntry.cfm' METHOD='POST'>
<INPUT TYPE='HIDDEN' NAME='ACTION' VALUE="Insert">
<INPUT TYPE='HIDDEN' NAME='Subject' VALUE="#HTMLEditFormat(SUBJECT)#">
<INPUT TYPE='HIDDEN' NAME='CardText' VALUE="#HTMLEditFormat(CardText)#">
<INPUT TYPE='HIDDEN' NAME='Cause' VALUE="#HTMLEditFormat(Cause)#">
<INPUT TYPE='HIDDEN' NAME='Cure' VALUE="#HTMLEditFormat(Cure)#">
<INPUT TYPE='HIDDEN' NAME='Sign' VALUE="#HTMLEditFormat(Sign)#">
<INPUT TYPE='HIDDEN' NAME='CollectedPlace' VALUE="#HTMLEditFormat(CollectedPlace)#">
<INPUT TYPE='HIDDEN' NAME='CollectedRegion' VALUE="#CollectedRegion#">
<INPUT TYPE='HIDDEN' NAME='Collector' VALUE="#HTMLEditFormat(Collector)#">
<INPUT TYPE='HIDDEN' NAME='CollectedDate' VALUE="#CollectedDate#">
<INPUT TYPE='HIDDEN' NAME='InformantEthnicity' VALUE="#HTMLEditFormat(InformantEthnicity)#">
<INPUT TYPE='HIDDEN' NAME='OriginPlace' VALUE="#HTMLEditFormat(OriginPlace)#">
<INPUT TYPE='HIDDEN' NAME='InformantGender' VALUE="#InformantGender#">
<INPUT TYPE='HIDDEN' NAME='OriginRegion' VALUE="#OriginRegion#">
<INPUT TYPE='HIDDEN' NAME='InformantAge' VALUE="#InformantAge#">
<INPUT TYPE='HIDDEN' NAME='OriginEthnicity' VALUE="#HTMLEditFormat(OriginEthnicity)#">
<INPUT TYPE='HIDDEN' NAME='Citation' VALUE="#HTMLEditFormat(Citation)#">
<INPUT TYPE='HIDDEN' NAME='VolumeNumber' VALUE="#VolumeNumber#">
<INPUT TYPE='HIDDEN' NAME='PageReference' VALUE="#HTMLEditFormat(PageReference)#">
<INPUT TYPE='SUBMIT' VALUE='Confirm Record'>
<INPUT TYPE='BUTTON' VALUE='Cancel' OnClick="window.history.back();">
</FORM>
</CFCASE>
<CFCASE VALUE="Insert">
<CFSET SQLString = "INSERT INTO FOLKMED_RECORD ">
<CFSET SQLNames = "">
<CFSET SQLValues = "">
<CFSET keysToForm = StructKeyArray(Form)>
<CFSET Iteration = 1>
<CFLOOP index="i" from="1" to="#ArrayLen(keysToForm)#">
  <CFIF (keysToForm[i] is NOT "ACTION") AND (keysToForm[i] is NOT "FIELDNAMES")>
    <CFIF Iteration is NOT 1>
      <CFSET SQLNames = SQLNames & ", ">
      <CFSET SQLValues = SQLValues & ", ">
    </CFIF>
    <CFIF ListFindNoCase(FM_FIELDS_INT, keysToForm[i], ",")>
      <CFIf Len(Trim(Form[keysToForm[i]])) GT 0>
        <CFSET SQLValues = SQLValues & "#Replace(Form[keysToForm[i]], "'", "''")#" >
      <CFELSE>
        <CFSET SQLValues = SQLValues & " NULL" >
      </CFIF>
    <CFELSE>
      <CFSET SQLValues = SQLValues & "'#Replace(Form[keysToForm[i]], "'", "''")#'">
    </CFIF>
    <CFSET SQLNames = SQLNames & "#keysToForm[i]#">
    <CFSET Iteration = Iteration + 1>
  </CFIF>
</CFLOOP>
<CFSET SQLString = SQLString & "( " & SQLNames & ", SYSFLAGS ) VALUES ( " & SQLValues & ", 0 ) ">
<CFQUERY NAME="InsertRecord"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
#PreserveSingleQuotes(SQLString)#
</CFQUERY>
Record Inserted Successfully!
</CFCASE>
</CFSWITCH>
<P ALIGN='RIGHT'><A HREF="http:\\www.hcf.ucla.edu"><IMG BORDER=0 SRC="images/madebyHCF.jpg"></A></P>
</BODY>
</CFOUTPUT>
</HTML>