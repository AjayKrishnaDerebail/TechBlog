<%@ page import="com.techblog.repositories.PostDao" %>
<%@ page import="com.techblog.entities.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="com.techblog.repositories.ConnectionProvider" %>
<%@ page import="com.techblog.repositories.LikeDao" %>
<%@ page import="com.techblog.entities.User" %>
<div class="row">
    <%
        User userInSession=(User)session.getAttribute("currentUser");

        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        PostDao postDao = new PostDao();
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        List<Post> posts;
        if(categoryId==0){
            posts = postDao.getAllPosts();
        }else{
            posts = postDao.getPostsByCategoryId(categoryId);
        }

        if(posts.isEmpty()){
            out.println("<h3 class=\"mt-3\">No posts found in this category</h3>");
        }

        for(Post post : posts) {
    %>
        <div class="col-md-6 mt-4">
            <div class="card">
                <img class="card-img-top fixed-size-img"
                     src="${pageContext.request.contextPath}/images/<%= post.getPostPic() %>"
                     alt="Post Image">
                <div class="card-body">
                    <b class="card-title"><%= post.getPostTitle() %></b>
                    <p class="card-text"><%= post.getPostContent() %></p>
                </div>

                <%
                    LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
                %>

                <div class="card-footer primary-background text-center">

                    <%
                        boolean isLiked = likeDao.isLikedByUser(post.getPostId(), userInSession.getId());
                    %>
                    <a
                        id="like-btn-<%= post.getPostId() %>"
                        href="#"
                        onclick="<%= isLiked ? "doDislike(" + post.getPostId() + ", " + userInSession.getId() + ")"
                        : "doLike(" + post.getPostId() + ", " + userInSession.getId() + ")" %>"
                        class="<%= isLiked ? "btn btn-success btn-sm mr-2"
                        : "btn btn-outline-light btn-sm mr-2" %>">
                        <i class="<%= isLiked ? "fa fa-thumbs-up" : "fa fa-thumbs-o-up" %>"></i>
                        <span id="like-counter-<%= post.getPostId() %>" class="like-counter">
                            <%= likeDao.countLikeOnPost(post.getPostId()) %>
                        </span>
                    </a>
                    <a href="showBlog.jsp?postId=<%= post.getPostId() %>"
                       class="btn btn-outline-light btn-sm">Read More...</a>
                </div>
            </div>
        </div>
    <%
        }
    %>
</div>
