<!--- Include SyllabiCentral Global Variables --->
<CFINCLUDE TEMPLATE="FMGlobal.cfm">
<CFSET FILE_NAME="FMUpdate.cfm">
<CFSET FILE_TITLE="FolkMed Record">

<CFIF NOT IsDefined("ACTION")>
  <CFSET ACTION="Lookup">
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
<CFCASE VALUE="Lookup">
<FORM NAME="Lookup" ACTION="FMUpdate.cfm" METHOD="POST">
<CENTER>
<INPUT TYPE=HIDDEN NAME="Action" VALUE="Retrieve">
<TABLE BORDER='0'>
  <TR>
    <TD>
      Record Number:
    </TD>
    <TD>
      <INPUT TYPE="TEXT" NAME="TABLENUM" SIZE="3"> _ <INPUT TYPE="TEXT" NAME="ROWNUM" SIZE="8">
  </TR>
</TABLE>
<INPUT TYPE="SUBMIT" VALUE="Find Record">
</CENTER>
</FORM>
</CFCASE>

<CFCASE VALUE="Retrieve">

<CFQUERY NAME="GETRECORD"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT FL_RECORD_UID, SUBJECT, CURE, CAUSE, SIGN, CITATION, CARDTEXT, INFORMANTETHNICITY, INFORMANTGENDER, INFORMANTAGE, COLLECTOR, COLLECTEDPLACE, COLLECTEDREGION, COLLECTEDDATE, ORIGINETHNICITY, ORIGINPLACE, ORIGINREGION, VOLUMENUMBER, PAGEREFERENCE
FROM FOLKMED_RECORD#TABLENUM#
WHERE FL_RECORD_UID = #ROWNUM#
</CFQUERY>

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
<CFIF GETRECORD.RecordCount is 0>
<CENTER><H2>Record Does not exist in this table</H2></CENTER>
<TABLE ALIGN=CENTER>
  <TR>
    <TD>
      Table Number:
    </TD>
    <TD>
      #TABLENUM#
    </TD>
  </TR>
  <TR>
    <TD>
      Row Number:
    </TD>
    <TD>
      #ROWNUM#
    </TD>
  </TR>
</TABLE>
<CFELSE>
<CFFORM NAME="RecordUpdate" ACTION="FMUpdate.cfm">
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
      <CFINPUT TYPE="TEXT" NAME="SUBJECT" SIZE="16" MAXLENGTH="255" VALUE="#GETRECORD.SUBJECT#">
    </TD>
    <TD>
      Card Text
    </TD>
    <TD COLSPAN='3'>
      <TEXTAREA ROWS="5" COLS="40" NAME="CardText">#GETRECORD.CardText#</TEXTAREA>
    </TD>
  </TR>
  <TR>
    <TD>
      Cure
    </TD>
    <TD VALIGN='TOP'>
      <TEXTAREA onChange="CheckLength(this, 255)" NAME="Cure">#GETRECORD.CURE#</TEXTAREA>
    </TD>
  </TR>
  <TR>
    <TD>
      Cause
    </TD>
    <TD COLSPAN='4'>
      <TEXTAREA onChange="CheckLength(this, 255)" NAME="Cause">#GETRECORD.CAUSE#</TEXTAREA>
    </TD>
  </TR>
  <TR>
    <TD ROWSPAN='2'>
      Sign
    </TD>
    <TD ROWSPAN='2'>
      <TEXTAREA onChange="CheckLength(this, 255)" NAME="Sign">#GETRECORD.SIGN#</TEXTAREA>
    </TD>
    <TD>
      Place Collected
    </TD>
    <TD>
      <CFINPUT TYPE="TEXT" NAME="CollectedPlace" SIZE="16" MAXLENGTH="64" VALUE="#GETRECORD.COLLECTEDPLACE#">
    </TD>
  </TR>
  <TR>
    <TD>
      Region Of Collection
    </TD>
    <TD>
      <SELECT NAME="CollectedRegion">
      <OPTION VALUE="NULL" <CFIF GETRECORD.COLLECTEDREGION is "">SELECTED</CFIF>></OPTION>
<CFLOOP QUERY="FINDREGION">
      <OPTION VALUE="#FL_REGION_UID#" <CFIF FL_REGION_UID is GETRECORD.COLLECTEDREGION>SELECTED</CFIF>>#REGION#</OPTION>
</CFLOOP>
      </SELECT>
    </TD>
  </TR>
  <TR>
    <TD>
      Collector
    </TD>
    <TD>
      <CFINPUT TYPE="TEXT" NAME="Collector" SIZE="16" MAXLENGTH="64" VALUE="#GETRECORD.COLLECTOR#">
    </TD>
    <TD>
      Date Collected
    </TD>
    <TD>
      <SELECT NAME="CollectedDate">
      <OPTION VALUE="NULL" <CFIF GETRECORD.COLLECTEDDATE is "">SELECTED</CFIF>></OPTION>
