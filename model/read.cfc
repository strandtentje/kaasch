<cfcomponent>
	<cffunction name="borden" returntype="query" access="public">
		<cfquery name="lijst" datasource="rob_test">
			SELECT 
				id, isvergrendeld
			FROM
				Bord;
		</cfquery>

		<cfreturn lijst>
	</cffunction>

	<cffunction name="bordbyid" returntype="query" access="public">
		<cfargument name="bordid" displayname="bord identificatie"
			hint="database id van te bekijken bord"
			required="yes" type="numeric">

		<cfquery name="lijst" datasource="rob_test">
			SELECT 
				id, isvergrendeld, naam
			FROM
				Bord
			WHERE
				id = <cfqueryparam value="#bordid#">;			
		</cfquery>		

		<cfreturn lijst>
	</cffunction>

	<cffunction name="bordstukken" returntype="query" access="public">
		<cfargument name="bordid" displayname="bord identificatie"
			hint="database id van te bekijken bord"
			required="yes" type="numeric">

		<cfquery name="lijst" datasource="rob_test">
			SELECT 
				naam, 
				westoost as westoostn, 
				noordzuid,
				team as richting, 
				((team + 3) / 2) as team,
				CHAR(64 + westoost) as westoost
			FROM 
				test_rob.dbo.Stuk 
				JOIN 
					test_rob.dbo.Soort ON
					Stuk.soort = Soort.id
			WHERE
				Stuk.bord = <cfqueryparam value="#bordid#">
			ORDER BY
				team ASC;
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