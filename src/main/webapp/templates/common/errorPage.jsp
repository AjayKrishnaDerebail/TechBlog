<%@ page isErrorPage="true" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Error Page</title>
        <%@include file="headerLinks.jsp"%>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container text-center">
            <img src="../../images/computer.png" alt="Computer" class="img-fluid">
            <h3>Something went wrong</h3>
            <%= exception %>
            <a href="../../templates/index.jsp"
               class="btn primary-background btn-lg text-white mt-3">Go Back</a>
        </div>
    </body>
</html>