<!DOCTYPE HTML>
<html>
	<head>
		<title>Schaak</title>
		<cfinclude template="style.cfm">		
	</head>
	<body>
		<cfset bordbeschikbaar=False>

		<cfif isDefined("bord")>
			<cfinvoke component="model.read" method="bordbyid" returnvariable="lijst" bordid="#bord#">
			<cfset bordbeschikbaar = lijst.RecordCount eq 1>
			<cfset bordbespeeldbaar = lijst.isvergrendeld[1] eq 0>	
		</cfif>