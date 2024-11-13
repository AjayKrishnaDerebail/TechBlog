<%@ page import="com.techblog.entities.User" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.techblog.entities.Post" %>
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

%>

<html>
    <head>
        <title><%=post.getPostTitle()%></title>
        <%@include file="common/headerLinks.jsp"%>
    </head>
    <body>
    <%@include file="common/loginNavbar.jsp"%>

        <main>
            <h1>Post id is : <%=postId%> </h1>
            <div class="container my-4">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header">
                                <h4><%=post.getPostTitle()%></h4>
                                <img class="card-img-top fixed-size-img" alt="<%= post.getPostPic()%>"
                                     src="${pageContext.request.contextPath}/images/<%= post.getPostPic() %>" />
                            </div>
                            <div class="card-body">
                                <p><%=post.getPostContent()%></p>
                                <pre><%= post.getPostCode() %></pre>
                            </div>
                            <div class="card-footer primary-background text-white text-right">
                                <a href="#!" class="btn btn-outline-light btn-sm mr-2">
                                    <i class="fa fa-thumbs-o-up"></i>
                                    <span class="like-counter">20</span>
                                </a>

                                <a href="showBlog.jsp?postId=<%= post.getPostId() %>"
                                   class="btn btn-outline-light btn-sm mr-2">Read More...</a>
                                <a href="#!" class="btn btn-outline-light btn-sm mr-0">
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
