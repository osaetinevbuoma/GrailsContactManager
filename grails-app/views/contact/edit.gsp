<%@ page import="com.modnsolutions.Contact" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
	<g:render template="../layouts/nav" />

		<div class="row" role="main">
			<div class="col-lg-6">
				<h1>Edit Contact</h1> <hr />

				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>

				<g:hasErrors bean="${contactInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${contactInstance}" var="error">
							<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
				</g:hasErrors>

				<g:form url="[resource:contactInstance, action:'update']" method="PUT" >
					<g:hiddenField name="version" value="${contactInstance?.version}" />
					<fieldset class="form">
						<g:render template="form"/>
					</fieldset>
					<fieldset class="buttons">
						<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						&nbsp;
						<g:link action="show" id="${ contactInstance.id }" class="btn btn-primary">Cancel</g:link>
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>
