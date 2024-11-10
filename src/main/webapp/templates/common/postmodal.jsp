<%@ page import="com.techblog.repositories.PostDao" %>
<%@ page import="com.techblog.entities.Category" %>
<%@ page import="java.util.ArrayList" %>
<!-- Modal -->
<div class="modal fade" id="addPostModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Provide post details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="addPostServlet" method="post" id="addPostForm">
                    <div class="form-group">
                        <label for="categoryId">Category</label>
                        <select class="form-control" id="categoryId" name="categoryId">
                            <option value="programming" selected disabled>---</option>
                            <%
                                PostDao postDao = new PostDao();
                                ArrayList<Category> categories = postDao.getAllCategories();
                                for (Category category : categories) {
                            %>
                            <option value="<%= category.getCategoryId() %>"><%= category.getCategoryName() %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" class="form-control" id="title" name="postTitle" placeholder="Enter title">
                    </div>
                    <div class="form-group">
                        <label for="description">Content</label>
                        <textarea class="form-control" id="description" name="postContent" rows="3"
                                  placeholder="Enter your content"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="description">Code</label>
                        <textarea class="form-control" id="content" name="postCode" rows="3"
                                  placeholder="Enter program if any"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="description">Select picture</label><br>
                        <input type="file" name="postFile">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    const contextPath = "${pageContext.request.contextPath}";
</script>