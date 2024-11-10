<%@ page import="com.techblog.repositories.PostDao" %>
<%@ page import="com.techblog.entities.Post" %>
<%@ page import="java.util.List" %>
<div class="row">
    <%
        PostDao postDao = new PostDao();
        List<Post> posts = postDao.getAllPosts();
        for(Post post : posts) {
    %>
        <div class="col-md-6 mt-4 primary-background">
            <div class="card">
                <img class="card-img-top" src="${pageContext.request.contextPath}/images/<%= post.getPostPic() %>" alt="post.getPostPic()">
                <div class="card-body">
                    <b class="card-title"><%= post.getPostTitle() %></b>
                    <p class="card-text"><%= post.getPostContent() %></p>
                    <pre><%= post.getPostCode() %></pre>
                </div>
            </div>
        </div>
    <%
        }
    %>
</div>
