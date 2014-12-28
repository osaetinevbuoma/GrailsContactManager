<div class="row">
	<g:if test="${ flash.errors }">
		<div class="alert alert-danger">${ flash.errors }</div>
	</g:if>

	<g:if test="${ contactInstance?.phoneNumbers }">
	<div class="col-lg-6">
		<h4>Phone Numbers</h4>

		<table class="table table-responsive table-striped table-hover">
			<tbody>
				<g:each in="${ contactInstance?.phoneNumbers? }" var="phoneNumber">
				<tr>
					<td>${ phoneNumber.encodeAsHTML() }</td>
					<td>
						<g:link action="editPhoneNumber" id="${ phoneNumber.id }">
							Edit <span class="glyphicon glyphicon-edit"></span>
						</g:link>
					</td>
					<td>
						<!--
						Same problem as with delete email
						<g:form action="deletePhoneNumber" resource="${ phoneNumber }" method="DELETE">
							<g:actionSubmit class="text-danger" value="Delete" onclick="return confirm('Are you sure?');" />
						</g:form>-->
						<g:link action="deletePhoneNumber" id="${ phoneNumber.id }" class="text-danger">
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
		<h4>Add Phone Numbers</h4>
		<em>Values marked with * are compulsory</em>
	
		<g:form url="[resource: phoneNumber, action: 'createPhoneNumber']" method="POST">
			<div class="form-group">
				<label><em>(Country Code*, Area Code, Number*, Extension)</em></label> <br />
				<input type="number" value="0" name="countryCode" style="width:70px;" required title="Country Code" />
				<input type="number" value="0" name="areaCode" style="width:70px;" title="Area Code" />
				<input type="number" value="0" name="phoneNumber" style="width:170px;" required title="Number" />
				<input type="number" value="0" name="extension" style="width:70px;" title="Extension" />
			</div>
			<g:submitButton name="createPhoneNumber" class="btn btn-primary btn-sm" value="Add" />
			<g:hiddenField name="contact" value="${ contactInstance.id }" />
		</g:form>
	</div>
</div>