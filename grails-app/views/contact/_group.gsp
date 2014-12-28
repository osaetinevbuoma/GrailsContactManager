<%@ page import="com.modnsolutions.Groups" %>

<div class="row" xmlns:g="http://www.w3.org/1999/html">
    <g:if test="${ flash.errors }">
        <div class="alert alert-danger">${ flash.errors }</div>
    </g:if>

    <g:if test="${ contactInstance?.groups }">
        <div class="col-lg-6">
            <h4>Groups</h4>

            <table class="table table-responsive table-striped table-hover">
                <tbody>
                <g:each in="${ contactInstance?.groups? }" var="group">
                    <tr>
                        <td>${ group.encodeAsHTML() }</td>
                        <td>
                            <!--Same problem as with delete email-->
                            <g:form action="removeFromGroup" method="DELETE">
                                <g:submitButton name="removeFromGroup" class="text-danger" value="Delete" onclick="return confirm('Are you sure?');" />
                                <g:hiddenField name="group" value="${ group.id }" />
                                <g:hiddenField name="id" value="${ contactInstance.id }" />
                            </g:form>
                            <!--<g:link action="removeFromGroup" id="${ group.id }" class="text-danger">
                                Delete <span class="glyphicon glyphicon-trash"></span>
                            </g:link>-->
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </g:if>



    <div class="col-lg-6">
        <h4>Add To Groups</h4>
        <em>Select one or more groups</em>

        <g:form action="addToGroups" method="POST">
            <div class="form-group">
                <g:select name="groups" from="${ Groups.list() }" multiple="multiple" optionKey="id" value="${ contactInstance?.groups*.id }" class="form-control" required="required" />
            </div>
            <g:submitButton name="addToGroups" class="btn btn-primary btn-sm" value="Add" />
            <g:hiddenField name="id" value="${ contactInstance.id }" />
        </g:form>
    </div>
</div>