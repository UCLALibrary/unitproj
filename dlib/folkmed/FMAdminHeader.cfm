<CFOUTPUT>
<CENTER>
<TABLE BORDER='1'>
  <TR>
    <TD>
<CFIF FILE_NAME is NOT "FMEntry.cfm"><A HREF='FMEntry.cfm'><CFELSE><FONT COLOR='gray'></CFIF>
      Enter Record
<CFIF FILE_NAME is NOT "FMEntry.cfm"></A><CFELSE></FONT></CFIF>
    </TD>
    <TD>
<CFIF FILE_NAME is NOT "FMUpdate.cfm"><A HREF='FMUpdate.cfm'><CFELSE><FONT COLOR='gray'></CFIF>
      Update Record
<CFIF FILE_NAME is NOT "FMUpdate.cfm"></A><CFELSE></FONT></CFIF>
    </TD>
    <TD>
<CFIF FILE_NAME is NOT "FMPredefs.cfm"><A HREF='FMPredefs.cfm'><CFELSE><FONT COLOR='gray'></CFIF>
      Predefined Fields
<CFIF FILE_NAME is NOT "FMPredefs.cfm"></A><CFELSE></FONT></CFIF>
    </TD>
    <TD>
<CFIF FILE_NAME is NOT "FMTables.cfm"><A HREF='FMTables.cfm'><CFELSE><FONT COLOR='gray'></CFIF>
      Table Maintenance
<CFIF FILE_NAME is NOT "FMTables.cfm"></A><CFELSE></FONT></CFIF>
    </TD>
    <TD>
<CFIF FILE_NAME is NOT "FMApproval.cfm"><A HREF='FMApproval.cfm'><CFELSE><FONT COLOR='gray'></CFIF>
      Record Approval
<CFIF FILE_NAME is NOT "FMApproval.cfm"></A><CFELSE></FONT></CFIF>
    </TD>
  </TR>
</TABLE>
</CENTER>
</CFOUTPUT>