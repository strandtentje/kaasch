<cfcomponent>
	<cffunction name="stukken" returntype="query" access="public">
		<cfquery name="lijst" datasource="rob_test">
			SELECT id, kenmerk, westoost as westoostn, noordzuid,
			CHAR(64 + westoost) westoost
			FROM test_rob.dbo.Stuk
		</cfquery>
		<cfreturn lijst>
	</cffunction>

	<cffunction name="validecoordinaten" returntype="integer" access="public">
		<cfargument name="westoost" displayname="west-oost letters" 
			hint="west-oost coordinaat letters A tot en met F"
    		required="yes" type="string">
		<cfargument name="noordzuid" displayname="noord-zuid cijfers" 
			hint="noord-zuid coordinaat letters 1 tot en met 8F"
    		required="yes" type="string">

		<cfset errorcode = 0>

    	<cfif reFind("^[A-F]$", westoost) neq 1>
    		<cfset errorcode = errorcode + 1>
		</cfif>

		<cfif reFind("^[1-8]$", noordzuid) neq 1>
			<cfset errorcode = errorcode + 2>
		</cfif>

		<cfreturn errorcode>
	</cffunction>

	<cffunction name="coordinaatstukid" returntype="int" access="public">
		<cfargument name="westoost" displayname="west-oost letters" 
			hint="west-oost coordinaat letters A tot en met F"
    		required="yes" type="string">
		<cfargument name="noordzuid" displayname="noord-zuid letters" 
			hint="noord-zuid coordinaat letters A tot en met F"
    		required="yes" type="string">

		<cfquery name="stuk" datasource="rob_test">
			SELECT id FROM test_rob.dbo.Stuk WHERE 
				westoost = ASCII(<cfqueryparam value="#westoost#" maxlength="1">) - 64 AND
				noordzuid = <cfqueryparam value="#noordzuid#" maxlength="1">;
		</cfquery>

		<cfif stuk.RecordCount neq 1>
			<cfreturn (-stuk.RecordCount)>
		</cfif>

		<cfreturn stuk.id[1]>
	</cffunction>
</cfcomponent>