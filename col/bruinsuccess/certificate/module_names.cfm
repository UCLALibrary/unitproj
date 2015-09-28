<cfswitch expression="#mdle#">
 <cfcase value="01">
  <cfset module = "Intellectual Property">
 </cfcase>
 <cfcase value="02">
  <cfset module = "Need a File, Share a File">
 </cfcase>
 <cfcase value="03">
  <cfset module = "Citing & Documenting Sources">
 </cfcase>
 <cfcase value="04">
  <cfset module = "Avoiding Disaster">
 </cfcase>
 <cfcase value="05">
  <cfset module = "Don't Get Busted">
 </cfcase>
 <cfdefaultcase>
  <cfset module = "Unknown">
 </cfdefaultcase>
</cfswitch>