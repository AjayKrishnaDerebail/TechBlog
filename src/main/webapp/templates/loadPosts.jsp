<%@ page import="com.techblog.repositories.PostDao" %>
<%@ page import="com.techblog.entities.Post" %>
<%@ page import="java.util.List" %>
<div class="row">
    <%
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
                <img class="card-img-top" src="${pageContext.request.contextPath}/images/<%= post.getPostPic() %>" alt="post.getPostPic()">
                <div class="card-body">
                    <%= categoryId %>
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
