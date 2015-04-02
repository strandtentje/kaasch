<cfinvoke component="model" method="stukken" returnvariable="lijst">

<ul class="view">
	<cfoutput query="lijst">
		<li>#kenmerk# (#westoost#, #noordzuid#)</li>
	</cfoutput>
</ul>