<cfcomponent>
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
</cfcomponent>