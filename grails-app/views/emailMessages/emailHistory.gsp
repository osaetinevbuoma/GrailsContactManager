<!DOCTYPE html>
<html xmlns:g="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main">
    <title>Email Message History</title>
</head>
<body>
<g:render template="../layouts/nav" />

<div class="row">
    <h1>Email History: ${ emailAddress.contact.firstName } [${ emailAddress.email }]</h1> <hr />

    <div class="row">
        <div class="col-lg-6">
            <g:each in="${ messageInstanceList }" var="messageInstance">
                <div>
                    <label>Sent: </label> ${ formatDate(date: messageInstance.dateCreated, format: "dd/MM/yyyy") } <br />
                    <div>${ messageInstance.message }</div>
                </div>

                <hr />
            </g:each>

            <g:link controller="contact" action="show" id="${ emailAddress.contact.id }" class="btn btn-primary">Close</g:link>
        </div>
    </div>
</div>
</body>
</html>
