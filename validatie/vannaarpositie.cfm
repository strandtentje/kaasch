<cfif vanfout gt 0>
	<cfset fout = vanfout>
	<div class="foutmelding"><span class="titel">Originele positie:</span>
		<ul><cfinclude template="foutmelding/coordinaatinvoer.cfm"></ul>
	</div>
</cfif>

<cfif naarfout gt 0>
	<cfset fout = naarfout>
	<div class="foutmelding"><span class="titel">Nieuwe positie:</span>
		<ul><cfinclude template="foutmelding/coordinaatinvoer.cfm"></ul>
	</div>
</cfif>