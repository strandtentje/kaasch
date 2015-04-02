<cfif isDefined("form.vannoordzuid") AND isDefined("form.vanwestoost")>
	<cfinvoke component="model" method="stukken" returnvariable="fout"
		westoost="#Trim(form.vanwestoost)#"	noordzuid="#Trim(form.noordzuid)#">

	<cfif fout gt 0>
		<cfif fout gt 1>
			<span class="error">Noord-zuid coordinaten kunnen 1 tot en met 8 zijn.</span>
		</cfif>
		<cfif (fout mod 2) eq 1>
			<span class="error">West-oost coordinaten kunnen A tot en met F zijn.</span>
		</cfif>
	<cfelse>

	</cfif>


</cfif>