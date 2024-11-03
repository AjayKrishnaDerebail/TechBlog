<%@ page import="com.techblog.entities.Message" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Login Page</title>
        <%@include file="common/headerLinks.jsp"%>
    </head>
    <body>
        <%@include file="common/navbar.jsp"%>
        <main class="d-flex align-items-center justify-content-center height-90vh primary-background container-background pb-100px">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header primary-background text-white">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <p>Login here</p>
                            </div>
                            <%
                                Message message=(Message) session.getAttribute("message");
                                if(Objects.nonNull(message)){
                            %>
                            <div class="alert <%= message.getCssClass()%>" role="alert">
                                <%= message.getContent()%>
                            </div>
                            <%
                                    session.removeAttribute("message");
                                }
                            %>
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/loginServlet" method="post" id="loginForm">
                                    <div class="form-group">
                                        <label for="email">Email address</label>
                                        <input type="email" name="email" class="form-control" required
                                               id="email" aria-describedby="emailHelp"
                                               placeholder="Enter email">
                                    </div>
                                    <div class="form-group">
                                        <label for="userPassword">Password</label>
                                        <input type="password" name="userPassword" class="form-control" required
                                               id="userPassword" placeholder="Password">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </form>
                            </div>
                            <div class="card-footer">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>

            </div>
        </main>

        <%@include file="common/scriptLinks.jsp"%>
    </body>
</html>