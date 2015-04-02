<cfcomponent>
	<cffunction name="vermenigvuldig" returntype="numeric" access="public">
		<cfargument name="bordid" displayname="bord identificatie"
			hint="database id van te vermenigvuldigen vord">
		<cfargument name="naam" displayname="bord naam"
			hint="menselijk leesbare naam voor nieuw bord">

		<cfquery name="laatstebord" datasource="rob_test">
			SELECT TOP 1
				id nid
			FROM
				test_rob.dbo.Bord
			ORDER BY
				id DESC;
		</cfquery>

		<cfset nieuwid = laatstebord.nid[1] + 1>

		<cfquery name="nieuwbord" datasource="rob_test">
			INSERT INTO test_rob.dbo.Bord(
				id, isvergrendeld, 
				naam)
			VALUES(
				<cfqueryparam value="#nieuwid#">, 0, 
				<cfqueryparam value="#naam#" maxlength="30">
			);
		</cfquery>

		<cfquery name="duplicatie" datasource="rob_test">
			INSERT INTO test_rob.dbo.Stuk(
				bord,
				westoost, noordzuid, soort, isdood, aantalzetten, team)
			SELECT
				<cfqueryparam value="#nieuwid#">,
				westoost, noordzuid, soort, isdood, aantalzetten, team
			FROM 
				test_rob.dbo.Stuk
			WHERE
				bord = <cfqueryparam value="#bordid#">;
		</cfquery>

		<cfreturn nieuwid>
	</cffunction>

	<cffunction name="verplaatsstuk" returntype="void" access="public">
		<cfargument name="stukid" displayname="stuk identificatie"
			hint="database id van te verplaatsen stuk"
			required="yes" type="numeric">
		<cfargument name="positie" displayname="doelcoordinaten" 
			hint="menselijk leesbare doelcoordinaten"
    		required="yes" type="struct">

		<cfquery name="verplaatser" datasource="rob_test">
			UPDATE test_rob.dbo.Stuk 
			SET				
				noordzuid = <cfqueryparam value="#positie.noordzuid#" maxlength="1">,
				westoost = ASCII(<cfqueryparam value="#positie.westoost#" maxlength="1">) - 64 
			WHERE id = <cfqueryparam value="#stukid#">;
		</cfquery>
	</cffunction>
</cfcomponent>