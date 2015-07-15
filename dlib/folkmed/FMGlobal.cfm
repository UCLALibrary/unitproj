<!--- Server Specific Variables --->

  <!--- Database Specific Variables --->
  <CFSET FM_DATABASE_NAME = "FolkMed">
  <CFSET FM_TABLE_NAME = "FOLKLORE_RECORD">

  <CFSET FM_TABLE_NAME_RECORD = "FOLKMED_RECORD">
  <CFSET FM_TABLE_NAME_CURE = "FOLKMED_CURE">
  <CFSET FM_TABLE_NAME_REGION = "FOLKMED_REGION">
  <CFSET FM_TABLE_NAME_DATE = "FOLKMED_DATE">
  <CFSET FM_TABLE_NAME_AGE = "FOLKMED_AGE">

<!--------------------------
---   Global "Defines"  ----
--------------------------->

  <!--- List Constants --->
  <CFSET FM_FIELDS_INT = "CureAbbrevKey,CardNumber,InformantGender,InformantAge,CollectedRegion,CollectedDate,OriginRegion,CitationNumber,VolumeNumber,HyattInformant">
  <CFSET FM_FIELDS_TEXT = "SUBJECT,CardText,Cure,CollectedPlace,InformantEthnicity,OriginPlace,OriginEthnicity,Citation,VolumeNumber,PageReference">
  <CFSET FM_FIELDS_SEARCHABLE = "SUBJECT+CURE+CITATION+CARDTEXT+INFORMANTETHNICITY+COLLECTEDPLACE+ORIGINETHNICITY+ORIGINPLACE+PAGEREFERENCE+CONVERT(char(24),VOLUMENUMBER)">

  <!--- Color Codes --->
  <CFSET FM_COLOR_HIGHLIGHT = "'##08b000'">
  <CFSET FM_COLOR_BACKGROUND = "'##FFFFFF'">