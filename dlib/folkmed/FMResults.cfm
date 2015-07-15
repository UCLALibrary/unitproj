<CFSET URL.requestTimeout = "180">

<!--- Include SyllabiCentral Global Variables --->
<CFSET FILE_NAME="FMSearch.cfm">
<CFSET FILE_TITLE="Search Page">

<!--- Include Necessary Header Files --->
<CFINCLUDE TEMPLATE="FMGlobal.cfm">

<!--- Set Initial Variables --->
<CFSET SQLString = "">
<CFSET URLArgs = "BOOLOP=#BOOLOP#">

<!--- Define Necessary Variables in case of Nulls --->
<CFIF NOT IsDefined("MaxRecords")>
  <CFSET MaxRecords = 5>
</CFIF>
<CFIF MaxRecords is "all">
  <CFSET MaxRecords = 999999999>
</CFIF>
<CFIF Not IsDefined("CurRecord")>
  <CFSET CurRecord = 1>
</CFIF>

<!--- Decode Starting Record --->
<CFIF IsDefined("StartRecord")>
  <CFIF IsDefined("Text")>
    <CFSET Text = URLDecode("#Text#")>
  </CFIF>
  <CFSET StartTable = GetToken(StartRecord, 1, "_")>
  <CFSET StartRow = GetToken(StartRecord, 2, "_")>
<CFELSE>
  <CFSET StartRecord = "1_1">
  <CFSET StartRow = 1>
  <CFSET StartTable = 1>
</CFIF>

