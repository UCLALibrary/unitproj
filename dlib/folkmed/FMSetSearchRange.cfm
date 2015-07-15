<CFPARAM NAME="Attributes.StartRecord" TYPE="numeric">
<CFPARAM NAME="Attributes.RecCount" TYPE="numeric">
<CFPARAM NAME="Attributes.MaxRecords" TYPE="numeric">

<CFSET StartRecord = "#Attributes.StartRecord#">
<CFSET RecCount = "#Attributes.RecCount#">
<CFSET MaxRecords = "#Attributes.MaxRecords#">

<CFSET ToRec = StartRecord+(#MaxRecords#-1)>
<CFIF #ToRec# GT #Evaluate(RecCount)#>
  <CFSET ToRec = #Evaluate(RecCount)#>
</CFIF>

<CFSET PreRec = #StartRecord#-#MaxRecords#>
<CFSET NextRec = #StartRecord#+#MaxRecords#>
<CFSET LastGroupStart =  #Evaluate(RecCount)#\#MaxRecords#>

<CFIF #Evaluate(RecCount)# MOD #MaxRecords# GT 0>
  <cfset LastGroupStart = (#LastGroupStart#*#MaxRecords#)+1>
<CFELSE>
  <CFSET LastGroupStart = (#LastGroupStart#*#MaxRecords#)-(#MaxRecords#-1)>
</CFIF>

<CFIF #Evaluate(RecCount)# GT #MaxRecords#>

  <CFIF StartRecord GT 1>
    <CFSET NFirstRecord = 1>
  <CFELSE>
    <CFSET NFirstRecord = 0>
  </CFIF>

  <CFIF PreRec GT 1>
    <CFSET NPreRec=PreRec>
  <CFELSEIF PreRec GT -(#MaxRecords#-1)>
    <CFSET NPreRec = 1>
  <CFELSE>
    <CFSET NPreRec = 0>
  </CFIF>

  <CFIF NextRec LTE #Evaluate(RecCount)#>
    <CFSET NStartRecord = NextRec>
  <CFELSE>
    <CFSET NStartRecord = 0>
  </CFIF>

  <CFIF LastGroupStart IS NOT #StartRecord#>
    <CFSET NLastRec = LastGroupStart>
  <CFELSE>
    <CFSET NLastRec = 0>
  </CFIF>
<CFELSE>
  <CFSET NPreRec = 0>
  <CFSET NStartRecord = 0>
</CFIF>

<CFSET CALLER.ToRec="#ToRec#">
<CFSET CALLER.NPreRec="#NPreRec#">
<CFSET CALLER.NStartRecord="#NStartRecord#">
