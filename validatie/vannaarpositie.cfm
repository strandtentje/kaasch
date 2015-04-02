<cfif vanfout gt 0>	
	<div class="foutmelding">
		<span class="titel">Originele positie:</span>
		<ul>
			<cfif vanfout gt 1>
				<li>noord-zuid coordinaten kunnen 1 tot en met 8 zijn.</li>
				<cfset refill.vannoordzuid = "">
			</cfif>
			<cfif (vanfout mod 2) eq 1>
				<li>west-oost coordinaten kunnen A tot en met F zijn.</li>
				<cfset refill.vanwestoost = "">
			</cfif>
		</ul>
	</div>
</cfif>

<cfif naarfout gt 0>	
	<div class="foutmelding">
		<span class="titel">Nieuwe positie:</span>
		<ul>
			<cfif naarfout gt 1>
				<li>noord-zuid coordinaten kunnen 1 tot en met 8 zijn.</li>
				<cfset refill.naarnoordzuid = "">
			</cfif>
			<cfif (naarfout mod 2) eq 1>
				<li>west-oost coordinaten kunnen A tot en met F zijn.</li>
				<cfset refill.naarwestoost = "">
			</cfif>
		</ul>
	</div>
</cfif>