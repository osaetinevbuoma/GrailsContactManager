<%@ page import="com.modnsolutions.Contact" %>



<div class="form-group">
	<label for="firstName">
		<g:message code="contact.firstName.label" default="First Name" />
	</label>
	<g:textField name="firstName" class="form-control has-errors" required="required" autofocus="autofocus" value="${contactInstance?.firstName}"/>

</div>

<div class="form-group">
	<label for="middleName">
		<g:message code="contact.middleName.label" default="Middle Name" />
		
	</label>
	<g:textField name="middleName" class="form-control" value="${contactInstance?.middleName}"/>

</div>

<div class="form-group">
	<label for="surname">
		<g:message code="contact.surname.label" default="Surname" />
	</label>
	<g:textField name="surname" class="form-control" required="required" value="${contactInstance?.surname}"/>

</div>

<g:hiddenField name="user" value="${ session.user.id }" />