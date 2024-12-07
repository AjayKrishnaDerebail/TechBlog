<%@ page import="com.techblog.entities.User" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.techblog.entities.Post" %>
<%@ page import="com.techblog.repositories.UserDao" %>
<%@ page import="com.techblog.repositories.ConnectionProvider" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="com.techblog.repositories.LikeDao" %>
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
    User userWhoHasPostedThisPost = userDao.getUserById(post.getUserId());

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
                                        <p class="post-user-info"><a href="#"><%= userWhoHasPostedThisPost.getUsername() %> </a>has posted  </p>
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

                            <%
                                LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
                            %>

                            <div class="card-footer primary-background text-white text-right">
                                <%
                                    boolean isLiked = likeDao.isLikedByUser(post.getPostId(), user.getId());
                                %>
                                <a
                                    id="like-btn-<%= post.getPostId() %>"
                                    href="#"
                                    onclick="<%= isLiked ? "doDislike(" + post.getPostId() + ", " + user.getId() + ")"
                                    : "doLike(" + post.getPostId() + ", " + user.getId() + ")" %>"
                                    class="<%= isLiked ? "btn btn-success btn-sm mr-2"
                                    : "btn btn-outline-light btn-sm mr-2" %>">
                                    <i class="<%= isLiked ? "fa fa-thumbs-up" : "fa fa-thumbs-o-up" %>"></i>
                                    <span id="like-counter-<%= post.getPostId() %>" class="like-counter">
                                        <%= likeDao.countLikeOnPost(post.getPostId()) %>
                                    </span>
                                </a>
                                <% if(user.getId() == post.getUserId()) { %>
                                    <a href="deletePost.jsp?postId=<%=post.getPostId()%>" class="btn btn-danger">Delete</a>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-right">
                <a href="${pageContext.request.contextPath}/templates/profile.jsp"
                   class="btn btn-danger btn-lg text-white ml-auto">Go Back</a>
            </div>
        </main>
    <%@include file="common/scriptLinks.jsp"%>
    </body>
</html>
