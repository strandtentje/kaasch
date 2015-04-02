<cfif isDefined("form.noordzuid") AND isDefined("form.westoost")>
	<cfif reFind("^[A-F]$", form.westoost) eq 1>
		<cfif reFind("^[1-8]$", form.noordzuid) eq 1>
			
		<cfelse>
			Noord-zuid coordinaten kunnen 1 tot en met 8 zijn.
		</cfif>
	<cfelse>
		West-oost coordinaten kunnen A tot en met F zijn.		
	</cfif>
</cfif>