<!--- If We are Just Coming From a Search Page --->
  <CFIF IsDefined("Text") AND Len(TRIM(Text)) GT 0>
    <CFSET URLArgs = URLArgs & "#IIF(Len(URLArgs) GT 0, DE("&"), DE(""))#Text=" & URLEncodedFormat("#TRIM(REPLACE(Text," ","+"))#")>
    <CFSET MyIndex = 1>
    <CFSET Text = TRIM(REPLACE(Text,"+"," "))>
    <CFSET SQLArray = ArrayNew(1)>

    <CFLOOP CONDITION='MyIndex GT 0 '>
      <CFLOOP CONDITION='Mid(Text, MyIndex + 1, 1) is " "'>
        <CFSET MyIndex = MyIndex + 1>
      </CFLOOP> <!--- End of Mid Loop --->
      <CFIF Len(Mid(Text, MyIndex, IIF(Find(" ", Text, MyIndex + 1) GT 0, Find(" ", Text, MyIndex + 1), Len(Text)) - MyIndex)) GT 0>
        <CFIF Left(Mid(Text, MyIndex, IIF(Find(" ", Text, MyIndex + 1) GT 0, Find(" ", Text, MyIndex + 1), Len(Text)) - MyIndex), 1) is """">
          <CFSET MyIndex = MyIndex + 1>
          <CFSET Res = ArrayAppend(SQLArray, Mid(Text, MyIndex, IIF(Find("""", Text, MyIndex + 1) GT 0, Find("""", Text, MyIndex + 1), Len(Text) + 1) - MyIndex) ) >
          <CFSET MyIndex = Find("""", "#Text#", MyIndex+1) +2>
          <CFIF MyIndex GT Len(Text)>
            <CFSET MyIndex = 0>
          </CFIF>
        <CFELSE>
          <CFIF NOT(Find(" ", Text, MyIndex + 1) is 0)>
            <CFSET Res = ArrayAppend(SQLArray, Mid(Text, MyIndex, IIF(Find(" ", Text, MyIndex + 1) GT 0, Find(" ", Text, MyIndex + 1), Len(Text)) - MyIndex)) >
            <CFSET MyIndex = Find(" ", "#Text#", MyIndex+1) + 1>
          <CFELSE>
            <CFSET Res = ArrayAppend(SQLArray, Right(Text, Len(Text) - MyIndex +1)) >
            <CFSET MyIndex = Find(" ", "#Text#", MyIndex+1)>
          </CFIF>
        </CFIF>
      </CFIF> <!--- End if Len(Token) GT 0--->
    </CFLOOP> <!--- End of MyIndex GT 0 Loop --->

    <CFSET MyIndex = 1>
    <CFLOOP CONDITION = 'MyIndex LTE ArrayLen(SQLArray)'>
      <CFIF MyIndex GT 1>
        <CFSET SQLString = SQLString & BoolOp>
      </CFIF>
      <!--- Searching Fields: Everything! --->
      <CFSET SQLString = SQLString & " ( ">
      <CFSET Iteration = 0>
      <CFLOOP INDEX= "FM_FIELDS_SEARCHABLE_INDEX"
              LIST = "#FM_FIELDS_SEARCHABLE#"
              DELIMITERS = "+">
        <CFIF Iteration IS NOT 0>
          <CFSET SQLString = SQLString & " OR ">
        </CFIF>
        <CFSET SQLString = SQLString & " ( " & FM_FIELDS_SEARCHABLE_INDEX & " Like '% " & Replace(SQLArray[MyIndex],"'","''","ALL") & "%') "> <!--- Space is prefixed to search string in accordance with suggestion by Folkmed Staff - rmg ---> <!--- Need to escape single quotes manually, as PreserveSingleQuotes is used in SQL Call --->
        <CFSET Iteration = 1>
      </CFLOOP>
      <CFSET SQLString = SQLString & " ) ">
      <CFSET MyIndex = MyIndex + 1>
    </CFLOOP> <!--- End Of MyIndex LTE Len(SQLArray) --->

  <CFELSE> <!--- Else Text is not defined (Read As Advanced Search) --->
    <CFSET keysToForm = StructKeyArray(Form)>
    <CFSET Iteration = 0>
    <CFLOOP index="i" from="1" to="#ArrayLen(keysToForm)#">
      <CFIF (keysToForm[i] is NOT "ACTION") AND (keysToForm[i] is NOT "BOOLOP") AND (keysToForm[i] is NOT "FIND") AND (keysToForm[i] is NOT "MAXRECORDS") AND (keysToForm[i] is NOT "FIELDNAMES") AND (Len(Form[keysToForm[i]]) GT 0)>
        <CFIF ListFindNoCase(FM_FIELDS_INT, keysToForm[i], ",") AND (LEN(TRIM(Form[keysToForm[i]])) GT 0)>
          <CFSET SQLString = SQLString & " #IIF(Iteration is 0, DE(''),DE('#BOOLOP#'))# " & " ( " & keysToForm[i] & " IN ( " & Form[keysToForm[i]] & " ) )">
        <CFELSE>
          <CFSET SQLString = SQLString & " #IIF(Iteration is 0, DE(''), DE('#BOOLOP#'))# " & " ( " & keysToForm[i] & " LIKE '%" & REPLACE(REPLACE(TRIM(Form[keysToForm[i]]),"'","''","ALL")," ","%") & "%' )">
        </CFIF>
        <CFSET URLArgs = URLArgs & "#IIF(Len(URLArgs) GT 0, DE("&"), DE(""))##keysToForm[i]#=#TRIM(REPLACE(REPLACE(Form[keysToForm[i]]," ","+"),",","_"))#">
        <CFSET Iteration = 1>
      </CFIF>
    </CFLOOP>

    <CFIF Len(Trim(SQLString)) LTE 0>
      <CFLOOP Index="myFM_FIELDS_INT"
              LIST="#FM_FIELDS_INT#"
              DELIMITERS=",">
        <CFIF IsDefined(myFM_FIELDS_INT)>
          <CFIF Len(Evaluate(myFM_FIELDS_INT)) GT 0>
            <CFSET SQLString = SQLString & " #IIF(Iteration is 0, DE(''),DE('#BOOLOP#'))# " & " ( " & myFM_FIELDS_INT & " IN ( " & REPLACE(TRIM(EVALUATE(myFM_FIELDS_INT)),"_",",") & " ) )">
            <CFSET URLArgs = URLArgs & IIF(Len(URLArgs) GT 0, DE("&"), DE("")) & myFM_FIELDS_INT & "=" & TRIM(REPLACE(REPLACE(EVALUATE(myFM_FIELDS_INT)," ","+"),",","_"))>
          </CFIF>
        </CFIF>
      </CFLOOP>
      <CFLOOP Index="myFM_FIELDS_TEXT"
              LIST="#FM_FIELDS_TEXT#"
              DELIMITERS=",">
        <CFIF IsDefined(myFM_FIELDS_TEXT)>
          <CFIF Len(Evaluate(myFM_FIELDS_TEXT)) GT 0>
            <CFSET SQLString = SQLString & " #IIF(Iteration is 0, DE(''), DE('#BOOLOP#'))# " & " ( " & myFM_FIELDS_TEXT & " LIKE '%" & REPLACE(REPLACE(TRIM(EVALUATE(myFM_FIELDS_TEXT)),"+"," ")," ","%") & "%' )">
            <CFSET URLArgs = URLArgs & IIF(Len(URLArgs) GT 0, DE("&"), DE("")) & myFM_FIELDS_TEXT & "=" & TRIM(REPLACE(REPLACE(EVALUATE(myFM_FIELDS_TEXT)," ","+"),",","_"))>
          </CFIF>
        </CFIF>
      </CFLOOP>
    </CFIF>

  </CFIF> <!--- End If IsDefined("Text") --->

<HTML>
<HEAD>
<TITLE><CFOUTPUT>#FILE_TITLE#</CFOUTPUT></TITLE>
</HEAD>

<BODY BGCOLOR="#FFFFFF" link="#08b00" alink="#0ee00" vlink="#0cd00">

