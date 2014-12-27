
<%@ page import="com.modnsolutions.Contact" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="../layouts/nav" />
		
		<div role="main">
			<h1>${ contactInstance?.firstName } ${ contactInstance?.middleName } ${ contactInstance?.surname }</h1>
			
			<g:render template="email" />
			<hr />
			<g:render template="phone" />
			
			<ol class="property-list contact">
			
			
				<g:if test="${contactInstance?.groups}">
				<li class="fieldcontain">
					<span id="groups-label" class="property-label"><g:message code="contact.groups.label" default="Groups" /></span>
					
						<g:each in="${contactInstance.groups}" var="g">
						<span class="property-value" aria-labelledby="groups-label"><g:link controller="groups" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			
			<hr />
			
			<g:form url="[resource:contactInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-primary" action="edit" resource="${contactInstance}">
						<g:message code="default.button.edit.label" default="Edit" />
						<span class="glyphicon glyphicon-edit"></span>
					</g:link>
					&nbsp;
					<g:submitButton name="delete" class="btn btn-danger" value="Delete ${ contactInstance?.firstName }" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
