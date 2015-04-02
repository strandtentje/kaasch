<cfcomponent>
	<cffunction name="verplaatsstuk" returntype="void" access="public">
		<cfargument name="stukid" displayname="stuk identificatie"
			hint="database id van te verplaatsen stuk"
			required="yes" type="numeric">
		<cfargument name="positie" displayname="doelcoordinaten" 
			hint="menselijk leesbare doelcoordinaten"
    		required="yes" type="struct">

		<cfquery name="verplaatser" datasource="rob_test">
			UPDATE test_rob.dbo.Stuk SET				
				noordzuid = <cfqueryparam value="#positie.noordzuid#" maxlength="1">,
				westoost = ASCII(<cfqueryparam value="#positie.westoost#" maxlength="1">) - 64 
			WHERE id = <cfqueryparam value="#stukid#">;
		</cfquery>
	</cffunction>
</cfcomponent>