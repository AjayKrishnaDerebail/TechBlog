<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header primary-background text-white">
                <h5 class="modal-title" id="exampleModalLabel">User details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <img src="${pageContext.request.contextPath}/images/<%= user.getProfileImage()%>"
                         alt=<%= user.getProfileImage() %> class="img-fluid">
                    <h5 class="modal-title" id="userNameInModal"><%= user.getUsername() %></h5>
                    <div id="profile-details">
                        <table class="table">
                            <tbody>
                            <tr>
                                <td>Id</td>
                                <td><%= user.getId() %>
                                </td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td><%= user.getEmail() %>
                                </td>
                            </tr>
                            <tr>
                                <td>Gender</td>
                                <td><%= user.getGender() %>
                                </td>
                            </tr>
                            <tr>
                                <td>About</td>
                                <td><%= user.getAbout() %>
                                </td>
                            </tr>
                            <tr>
                                <td>Registered date</td>
                                <td><%= user.getTimestamp() %>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="profile-edit" class="display-none">
                        <h2>Edit profile</h2>
                        <form action="${pageContext.request.contextPath}/editProfileServlet" method="post" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <td>Id:</td>
                                    <td> <%= user.getId() %></td>
                                </tr>
                                <tr>
                                    <td>Email:</td>
                                    <td><input type="email" name="userEmail" class="form-control"
                                               value="<%= user.getEmail() %>"></td>
                                </tr>
                                <tr>
                                    <td>Name:</td>
                                    <td><input type="text" name="userName" class="form-control"
                                               value="<%= user.getUsername() %>"></td>
                                </tr>
                                <tr>
                                    <td>Password:</td>
                                    <td><input type="password" name="userPassword" class="form-control"
                                               value="<%= user.getPassword() %>"></td>
                                </tr>
                                <tr>
                                    <td>Gender:</td>
                                    <td>
                                        <input type="radio" name="userGender"
                                               value="male" <%= user.getGender().equals("male") ? "checked" : "" %>>
                                        Male
                                        <input type="radio" name="userGender"
                                               value="female" <%= user.getGender().equals("female") ? "checked" : "" %>>
                                        Female
                                    </td>
                                </tr>
                                <tr>
                                    <td>About:</td>
                                    <td><textarea name="userAbout" class="form-control"
                                                  rows="4" cols="50"><%= user.getAbout() %></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Profile pic</td>
                                    <td><input type="file" name="userProfileImage" class="form-control"></td>
                                </tr>
                            </table>
                            <div class="container">
                                <button type="submit" class="btn btn-outline-primary">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
            </div>
        </div>
    </div>
</div>