<CENTER>

<CFIF NOT IsDefined("SearchDirection")>
  <CFSET SearchDirection="FORW">
</CFIF>

<CFQUERY NAME="GetMaxTable"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_USER_NAME#"
         PASSWORD="#FM_USER_PASS#">
SELECT a.TABLES_UID, b.NumRecords
FROM (SELECT MAX(TABLES_UID) As 'TABLES_UID' FROM FOLKMED_TABLES) a, FOLKMED_TABLES b
WHERE a.TABLES_UID=b.TABLES_UID
</CFQUERY>

<CFIF SearchDirection is "FORW">
  <CFQUERY NAME="GetTables"
           DATASOURCE="#FM_DATABASE_NAME#"
           USERNAME="#FM_USER_NAME#"
           PASSWORD="#FM_USER_PASS#">
  SELECT TABLES_UID, TableName
  FROM FOLKMED_TABLES
  WHERE TABLES_UID >= #StartTable#
  ORDER BY TABLES_UID ASC
  </CFQUERY>
<CFELSE>
  <CFQUERY NAME="GetTables"
           DATASOURCE="#FM_DATABASE_NAME#"
           USERNAME="#FM_USER_NAME#"
           PASSWORD="#FM_USER_PASS#">
  SELECT TABLES_UID, TableName, NumRecords
  FROM FOLKMED_TABLES
  WHERE TABLES_UID <= #StartTable#
  ORDER BY TABLES_UID DESC
  </CFQUERY>
</CFIF>

