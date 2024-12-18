<nav class="navbar navbar-expand-lg navbar-dark navbar-background">
    <a href="${pageContext.request.contextPath}/templates/index.jsp" class="navbar-brand" href="#">
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
                <a class="nav-link" href="#">
                    <span class="fa fa-address-book-o"></span>Contact us
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/templates/login.jsp"><span
                        class="fa fa-user-circle"></span> Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/templates/register.jsp"><span
                        class="fa fa-registered"></span> Register</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search"
                   aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>