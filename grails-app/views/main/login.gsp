<%@ page import="com.modnsolutions.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>

<div class="row" role="main">
    <div class="col-lg-3"></div>
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
    <div class="col-lg-3"></div>
</div>
</body>
</html>