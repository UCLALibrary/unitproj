<cflogin>
   <cfif IsDefined('COOKIE.saco_username') AND IsDefined('COOKIE.saco_password')>
      <cfloginuser name="#COOKIE.saco_username#" password="#COOKIE.saco_password#" roles="basic">
   <cfelse>
     <cfif IsDefined('FORM.saco_login_button')>
         <cfif FORM.password EQ 'kinross' AND FORM.username EQ 'cmdc'>
	       <cfloginuser name="#FORM.username#" password="#FORM.password#" roles="basic">
   		   <cfcookie name="saco_username" expires="never" value="#FORM.username#">
		   <cfcookie name="saco_password" expires="never" value="#FORM.password#">
	     <cfelse>
	       <cfinclude template="login_saco.cfm">
	       <cfabort>
	     </cfif>
      <cfelse>
        <cfinclude template="login_saco.cfm">
	    <cfabort> 
	  </cfif>
    </cfif>
</cflogin>