<cfoutput>
	<form class="controller" method="post">
		<label for="vanwestoost">Huidig w/o coordinaat stuk</label>
		<input id="veld_vanwestoost" name="vanwestoost" maxlength="1" 
			value="#refill.vanwestoost#">
		<label for="vannoordzuid">Huidig n/z coordinaat stuk</label>
		<input id="veld_vannoordzuid" name="vannoordzuid" maxlength="1" 
			value="#refill.vannoordzuid#">
		<label for="naarwestoost">Nieuw w/o coordinaat stuk</label>
		<input id="veld_naarwestoost" name="naarwestoost" maxlength="1" 
			value="#refill.naarwestoost#">
		<label for="naarnoordzuid">Nieuw n/z coordinaat stuk</label>
		<input id="veld_naarnoordzuid" name="naarnoordzuid" maxlength="1" 
			value="#refill.naarnoordzuid#">
		<input class="submit" type="submit" name="submit" value="Verplaatsen">
	</form>
</cfoutput>
