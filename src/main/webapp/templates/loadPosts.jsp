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
            Thread.sleep(1000);
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
                    <a href="#" onclick="doLike(<%= post.getPostId() %>, <%= userInSession.getId() %>)"
                       class="btn btn-outline-light btn-sm mr-2">
                        <i class="fa fa-thumbs-o-up"></i>
                        <span class="like-counter"><%= likeDao.countLikeOnPost(post.getPostId())  %></span>
                    </a>

                    <a href="showBlog.jsp?postId=<%= post.getPostId() %>"
                       class="btn btn-outline-light btn-sm">Read More...</a>
                    <a href="#" class="btn btn-outline-light btn-sm">
                        <i class="fa fa-commenting-o"></i> <span>20</span>  </a>
                </div>
            </div>
        </div>
    <%
        }
    %>
</div>
