
<%@ page import="com.modnsolutions.Email" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Edit Email</title>
</head>
<body>
<g:render template="../layouts/nav" />

<div class="row" role="main">
   <div class="col-lg-6">
       <h1>${ emailAddressesInstance?.contact?.firstName } ${ emailAddressesInstance?.contact?.middleName } ${ emailAddressesInstance?.contact?.surname }</h1>

       <h4>Edit Email</h4>

       <g:form url="[resource:email, action:'updateEmail']" method="PUT">
           <div class="form-group">
               <input type="email" placeholder="Email Address" value="${ emailAddressesInstance }" name="email" class="form-control" required="required" />
           </div>
           <g:submitButton name="editEmail" class="btn btn-primary" value="Update" />
           &nbsp;
           <g:link action="show" id="${ emailAddressesInstance?.contact?.id }" class="btn btn-primary">Cancel</g:link>
           <g:hiddenField name="id" value="${ emailAddressesInstance.id }" />
       </g:form>
   </div>
</div>
</body>
</html>