<CFLOOP QUERY="FINDDATETEXT">
      <OPTION VALUE="#FL_DATETEXT_UID#" <CFIF FL_DATETEXT_UID is GETRECORD.COLLECTEDDATE>SELECTED</CFIF>>#DATETEXT#</OPTION>
</CFLOOP>
      </SELECT>
    </TD>
  </TR>
  <TR>
    <TD>
      Informant Ethnicity
    </TD>
    <TD>
      <CFINPUT TYPE="TEXT" NAME="InformantEthnicity" REQUIRED="NO" SIZE="16" MAXLENGTH="64" VALUE="#GETRECORD.INFORMANTETHNICITY#">
    </TD>
    <TD>
      Place Of Origin
    </TD>
    <TD>
      <CFINPUT TYPE="TEXT" NAME="OriginPlace" REQUIRED="NO" SIZE="16" MAXLENGTH="64" VALUE="#GETRECORD.ORIGINPLACE#">
    </TD>
  </TR>
  <TR>
    <TD>
      Informant Gender
    </TD>
    <TD>
      <SELECT NAME='InformantGender'>
        <OPTION VALUE="1" #IIF(GETRECORD.INFORMANTGENDER is 1, DE('SELECTED'), DE(''))#>Female
        <OPTION VALUE="2" #IIF(GETRECORD.INFORMANTGENDER is 2, DE('SELECTED'), DE(''))#>Male
        <OPTION VALUE="3" #IIF(GETRECORD.INFORMANTGENDER is 3, DE('SELECTED'), DE(''))#>Not Disclosed/Unknown
      </SELECT>
    </TD>
    <TD>
      Region Of Origin
    </TD>
    <TD>
      <SELECT NAME="OriginRegion">
      <OPTION VALUE="NULL" <CFIF GETRECORD.ORIGINREGION is "">SELECTED</CFIF>></OPTION>
<CFLOOP QUERY="FINDREGION">
      <OPTION VALUE="#FL_REGION_UID#" <CFIF FL_REGION_UID is GETRECORD.ORIGINREGION>SELECTED</CFIF>>#REGION#</OPTION>
</CFLOOP>
      </SELECT>
    </TD>
  </TR>
  <TR>
    <TD>
      Informant Age
    </TD>
    <TD>
      <CFSELECT NAME="InformantAge" MULTIPLE="NO" QUERY="FINDAGE" VALUE="FL_AGE_UID" DISPLAY="AGE" SELECTED="#GETRECORD.INFORMANTAGE#">
      </CFSELECT>
    </TD>
    <TD>
      Ethnicity Of Origin
    </TD>
    <TD>
      <CFINPUT TYPE="TEXT" NAME="OriginEthnicity" REQUIRED="NO" SIZE="16" MAXLENGTH="64" VALUE="#GETRECORD.ORIGINETHNICITY#">
    </TD>
  </TR>
  <TR>
    <TD ROWSPAN='2'>
      Citation
    </TD>
    <TD ROWSPAN='2' COLSPAN='3'>
      <TEXTAREA onChange="CheckLength(this, 255)" NAME="Citation">#GETRECORD.CITATION#</TEXTAREA>
    </TD>
    <TD>
      Volume Number
    </TD>
    <TD>
      <CFINPUT TYPE="TEXT" NAME="VolumeNumber" VALIDATE="integer" REQUIRED="NO" SIZE="8" MAXLENGTH="64" VALUE="#GETRECORD.VOLUMENUMBER#">
    </TD>
  </TR>
  <TR>
    <TD>
      Page or Item Number
    </TD>
    <TD>
      <CFINPUT TYPE="TEXT" NAME="PageReference" REQUIRED="NO" SIZE="16" MAXLENGTH="16" VALUE="#GETRECORD.PAGEREFERENCE#">
    </TD>
  </TR>
</TABLE>
<INPUT TYPE='HIDDEN' NAME='ACTION' VALUE='Confirm'>
<INPUT TYPE='HIDDEN' NAME='TABLENUM' VALUE="#TABLENUM#">
<INPUT TYPE='HIDDEN' NAME='ROWNUM' VALUE="#ROWNUM#">
<INPUT TYPE='SUBMIT' VALUE='Update Record'>
</CFFORM>
</CFIF>
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
      Page or Item Number
    </TD>
    <TD>
      #PageReference#
    </TD>
  </TR>
