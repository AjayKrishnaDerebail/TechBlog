<%@ page import="com.techblog.entities.User" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.techblog.entities.Post" %>
<%@ page import="com.techblog.repositories.UserDao" %>
<%@ page import="com.techblog.repositories.ConnectionProvider" %>
<%@ page import="java.text.DateFormat" %>
<%@page errorPage="common/errorPage.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if(Objects.isNull(user)){
        response.sendRedirect(request.getContextPath() + "/templates/login.jsp");
    }

    int postId = Integer.parseInt(request.getParameter("postId"));

    PostDao postDaoInShowBlogPage = new PostDao();
    Post post = postDaoInShowBlogPage.getPostByPostId(postId);

    UserDao userDao = new UserDao(ConnectionProvider.getConnection());
    user = userDao.getUserById(post.getUserId());

%>

<html>
    <head>
        <title><%=post.getPostTitle()%></title>
        <%@include file="common/headerLinks.jsp"%>
    </head>
    <body>
    <%@include file="common/loginNavbar.jsp"%>

        <main class="body-background">
            <h1>Post id is : <%=postId%> </h1>
            <div class="container my-4">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header primary-background text-white">
                                <h4 class="post-title"><%=post.getPostTitle()%></h4>
                            </div>
                            <br>
                            <div class="card-body">
                                <img class="card-img-top fixed-size-img" alt="<%= post.getPostPic()%>"
                                     src="${pageContext.request.contextPath}/images/<%= post.getPostPic() %>" />
                                <br>
                                <br>
                                <div class="row container-user-info">
                                    <div class="col-md-8">
                                        <p class="post-user-info"><a href="#"><%= user.getUsername() %> </a>has posted  </p>
                                    </div>
                                    <div class="col-md-4 no-wrap mr-4">
                                        <p class="post-date"><%= DateFormat.getDateTimeInstance().format(post.getPostDate()) %></p>
                                    </div>
                                </div>

                                <p class="post-content"><%=post.getPostContent()%></p>
                                <div class="post-code">
                                    <pre><%= post.getPostCode() %></pre>
                                </div>
                            </div>
                            <div class="card-footer primary-background text-white text-right">
                                <a href="#" class="btn btn-outline-light btn-sm mr-2">
                                    <i class="fa fa-thumbs-o-up"></i>
                                    <span class="like-counter">20</span>
                                </a>
                                <a href="#" class="btn btn-outline-light btn-sm mr-0">
                                    <i class="fa fa-commenting-o"></i> <span>20</span>  </a>
                            <%--<a href="editPost.jsp?postId=<%=post.getPostId()%>" class="btn btn-primary">Edit</a>
                                <a href="deletePost.jsp?postId=<%=post.getPostId()%>" class="btn btn-danger">Delete</a>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <%@include file="common/scriptLinks.jsp"%>
    </body>
</html>
