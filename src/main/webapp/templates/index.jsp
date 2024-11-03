<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>TechBlog</title>
        <%@include file="common/headerLinks.jsp"%>
    </head>
    <%--Banner--%>
    <body>
        <%@include file="common/navbar.jsp"%>
        <div class="container-fluid p-0 m-0 container-background">
            <div class="jumbotron primary-background text-white">
                <div class="container">
                    <h3 class="display-3">Welcome to techblog</h3>
                    <p>A programming language is a set of rules that programmers use to communicate
                       with computers by writing instructions to perform tasks</p>
                    <p>Programming languages are the foundation of software development. They are
                       used to write instructions that computers can understand and execute.
                       Programming languages are important because they allow developers to create
                       software that can solve complex problems, automate tasks, and improve
                       efficiency.</p>
                    <button type="button" class="btn btn-outline-light btn-lg"><span
                            class="fa fa-external-link"></span> Learn More
                    </button>
                    <a href="${pageContext.request.contextPath}/templates/login.jsp"
                       class="btn btn-outline-light btn-lg">
                        <span class="fa fa-user-circle"></span> Login
                    </a>
                    <a href="${pageContext.request.contextPath}/templates/register.jsp"
                       class="btn btn-outline-light btn-lg">
                        <span class="fa fa-registered"></span> Register
                    </a>
                </div>
            </div>
        </div>

        <%--Cards--%>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java</h5>
                            <p class="card-text">Some quick example text to build on the card title
                                                 and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Click to learn java</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java</h5>
                            <p class="card-text">Some quick example text to build on the card title
                                                 and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Click to learn java</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java</h5>
                            <p class="card-text">Some quick example text to build on the card title
                                                 and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Click to learn java</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java</h5>
                            <p class="card-text">Some quick example text to build on the card title
                                                 and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Click to learn java</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java</h5>
                            <p class="card-text">Some quick example text to build on the card title
                                                 and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Click to learn java</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java</h5>
                            <p class="card-text">Some quick example text to build on the card title
                                                 and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Click to learn java</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="common/scriptLinks.jsp"%>
    </body>
</html>