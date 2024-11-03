<nav class="navbar navbar-expand-lg navbar-dark navbar-background text-white">
    <a href="${pageContext.request.contextPath}/templates/index.jsp" class="navbar-brand">
        <span class="fa fa-area-chart"></span> Techblog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#"><span class="fa fa-asl-interpreting"></span> Home <span
                        class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                   data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-american-sign-language-interpreting"></span>
                    Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Programming languages</a>
                    <a class="dropdown-item" href="#">Project implementation</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">DSA</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span> Contact us</a>
            </li>
        </ul>
        <ul class="navbar na mr-right list-unstyled">
            <li class="nav-item">
                <a class="nav-link text-white" href="#!" data-toggle="modal" data-target="#userModal">
                    <span class="fa fa-user-plus"></span>
                    <%= user.getUsername() %>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link"
                   href="${pageContext.request.contextPath}/logoutServlet">
                    <span class="fa fa-user-circle text-white"> Logout</span>
                </a>
            </li>
        </ul>
    </div>
</nav>

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
                    <img src="${pageContext.request.contextPath}/images/<%= user.getProfile()%>"
                         alt="Computer" class="img-fluid width-50percent">
                    <h5 class="modal-title" id="userNameInModal"><%= user.getUsername() %></h5>
                    <table class="table">
                        <tbody>
                        <tr>
                            <td>Id</td>
                            <td><%= user.getId() %></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><%= user.getEmail() %></td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td><%= user.getGender() %></td>
                        </tr>
                        <tr>
                            <td>About</td>
                            <td><%= user.getAbout() %></td>
                        </tr>
                        <tr>
                            <td>Registered date</td>
                            <td><%= user.getTimestamp() %></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Edit</button>
            </div>
        </div>
    </div>
</div>