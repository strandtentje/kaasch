<cfif structKeyExists(url, "bord")><cfset bord = url.bord></cfif>

<cfinclude template="skelet/header.cfm">

<cfif bordbeschikbaar>
	<cfif bordbespeeldbaar>
		<cfinclude template="controller.cfm">		
	</cfif>

	<cfinclude template="view.cfm">
<cfelse>
	<cfinclude template="bordkeuze.cfm">
</cfif>

<cfinclude template="skelet/footer.cfm">
