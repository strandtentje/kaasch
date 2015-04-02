<cfif stukid lt 0>
	<div class="foutmelding">
		<span class="titel">Te veel stukken aanwezig op positie.</span>
	</div>
</cfif>

<cfif stukid eq 0>
	<div class="foutmelding">
		<span class="titel">Geen stukken op positie.</span>
	</div>			
</cfif>
