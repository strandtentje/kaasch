<cfif isDefined("form.bord")><cfset bord = form.bord></cfif>

<cfinclude template="skelet/header.cfm">

<cfif bordbeschikbaar AND isDefined("form.naam")>
	<cfinvoke component="model.write" method="vermenigvuldig" returnvariable="nieuwbord"
		bordid="#bord#" naam="#form.naam#">

	Bord gemaakt.
	<cfoutput>
		<a href="index.cfm?bord=#nieuwbord#">
			Naar nieuw bord!
		</a>
	</cfoutput>	
<cfelse>
	<div class="foutmelding">
		<span class="titel">Aanroep onjuist; bord of naam niet opgegeven.</span>
	</div>
</cfif>

<cfinclude template="skelet/footer.cfm">
	