
<%@ page import="com.modnsolutions.Contact" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="../layouts/nav" />
		
		<div>
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>

			<table class="table table-responsive table-stripped table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'contact.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="middleName" title="${message(code: 'contact.middleName.label', default: 'Middle Name')}" />
					
						<g:sortableColumn property="surname" title="${message(code: 'contact.surname.label', default: 'Surname')}" />
					
						<th><g:message code="contact.user.label" default="User" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'contact.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'contact.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contactInstanceList}" status="i" var="contactInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contactInstance.id}">${fieldValue(bean: contactInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: contactInstance, field: "middleName")}</td>
					
						<td>${fieldValue(bean: contactInstance, field: "surname")}</td>
					
						<td>${fieldValue(bean: contactInstance, field: "user")}</td>
					
						<td><g:formatDate date="${contactInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${contactInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contactInstanceCount ?: 0}" />
			</div>
			
			<br />
			
			<g:link action="create" class="btn btn-primary">New Contact</g:link>
		</div>
	</body>
</html>
