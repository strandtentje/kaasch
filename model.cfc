<cfcomponent>
	<cffunction name="stukken" returntype="query" access="public">
		<cfquery name="lijst" datasource="rob_test">
			SELECT id, kenmerk, westoost as westoostn, noordzuid,
			CHAR(64 + westoost) westoost
			FROM test_rob.dbo.Stuk
		</cfquery>
		<cfreturn lijst>
	</cffunction>

	<cffunction name="validecoordinaten" returntype="numeric" access="public" output="yes">
		<cfargument name="coordinaten" displayname="coordinaten" 
			hint="menselijk leesbare coordinaten"
    		required="yes" type="struct">

		<cfset errorcode = 0>

    	<cfif reFind("^[A-F]$", coordinaten.westoost) neq 1>
    		<cfset errorcode = errorcode + 1>
		</cfif>

		<cfif reFind("^[1-8]$", coordinaten.noordzuid) neq 1>
			<cfset errorcode = errorcode + 2>
		</cfif>

		<cfreturn errorcode>
	</cffunction>

	<cffunction name="coordinaatstukid" returntype="numeric" access="public">
		<cfargument name="coordinaten" displayname="coordinaten" 
			hint="menselijk leesbare coordinaten"
    		required="yes" type="struct">

		<cfquery name="stuk" datasource="rob_test">
			SELECT id FROM test_rob.dbo.Stuk WHERE 
				westoost = ASCII(<cfqueryparam value="#coordinaten.westoost#" maxlength="1">) - 64 AND
				noordzuid = <cfqueryparam value="#coordinaten.noordzuid#" maxlength="1">;
		</cfquery>

		<cfif stuk.RecordCount neq 1>
			<cfreturn (-stuk.RecordCount)>
		</cfif>

		<cfreturn stuk.id[1]>
	</cffunction>
</cfcomponent>