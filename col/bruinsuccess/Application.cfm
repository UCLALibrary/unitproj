<cfset dsn_np = "colnoplag">

<cfapplication name="quiz" sessiontimeout="#CreateTimeSpan(0,0,60,0)#" sessionmanagement="Yes" clientmanagement="Yes" >


<!---
<cflock timeout = 20 scope = "Session" type = "Exclusive">
 <cfparam name="session.quiz" type="struct" default="structnew()">
</cflock>
--->






