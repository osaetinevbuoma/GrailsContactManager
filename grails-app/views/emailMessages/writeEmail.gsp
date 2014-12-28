<!DOCTYPE html>
<html xmlns:g="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main">
    <title>Write Email Message</title>
</head>
<body>
<g:render template="../layouts/nav" />

<div>
    <h1>Write Email to ${ emailAddress.contact.firstName } [${ emailAddress.email }]</h1> <hr />

    <div class="row">
        <div class="col-lg-6">
            <g:if test="${flash.success}">
                <div class="alert alert-success">${flash.success}</div>
            </g:if>

            <g:if test="${flash.error}">
                <div class="alert alert-danger">${flash.error}</div>
            </g:if>

            <g:form action="sendEmail" method="POST">
                <div class="form-group">
                    <label>To:</label>
                    ${ emailAddress.email }
                </div>
                <div class="form-group">
                    <g:textArea name="message" class="form-control" rows="10" placeholder="Enter your message" />
                </div>
                <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                &nbsp;
                <g:link controller="contact" action="show" id="${ emailAddress.contact.id }" class="btn btn-primary">Cancel</g:link>
                <g:hiddenField name="id" value="${emailAddress.id}" />
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
