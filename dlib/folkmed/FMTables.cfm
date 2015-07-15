<!--- Include SyllabiCentral Global Variables --->
<CFINCLUDE TEMPLATE="FMGlobal.cfm">
<CFSET FILE_NAME="FMTables.cfm">
<CFSET FILE_TITLE="FolkMed Table Maintenance">

<CFIF NOT IsDefined("Action")>
  <CFSET Action="List">
</CFIF>

<HTML>
<HEAD>
<TITLE>FolkMed - <CFOUTPUT>#FILE_TITLE#</CFOUTPUT></TITLE>
</HEAD>
<BODY>
<CFINCLUDE TEMPLATE="FMAdminHeader.cfm">
<BR>
<BR>
<CENTER>

<CFSWITCH EXPRESSION=#Action#>
<CFCASE VALUE="AddTable">
<CFQUERY NAME="MAKETABLE"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
BEGIN TRANSACTION

DECLARE @create_err int, @pk_err int
create table #NewTableName# ( 
	FL_RECORD_UID int identity not null,
	SUBJECT char(255) null,
	CURE text null,
	CAUSE text null,
	SIGN text null,
	CITATION text null,
	CARDTEXT text null,
	INFORMANTETHNICITY char(96) null,
	INFORMANTGENDER smallint null,
	INFORMANTAGE smallint null,
	COLLECTOR char(32) null,
	COLLECTEDPLACE char(128) null,
	COLLECTEDREGION smallint null,
	COLLECTEDDATE smallint null,
	ORIGINETHNICITY char(96) null,
	ORIGINPLACE char(96) null,
	ORIGINREGION smallint null,
	PAGEREFERENCE char(64) null,
	VOLUMENUMBER char(16) null,
	SYSFLAGS smallint not null)
SELECT @create_err = @@ERROR

alter table #NewTableName#
	add constraint #NewTableName#_PK primary key (FL_RECORD_UID)   
SELECT @pk_err = @@ERROR

IF @create_err = 0 AND @pk_err = 0
BEGIN
  INSERT INTO FOLKMED_TABLES (TableName, NumRecords, SYSFLAGS) VALUES ('#FM_ADMIN_NAME#.#NewTableName#', 0, 0)
  GRANT SELECT ON #NewTableName# TO FolkUser
  PRINT 'The Table Was Created Successfully!'
  COMMIT TRANSACTION
END
ELSE
BEGIN
  IF @create_err <> 0
    PRINT 'An Error Occurred Trying to Create the New Table'
  IF @pk_err <> 0
    PRINT 'An Error Occurred Trying to Add the Primary Key'
  ROLLBACK TRANSACTION
END
</CFQUERY>
<H2>New Table Added Successfully!</H2>
<BR><BR><BR>Return to <A HREF="FMTables.cfm">List</A>...
</CFCASE>
<CFCASE VALUE="ConfirmTable">
<CFQUERY NAME="GetMaxTableUID"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT MAX(TABLES_UID) As 'MaxUID' FROM FOLKMED_TABLES
</CFQUERY>
<CFSET NewUID = EVALUATE(Int(GetMaxTableUID.MaxUID) + 1)>
<H2>Confirm New Table</H2>
<TABLE BORDER=1>
<TR>
  <TD>
    Do You Wish to Add the New Search Table:
  </TD>
</TR>
<TR>
  <TD ALIGN="CENTER">
    FOLKMED_RECORD<CFOUTPUT>#NewUID#</CFOUTPUT>
  </TD>
</TR>
</TABLE>
<FORM NAME="AddNewTable" ACTION="FMTables.cfm" METHOD=POST>
  <INPUT TYPE=HIDDEN NAME="Action" VALUE="AddTable">
  <INPUT TYPE=HIDDEN NAME="NewTableName" VALUE="FOLKMED_RECORD<CFOUTPUT>#NewUID#</CFOUTPUT>">
  <INPUT TYPE=BUTTON NAME="Cancel" VALUE="Cancel" OnClick="window.history.back()">
  <INPUT TYPE=SUBMIT VALUE="Add New Search Table">
</FORM>
</CFCASE>
<CFDEFAULTCASE>
<CFQUERY NAME="GETTABLES"
         DATASOURCE="#FM_DATABASE_NAME#"
         USERNAME="#FM_ADMIN_NAME#"
         PASSWORD="#FM_ADMIN_PASS#">
SELECT TABLES_UID, TableName, NumRecords
FROM FOLKMED_TABLES
ORDER BY TABLES_UID
</CFQUERY>
<TABLE BORDER=0 WIDTH='75%'>
  <TR>
    <TD>
      <TABLE  cellspacing="1" cellpadding="0" width="100%">
        <TR>
          <TH ALIGN='CENTER'>
            Table Number
          </TH>
          <TH ALIGN='CENTER'>
            Table Name
          </TH>
          <TH ALIGN='CENTER'>
            Record Count
          </TH>
          <TH ALIGN='CENTER'>
            Space Usage
          </TH>
        </TR>
<CFOUTPUT QUERY="GETTABLES">
        <TR>
          <TD ALIGN='CENTER'>
            #TABLES_UID#
          </TD>
          <TD ALIGN='CENTER'>
            #TableName#
          </TD>
          <TD ALIGN='CENTER'>
            #NumRecords#/20000
          </TD>
          <TD ALIGN='CENTER'>
            <TABLE BORDER=1>
              <TR>
<CFIF NumRecords GT 0>
                <TD BGCOLOR='BLUE' WIDTH = #FIX(EVALUATE((NumRecords/20000)*200))#>
                  &nbsp;
                </TD>
</CFIF>
                <TD BGCOLOR='WHITE' WIDTH = #FIX(EVALUATE(((20000-NumRecords)/20000)*200))#>
                  &nbsp;
                </TD>
              </TR>
            </TABLE>
          </TD>
        </TR>
</CFOUTPUT>
      </TABLE>
    </TD>
  </TR>
</TABLE>
<FORM NAME="ConfirmNewTable" ACTION="FMTables.cfm" METHOD=POST>
  <INPUT TYPE=HIDDEN NAME="Action" VALUE="ConfirmTable">
  <INPUT TYPE=SUBMIT VALUE="Add New Search Table">
</FORM>
</CFDEFAULTCASE>
</CFSWITCH>
</CENTER>
<P ALIGN='RIGHT'><A HREF="http:\\www.hcf.ucla.edu"><IMG BORDER=0 SRC="images/madebyHCF.jpg"></A></P>
</BODY>
</HTML>