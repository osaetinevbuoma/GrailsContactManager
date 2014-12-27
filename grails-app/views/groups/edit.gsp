<%@ page import="com.modnsolutions.Groups" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'group.label', default: 'Group')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:render template="../layouts/nav" />		
		
		<div role="main">
			<h1>Edit Group</h1> <hr />
			
			<div class="row">
				<div class="col-lg-6">						
						<g:form url="[resource:groupsInstance, action:'update']" method="PUT" >
							<g:hiddenField name="version" value="${groupsInstance?.version}" />
							<fieldset class="form">
								<g:render template="form"/>
							</fieldset>
							<fieldset class="buttons">
								<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
								&nbsp;
								<g:link class="btn btn-primary" action="create">Cancel</g:link>
							</fieldset>
						</g:form>					
				</div>
			</div>
		</div>
	</body>
</html>
