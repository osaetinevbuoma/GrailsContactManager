
<%@ page import="com.modnsolutions.Contact" %>
<!DOCTYPE html>
<html xmlns:g="http://www.w3.org/1999/html">
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contact')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="../layouts/nav" />
		
		<div>
			<h1><g:message code="default.list.label" args="[entityName]" /></h1> <hr />

			<g:if test="${flash.message}">
				<div class="alert alert-success" role="status">${flash.message}</div>
			</g:if>

			<table class="table table-responsive table-striped table-hover table-bordered">
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'contact.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="middleName" title="${message(code: 'contact.middleName.label', default: 'Middle Name')}" />
					
						<g:sortableColumn property="surname" title="${message(code: 'contact.surname.label', default: 'Surname')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'contact.dateCreated.label', default: 'Date Created')}" />

						<th></th>

						<th></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contactInstanceList}" status="i" var="contactInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: contactInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: contactInstance, field: "middleName")}</td>
					
						<td>${fieldValue(bean: contactInstance, field: "surname")}</td>
					
						<td><g:formatDate date="${contactInstance.dateCreated}" format="dd/MM/yyyy" /></td>

						<td>
							<g:link action="show" id="${ contactInstance.id }">
								View Details <span class="glyphicon glyphicon-folder-open"></span>
							</g:link>
						</td>

						<td>
							<g:link action="delete" id="${ contactInstance.id }" class="text-danger" onclick="return confirm('Are you sure? This cannot be reversed');">
								Delete <span class="glyphicon glyphicon-trash"></span>
							</g:link>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			
			<br />
			
			<g:link action="create" class="btn btn-primary">New Contact</g:link>
		</div>
	</body>
</html>
