<%@ page import="com.modnsolutions.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="../layouts/nav" />

		<div class="row" role="main">
			<div class="col-lg-6">
				<h1>Personal Information</h1> <hr />

				<g:if test="${flash.success}">
					<div class="alert alert-success" role="status">${flash.success}</div>
				</g:if>

				<g:if test="${flash.failure}">
					<div class="alert alert-danger" role="status">${flash.failure}</div>
				</g:if>

				<g:hasErrors bean="${userInstance}">
					<ul class="alert alert-failure" role="alert">
						<g:eachError bean="${userInstance}" var="error">
							<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
				</g:hasErrors>

				<g:form url="[resource:userInstance, action:'update']" method="PUT" >
					<g:hiddenField name="version" value="${userInstance?.version}" />
					<fieldset class="form">
						<g:render template="form"/>
					</fieldset>
					<fieldset class="buttons">
						<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>
