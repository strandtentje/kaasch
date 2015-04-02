<cfinvoke component="model.read" method="borden" returnvariable="lijst">

<ul>
	<cfoutput query="lijst">
		<li><a href="?bord=#id#">Bord #id# '#naam#' <cfif #isvergrendeld# eq 1>(vergrendeld)</cfif></a></li>
	</cfoutput>
</ul>