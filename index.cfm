<cfinclude template="skelet/header.cfm">

<cfset bordbeschikbaar=False>

<cfif isDefined("url.bord")>
	<cfset bord = url.bord>	
	<cfinvoke component="model.read" method="bordbyid" returnvariable="lijst" bordid="#bord#">
	<cfset bordbeschikbaar = lijst.RecordCount eq 1>
	<cfset bordbespeeldbaar = lijst.isvergrendeld[1] eq 0>
</cfif>

<cfif bordbeschikbaar>
	<cfif bordbespeeldbaar>
		<cfinclude template="controller.cfm">		
	</cfif>

	<cfinclude template="view.cfm">
<cfelse>
	<cfinclude template="bordkeuze.cfm">
</cfif>

<cfinclude template="skelet/footer.cfm">