</TABLE>
<FORM ACTION='FMUpdate.cfm' METHOD='POST'>
<INPUT TYPE='HIDDEN' NAME='ACTION' VALUE="Update">
<INPUT TYPE='HIDDEN' NAME='TABLENUM' VALUE="#TABLENUM#">
<INPUT TYPE='HIDDEN' NAME='ROWNUM' VALUE="#ROWNUM#">
<INPUT TYPE='HIDDEN' NAME='Subject' VALUE="#HTMLEditFormat(TRIM(SUBJECT))#">
<INPUT TYPE='HIDDEN' NAME='CardText' VALUE="#HTMLEditFormat(TRIM(CardText))#">
<INPUT TYPE='HIDDEN' NAME='Cause' VALUE="#HTMLEditFormat(TRIM(Cause))#">
<INPUT TYPE='HIDDEN' NAME='Cure' VALUE="#HTMLEditFormat(TRIM(Cure))#">
<INPUT TYPE='HIDDEN' NAME='Sign' VALUE="#HTMLEditFormat(TRIM(Sign))#">
<INPUT TYPE='HIDDEN' NAME='CollectedPlace' VALUE="#HTMLEditFormat(TRIM(CollectedPlace))#">
<INPUT TYPE='HIDDEN' NAME='CollectedRegion' VALUE="#TRIM(CollectedRegion)#">
<INPUT TYPE='HIDDEN' NAME='Collector' VALUE="#HTMLEditFormat(TRIM(Collector))#">
<INPUT TYPE='HIDDEN' NAME='CollectedDate' VALUE="#TRIM(CollectedDate)#">
<INPUT TYPE='HIDDEN' NAME='InformantEthnicity' VALUE="#HTMLEditFormat(TRIM(InformantEthnicity))#">
<INPUT TYPE='HIDDEN' NAME='OriginPlace' VALUE="#HTMLEditFormat(TRIM(OriginPlace))#">
<INPUT TYPE='HIDDEN' NAME='InformantGender' VALUE="#TRIM(InformantGender)#">
<INPUT TYPE='HIDDEN' NAME='OriginRegion' VALUE="#TRIM(OriginRegion)#">
<INPUT TYPE='HIDDEN' NAME='InformantAge' VALUE="#TRIM(InformantAge)#">
<INPUT TYPE='HIDDEN' NAME='OriginEthnicity' VALUE="#HTMLEditFormat(TRIM(OriginEthnicity))#">
<INPUT TYPE='HIDDEN' NAME='Citation' VALUE="#HTMLEditFormat(TRIM(Citation))#">
<INPUT TYPE='HIDDEN' NAME='VolumeNumber' VALUE="#TRIM(VolumeNumber)#">
<INPUT TYPE='HIDDEN' NAME='PageReference' VALUE="#HTMLEditFormat(TRIM(PageReference))#">
<INPUT TYPE='SUBMIT' VALUE='Confirm Record'>
<INPUT TYPE='BUTTON' VALUE='Cancel' OnClick="window.history.back();">
</FORM>
</CFCASE>

<CFCASE VALUE="Update">
<CFSET SQLString = "UPDATE FOLKMED_RECORD#TABLENUM# SET ">
<CFSET keysToForm = StructKeyArray(Form)>
<CFSET Iteration = 0>
<CFLOOP index="i" from="1" to="#ArrayLen(keysToForm)#">
  <CFIF (keysToForm[i] is NOT "ACTION") AND (keysToForm[i] is NOT "FIELDNAMES") AND (keysToForm[i] is NOT "ROWNUM") AND (keysToForm[i] is NOT "TABLENUM")>
    <CFIF (LEN(TRIM(Replace(Form[keysToForm[i]], "'", "''"))) GT 0) OR NOT(ListFindNoCase(FM_FIELDS_INT, keysToForm[i], ",")) >
      <CFIF Iteration is NOT 0>
        <CFSET SQLString = SQLString & ", ">
      </CFIF>
      <CFIF ListFindNoCase(FM_FIELDS_INT, keysToForm[i], ",")>
        <CFSET SQLQuote = "">
      <CFELSE>
        <CFSET SQLQuote = "'">
      </CFIF>
      <CFSET SQLString = SQLString & "#keysToForm[i]# = ">
      <CFSET SQLString = SQLString & SQLQuote & Replace(Form[keysToForm[i]], "'", "''","all") & SQLQuote>
    </CFIF>
    <CFSET Iteration = 1>
  </CFIF>
</CFLOOP>
<CFSET SQLString = SQLString & ", SYSFLAGS = 0 WHERE FL_RECORD_UID = #ROWNUM#">
<CFQUERY NAME="UpdateRecord"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
#PreserveSingleQuotes(SQLString)#
</CFQUERY>
Record Updated Successfully!
</CFCASE>
</CFSWITCH>
<P ALIGN='RIGHT'><A HREF="http:\\www.hcf.ucla.edu"><IMG BORDER=0 SRC="images/madebyHCF.jpg"></A></P>
</BODY>
</CFOUTPUT>
</HTML>