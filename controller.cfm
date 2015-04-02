<cfif isDefined("form.vannoordzuid") AND isDefined("form.vanwestoost")>
	<cfset vanwestoost = Trim(form.vanwestoost)>
	<cfset vannoordzuid = Trim(form.vannoordzuid)>
	<cfset naarwestoost = Trim(form.naarwestoost)>
	<cfset naarnoordzuid = Trim(form.naarnoordzuid)>

	<cfinvoke component="model" method="stukken" returnvariable="vanfout"
		westoost="#vanwestoost#" noordzuid="#vannoordzuid#">
	<cfinvoke component="model" method="stukken" returnvariable="naarfout"
		westoost="#naarwestoost#" noordzuid="#naarnoordzuid#">

	<cfinclude template="validatie/vannaarpositie.cfm">

	<cfif (vanfout eq 0) AND (naarfout eq 0)>
		<cfinvoke component="model" method="coordinaatstukid" returnvariable="stukid"
			westoost="#vanwestoost#" noordzuid="#vannoordzuid#">

		<cfinclude template="validatie/stukidkiezen.cfm">


	</cfif>
</cfif>