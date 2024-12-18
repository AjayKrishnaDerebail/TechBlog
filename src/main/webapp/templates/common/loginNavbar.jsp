<%@ page import="com.techblog.entities.Message" %>
<nav class="navbar navbar-expand-lg navbar-dark navbar-background text-white">
    <a href="${pageContext.request.contextPath}/templates/profile.jsp" class="navbar-brand">
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
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#addPostModal">
                    <span class="fa fa-asterisk" ></span> Post a blog
                </a>
            </li>
        </ul>
        <ul class="navbar na mr-right list-unstyled">
            <li class="nav-item">
                <a class="nav-link text-white" href="#" data-toggle="modal" data-target="#userModal">
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

<%
    Message message=(Message) session.getAttribute("message");
    if(Objects.nonNull(message)){
%>
<div class="alert <%= message.getCssClass()%>" role="alert">
    <%= message.getContent()%>
</div>
<%
        session.removeAttribute("message");
    }
%>


<%@include file="showProfileAndEditProfile.jsp"%>
<%@include file="postmodal.jsp"%>