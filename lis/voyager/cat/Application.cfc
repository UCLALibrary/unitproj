<cfcomponent>
	<cfscript>
		// this.name = hash( getCurrentTemplatePath() ); // unique app name
		this.name = "ItemSorter";
		this.sessionManagement = "Yes";
		// 9 hours
		this.sessionTimeout = CreateTimeSpan(0,9,0,0);
		this.applicationTimeout = CreateTimeSpan(0,9,0,0);
		this.javaSettings = {LoadPaths = ["..\java\"], loadColdFusionClassPath = true, reloadOnChange= true, watchInterval = 100, watchExtensions = "jar,class"};
	</cfscript>
 
	<cffunction name="onRequest" returnType="void">
		<cfargument name="targetPage" type="string" required="true" />
 
		<!--- Include Application.cfm --->
		<cfinclude template="Application.cfm" />
 
		<!--- Include the requested page --->
		<cfinclude template="#ARGUMENTS.targetPage#" />
	</cffunction>
</cfcomponent>
