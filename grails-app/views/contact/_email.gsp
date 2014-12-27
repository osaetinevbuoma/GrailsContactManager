<div class="row" xmlns:g="http://www.w3.org/1999/html">
	<g:if test="${ flash.message }">
	<div class="alert alert-success">${ flash.message }</div>
	</g:if>

	<g:if test="${ contactInstance?.emailAddresses }">
	<div class="col-lg-6">
		<table class="table table-responsive table-hover">
			<tbody>
				<g:each in="${ contactInstance?.emailAddresses? }" var="emailAddress">
				<tr>
					<td>${ emailAddress.encodeAsHTML() }</td>
					<td>
						<g:link action="editEmail" id="${ emailAddress.id }">
							Edit <span class="glyphicon glyphicon-edit"></span>
						</g:link>
					</td>
					<td>
						<!--
						For some reason form action was being render as '/ContactManager/email/deleteEmail' instead of '/ContactManager/contact/deleteEmail'
						 Therefor I'm using a delete link instead which will change the 'deleteEmail' action to a 'GET' method
						<g:form url="[resource:emailAddress, controller:'contact', action:'deleteEmail']" method="DELETE">
							<g:submitButton name="deleteEmail" class="text-danger" value="Delete" onclick="return confirm('Are you sure?');" />
						</g:form>-->
						<g:link action="deleteEmail" id="${ emailAddress.id }" class="text-danger" onclick="return confirm('Are you sure?');">
							Delete <span class="glyphicon glyphicon-trash"></span>
						</g:link>
					</td>
				</tr>
				</g:each>
			</tbody>
		</table>
	</div>
	</g:if>
	<div class="col-lg-6">
		<h4>Add Email Addresses</h4>

		<g:form url="[resource:emailAddressesInstance, action:'createEmail']">
			<div class="form-group">
				<input type="email" placeholder="Email Address" name="email" class="form-control" required />
			</div>
			<g:submitButton name="createEmail" class="btn btn-primary btn-sm" value="Add" />
			<g:hiddenField name="contact" value="${ contactInstance.id }" />
		</g:form>
	</div>
</div>