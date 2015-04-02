<cfinvoke component="model" method="stukken" returnvariable="lijst">

<ul id="lijst">
	<cfoutput query="lijst">
		<li>#kenmerk# (#westoost#, #noordzuid#)</li>
	</cfoutput>
</ul>