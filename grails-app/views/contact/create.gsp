<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="../layouts/nav" />
		
		<div>
			<h1>Create New Contact</h1> <hr />
			
			<g:if test="${flash.success}">
			<div class="alert alert-success">${flash.success}</div>
			</g:if>
			
			<g:if test="${flash.error}">
			<div class="alert alert-danger">${flash.error}</div>
			</g:if>
			
			<g:hasErrors bean="${contactInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${contactInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<div class="row">
				<div class="col-lg-6">
					<g:form url="[resource:contactInstance, action:'save']" >
						<g:render template="form"/>
						<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
