<cfinvoke component="model.read" method="bordstukken" returnvariable="lijst" bordid="#bord#">

<ul class="view">
	<cfoutput query="lijst">
		<li class="stuk #naam# p#team# r#noordzuid# #westoost#">
			<span class="naam informatie">
				#naam#
			</span>
			<span class="speler informatie">
				speler #team# 
			</span>
			<span class="positie informatie">
			 	(#westoost#, #noordzuid#)	
		 	</span>
		</li>
	</cfoutput>
</ul>

<cfoutput>
	<form action="kloon.cfm" method="post">
		<input type="hidden" value="#bord#" name="bord">
		<label for="naam">Naam van duplicaat:</label>
		<input type="text" length="30" value="nieuw bord" name="naam">
		<input type="submit" value="Dit bord dupliceren">
	</form>
</cfoutput>
