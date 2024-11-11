<%@ page import="com.techblog.entities.User" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" %>
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
        <%@include file="common/loginNavbar.jsp"%>

        <main>
            <div class="container">
                <div class="row">
                    <%--Categories--%>
                    <div class="col-md-4">
                        <div class="list-group mt-4">
                            <a href="#" class="list-group-item list-group-item-action" style="background-color:limegreen">
                                Categories
                            </a>
                            <a href="#" onclick="loadPosts(0,this)"
                               class="list-group-item list-group-item-action c-link"><span
                                    class="fa fa-asterisk"></span> All posts</a>
                            <%
                                for(Category category : categories) {
                            %>
                            <a href="#" onclick="loadPosts(<%= category.getCategoryId()%>,this)"
                               class="list-group-item list-group-item-action c-link"><%= category.getCategoryName() %>
                            </a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <%--Posts--%>
                    <div class="col-md-8">
                        <div class="container text-center" id="loaderPosts">
                            <span class="fa fa-refresh fa-spin fa-4x"></span>
                            <h3 class="mt-2">Loading...</h3>
                        </div>
                        <div class="container-fluid" id="postsContainer"></div>
                    </div>
                </div>
            </div>
        </main>

        <%@include file="common/scriptLinks.jsp"%>
    </body>
</html>