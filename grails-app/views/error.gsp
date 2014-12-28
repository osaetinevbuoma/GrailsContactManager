<!DOCTYPE html>
<html xmlns:g="http://www.w3.org/1999/html">
	<head>
		<title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
		<meta name="layout" content="main">
		<g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
	</head>
	<body>
		<g:if env="development">
			<g:renderException exception="${exception}" />
		</g:if>
		<g:else>
			<ul class="errors">
				<li>An error has occurred</li>
			</ul>

			<g:if test="${ flash.error }">
				<div clsas="alert alert-danger">${ flash.error }</div>
			</g:if>
		</g:else>
	</body>
</html>
