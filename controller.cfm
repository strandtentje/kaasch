<cfset refill = { vanwestoost = "", vannoordzuid = "", naarwestoost = "", naarnoordzuid = "" }>

<cfif isDefined("form.vannoordzuid") AND isDefined("form.vanwestoost")>
	<cfset van.westoost = Trim(form.vanwestoost)>
	<cfset van.noordzuid = Trim(form.vannoordzuid)>
	<cfset naar.westoost = Trim(form.naarwestoost)>
	<cfset naar.noordzuid = Trim(form.naarnoordzuid)>
	<cfset refill = { 
		vanwestoost = van.westoost, vannoordzuid = van.noordzuid, 
		naarwestoost = naar.westoost, naarnoordzuid = naar.noordzuid 
		}>

	<cfinvoke component="model" method="validecoordinaten" returnVariable="vanfout" coordinaten="#van#">
	<cfinvoke component="model" method="validecoordinaten" returnVariable="naarfout" coordinaten="#naar#">

	<cfinclude template="validatie/vannaarpositie.cfm">

	<cfif (vanfout eq 0) AND (naarfout eq 0)>
		<cfinvoke component="model" method="coordinaatstukid" returnVariable="stukid" coordinaten="#van#">
		<cfinclude template="validatie/stukid.cfm">

		<cfinvoke component="model" method="coordinaatstukid" returnVariable="plaatsstatus" coordinaten="#naar#">
		<cfinclude template="validatie/plaatsstatus.cfm">

		
	<cfelse>

	</cfif>
</cfif>

<cfinclude template="form.cfm">