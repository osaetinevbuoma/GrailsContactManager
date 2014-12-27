
<%@ page import="com.modnsolutions.PhoneNumber" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Edit Phone Number</title>
</head>
<body>
<g:render template="../layouts/nav" />

<div class="row" role="main">
    <div class="col-lg-6">
        <h1>${ phoneNumberInstance?.contact?.firstName } ${ phoneNumberInstance?.contact?.middleName } ${ phoneNumberInstance?.contact?.surname }</h1>

        <h4>Edit Phone Number</h4>
        <em>Values marked with * are compulsory</em>

        <g:form url="[resource:phoneNumber, action:'updatePhoneNumber']" method="PUT">
            <div class="form-group">
                <label><em>(Country Code*, Area Code, Number*, Extension)</em></label> <br />
                <input type="number" value="${ phoneNumberInstance?.countryCode }" name="countryCode" style="width:70px;" required title="Country Code" />
                <input type="number" value="${ phoneNumberInstance?.areaCode }" name="areaCode" style="width:70px;" title="Area Code" />
                <input type="number" value="${ phoneNumberInstance?.phoneNumber }" name="phoneNumber" style="width:170px;" required title="Number" />
                <input type="number" value="${ phoneNumberInstance?.extension }" name="extension" style="width:70px;" title="Extension" />
            </div>
            <g:submitButton name="editPhoneNumber" class="btn btn-primary" value="Update" />
            &nbsp;
            <g:link action="show" id="${ phoneNumberInstance?.contact?.id }" class="btn btn-primary">Cancel</g:link>
            <g:hiddenField name="id" value="${ phoneNumberInstance?.id }" />
        </g:form>
    </div>
</div>
</body>
</html>
