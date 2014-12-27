
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="layout" content="main">
    <link rel="icon" href="../../favicon.ico">

    <title>Grails Contact Manager</title>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
  	<div class="row">
  		<div class="col-lg-1"></div>
  		<div class="col-lg-10">
  			<div class="row">
  				<h2 style="text-align: center;">Grails Contant Manager</h2> <hr />
  				
  				<g:if test="${flash.success}">
					<div class="alert alert-success">${flash.success}</div>
					</g:if>
					
					<g:if test="${flash.error}">
					<div class="alert alert-danger">${flash.error}</div>
					</g:if>
					
  				<div class="col-lg-6">
  					<h3>Please sign in</h3> <hr />
  					<g:form role="form" url="[controller: 'main', action: 'validate']">
  						<div class="form-group">
  							<label>Username</label>
  							<input type="text" class="form-control" name="username" value="" required autofocus />
  						</div>
  						<div class="form-group">
  							<label>Password</label>
  							<input type="password" class="form-control" name="password" required />
  						</div>
  						<button type="submit" class="btn btn-primary btn-sm">Sign In</button>
 					</g:form>
  				</div>
  				<div class="col-lg-6">
  					<h3>Register a user</h3> <hr />
					<g:hasErrors bean="${userInstance}">
					<ul class="alert alert-danger">
						<g:eachError bean="${userInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
					</g:hasErrors>
					
  					<g:form role="form" url="[resource: userInstance, controller: 'main', action: 'register']">
  						<div class="row">
	  						<div class="col-lg-6">
		  						<div class="form-group">
		  							<label>First Name</label>
		  							<input type="text" class="form-control" name="firstName" value="${ userInstance?.firstName }" required />
		  						</div>
	  						</div>
	  						<div class="col-lg-6">
		  						<div class="form-group">
		  							<label>Surname</label>
		  							<input type="text" class="form-control" name="surname" value="${ userInstance?.surname }" required />
		  						</div>
	  						</div>
  						</div>
  						<div class="form-group">
  							<label>Username</label>
  							<input type="text" class="form-control" name="username" value="${ userInstance?.username }" required />
  						</div>
  						<div class="row">
	  						<div class="col-lg-6">
		  						<div class="form-group">
		  							<label>Password</label>
		  							<input type="password" class="form-control" name="password" value="" required />
		  						</div>
	  						</div>
	  						<div class="col-lg-6">
		  						<div class="form-group">
		  							<label>Confirm Password</label>
		  							<input type="password" class="form-control" name="confirm_password" value="" required />
		  						</div>
	  						</div>
  						</div>
  						<button type="submit" class="btn btn-primary btn-sm">Register</button>
  					</g:form>
  				</div>
  			</div>
 		</div>
  		<div class="col-lg-1"></div>
  	</div>
  </body>
</html>