<CFSET MasterRecordCount = 0>
<CFSET LastTable = 0>
<CFSET TableSearchList = "">
<CFSET LocalStartRow = StartRow>
<CFSET ProcessedAllTables = "TRUE">
<CFLOOP QUERY="GetTables">
  <CFIF SearchDirection is "FORW">
    <CFQUERY NAME="GetResults#TABLES_UID#"
             DATASOURCE="#FM_DATABASE_NAME#"
             USERNAME="#FM_USER_NAME#"
             PASSWORD="#FM_USER_PASS#"
             DEBUG="YES">
    SELECT ('#TABLES_UID#_' + CONVERT(char(20),FL_RECORD_UID)) AS UID, Subject, Cure
    FROM #TableName#
    WHERE (FL_RECORD_UID > #IIF(LocalStartRow is "1", DE("0"), DE(LocalStartRow))#) AND (SYSFLAGS = 1) <CFIF LEN(SQLString) GT 0> AND (#PreserveSingleQuotes(SQLString)#) </CFIF>
    ORDER BY FL_RECORD_UID
    </CFQUERY>
    <CFSET LocalStartRow = 0>
    <CFSET StartRecord = 0>
  <CFELSE>
    <CFQUERY NAME="GetResults#TABLES_UID#"
             DATASOURCE="#FM_DATABASE_NAME#"
             USERNAME="#FM_USER_NAME#"
             PASSWORD="#FM_USER_PASS#">
    SELECT ('#TABLES_UID#_' + CONVERT(char(20),FL_RECORD_UID)) AS UID, Subject, Cure
    FROM #TableName#
    WHERE (FL_RECORD_UID < #LocalStartRow#) AND (SYSFLAGS = 1) <CFIF LEN(SQLString) GT 0> AND ( #PreserveSingleQuotes(SQLString)# ) </CFIF>
    ORDER BY FL_RECORD_UID
    </CFQUERY>
    <CFSET LocalStartRow = 99999>
    <CFSET StartRecord = 99999>
  </CFIF>
  <CFSET TableSearchList = ListAppend(TableSearchList, "GetResults#TABLES_UID#")>
  <CFSET MasterRecordCount = MasterRecordCount + Evaluate("GetResults#TABLES_UID#.RecordCount")>
  <CFIF NOT IsDefined("STable") OR (Evaluate("GetResults#Tables_UID#.RecordCount") GT STable)>
    <CFIF (LocalStartRow is "1") OR (LocalStartRow is "0")>
      <CFSET STable = Evaluate("GetResults#Tables_UID#.RecordCount")>
    </CFIF>
  </CFIF>
  <CFSET MaxTable = #TABLES_UID#>
  <CFIF NOT IsDefined("MinTable")>
    <CFSET MinTable = #TABLES_UID#>
  </CFIF>
  <CFIF MasterRecordCount GTE MaxRecords>
    <CFSET ProcessedAllTables = "FALSE">
    <CFBREAK>
  </CFIF>
</CFLOOP>
<CFSET ToRec = StartRow+(#MaxRecords#-1)>
<CFIF ToRec GT MasterRecordCount>
  <CFSET ToRec = MasterRecordCount>
</CFIF>

<table width=500 cellpadding=0 cellspacing=0 border=0>
  <tr>
    <td>
      <center><IMG SRC="images/stpl_bar.gif"><br>
      <IMG SRC="images/stpl_bnl.gif">
      <FONT SIZE="+3" color="08b00" face=arial>
        <b>results</b>
      </FONT>
      <IMG SRC="images/stpl_bnr.gif"><br>
      <img src="images/stick1.jpg">
      <br>
      <font face=arial size=1 color="#000000">
        <CFOUTPUT>
          Displaying records #CurRecord# through #EVALUATE(CurRecord + IIF(MasterRecordCount GT MaxRecords, DE(MaxRecords), DE(MasterRecordCount)) - 1)#<CFIF IsDefined("STable") AND (IIF(MasterRecordCount GT MaxRecords, DE(MaxRecords), DE(MasterRecordCount)) is not "0") AND (MaxRecords LTE 50)> of approximately #Evaluate(STable * 25)# records found</CFIF>.
        </CFOUTPUT>
      </TD>
</TR>
</TABLE>

<IMG SRC="images/stpl_bar.gif">
<TABLE BORDER=1 WIDTH="500">
  <TR>
    <TD ALIGN=CENTER>
      <font face=arial, helvetica>
        <B>Condition</B>
    </TD>
    <TD ALIGN=CENTER>
      <font face=arial, helvetica>
        <B>Method Of Treatment</B>
    </TD>
  </TR>

<CFSET RecordsShown = 0>
<CFLOOP QUERY="GetTables">
  <CFSET LocalRecordsShown = 0>
  <CFOUTPUT QUERY="GetResults#TABLES_UID#"
            STARTROW="1"
            MaxRows="#EVALUATE(MaxRecords-RecordsShown)#">
  <TR>
    <TD>
      <font face=arial, helvetica>
        <CFSET MAXUID = "#UID#">
        <A HREF="FMDetail.cfm?UID=#TRIM(UID)#">
          #Trim(Subject)#
        </A>
    </TD>
    <TD>
      <font face=arial, helvetica>
        #Trim(Cure)# &nbsp;
    </TD>
  </TR>
  <CFSET RecordsShown = RecordsShown + 1>
  <CFSET LocalRecordsShown = LocalRecordsShown + 1>
  </CFOUTPUT>
  <CFIF RecordsShown GTE MaxRecords>
    <CFBREAK>
  </CFIF>
</CFLOOP>
<CFIF RecordsShown is "0">
  <TR HEIGHT="200">
    <TD COLSPAN="2" ALIGN="CENTER" VALIGN="CENTER">
      <FONT SIZE="+2">
        Sorry, no records have been found!
        <BR>Please try a different search again...
      </FONT>
    </TD>
  </TR>
</CFIF>
</TABLE>
<center>
<IMG SRC="images/stpl_bar.gif">
<CFOUTPUT>
<TABLE BORDER=0 WIDTH="500">
  <TR>
    <TD WIDTH="35%">
      <P>
<CFIF (StartTable GT 1) OR ((StartRow GT 1) AND (Evaluate("GetResults#MaxTable#.RecordCount") GT 10))>
      <A HREF="FMResults.cfm?SearchDirection=REVR&StartRecord=#TRIM(Evaluate("GetResults#MaxTable#.UID"))#&CurRecord=#Evaluate(CurRecord - MaxRecords)#&MaxRecords=#MaxRecords#&STable=#STable#&#URLArgs#">
        <IMG SRC="images/stpl_arl.gif" BORDER=0 ALIGN=MIDDLE>
        <FONT SIZE="+1" face=arial, helvetica>
          <B>Previous</B>
        </FONT>
      </a>
</CFIF>
    </TD>
    <TD ALIGN=CENTER WIDTH="30%">
      <P>
      <A HREF="index.html">
        <FONT SIZE="+1" face=arial, helvetica>
          Start New Search
        </FONT>
      </A>
    </TD>
    <TD WIDTH="35%">
      <P ALIGN=right>
<CFIF (Evaluate("GetResults#MaxTable#.RecordCount") GT LocalRecordsShown) OR (MaxTable is not GetMaxTable.TABLES_UID)>
      <a href="FMResults.cfm?StartRecord=#TRIM(MAXUID)#&CurRecord=#Evaluate(CurRecord + MaxRecords)#&STable=#STable#&MaxRecords=#MaxRecords#&#URLArgs#">
        <P ALIGN=right>
        <FONT SIZE="+1" face=arial, helvetica>
          <B>Next</B>
        </FONT>
        <IMG SRC="images/stpl_arr.gif" BORDER=0 ALIGN=MIDDLE>
      </a>
</CFIF>
    </TD>
  </TR>
</TABLE>
</CFOUTPUT>
<CFINCLUDE TEMPLATE="FMGlobalFooter.cfm">
</BODY>
</HTML>

