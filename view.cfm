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