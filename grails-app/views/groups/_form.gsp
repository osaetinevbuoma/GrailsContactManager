<%@ page import="com.modnsolutions.Groups" %>



<div class="form-group">
	<label for="name">
		<g:message code="groups.name.label" default="Group" />
	</label>
	<g:textField name="name" required="required" autofocus="autofocus" class="form-control" value="${groupsInstance?.name}"/>
	
</div>

<g:hiddenField name="user" value="${ session.user.id }" />