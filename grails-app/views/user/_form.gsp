<%@ page import="com.modnsolutions.User" %>



<div class="form-group has-errors">
	<label for="firstName">
		<g:message code="user.firstName.label" default="First Name" />
	</label>
	<g:textField name="firstName" required="required" autofocus="autofocus" class="form-control" value="${userInstance?.firstName}"/>

</div>

<div class="form-group has-errors">
	<label for="surname">
		<g:message code="user.surname.label" default="Surname" />
	</label>
	<g:textField name="surname" required="required" class="form-control" value="${userInstance?.surname}"/>

</div>

<div class="form-group has-errors">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
	</label>
	<g:textField name="username" required="required" class="form-control" value="${userInstance?.username}"/>

</div>

