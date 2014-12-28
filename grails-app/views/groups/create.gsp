<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'group.label', default: 'Group')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="../layouts/nav" />		

		<div role="main">
			<h1>Groups</h1> <hr />
			
			<div class="row">
				<div class="col-lg-6">
					<g:if test="${flash.message}">
					<div class="alert alert-success" role="status">${flash.message}</div>
					</g:if>
					
					<g:hasErrors bean="${groupsInstance}">
					<ul class="alert alert-danger" role="alert">
						<g:eachError bean="${groupsInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
			
					<g:form url="[resource:groupsInstance, action:'save']" >
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</fieldset>
					</g:form>
				</div>
				
				<div class="col-lg-6">
					<g:if test="${ groupInstanceList }">
						<table class="table table-hover table-responsive">
							<thead>
								<tr>
									<th>Groups</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${ groupInstanceList }" var="group">
								<tr>
									<td>${ group.name.encodeAsHTML() }</td>
									<td>
										<g:link action="edit" id="${ group.id }">
											Edit <span class="glyphicon glyphicon-edit"></span>
										</g:link>
									</td>
									<td>
										<g:form url="[resource: group, action: 'delete']" method="DELETE">
											<g:actionSubmit action="delete" class="text-danger" value="Delete" onclick="return confirm('Are you sure you want to delete?');" />
										</g:form>
									</td>
								</tr>
								</g:each>
							</tbody>
						</table>
					</g:if>
					<g:else>
						<p>There are no groups created yet...</p>
					</g:else>
				</div>
			</div>
		</div>
	</body>
</html>
