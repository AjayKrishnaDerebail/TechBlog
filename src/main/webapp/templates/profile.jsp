<%@ page import="com.techblog.entities.User" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="common/errorPage.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if(Objects.isNull(user)){
        response.sendRedirect("login.jsp");
    }
%>
<html>
    <head>
        <title>Profile</title>
        <%@include file="common/headerLinks.jsp"%>
    </head>
    <body>
        <%= user.getUsername() %>
        <br>
        <%= user.getEmail() %>
    </body>
</html>
