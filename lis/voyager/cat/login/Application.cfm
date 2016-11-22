<cfapplication name="ItemSorter"
               sessionmanagement="Yes"
               sessiontimeout="#createTimeSpan(1,0,0,0)#"
               applicationtimeout="#createTimeSpan(1,0,0,0)#"
>
<cfset session.DSN = "Voyager">
