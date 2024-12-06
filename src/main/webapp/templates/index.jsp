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
                            <h5 class="card-title">Java Basics</h5>
                            <p class="card-text">
                                Java is a versatile, high-performance programming language known for its platform independence. Learn the key concepts of Object-Oriented Programming (OOP) such as inheritance, encapsulation, and polymorphism. Develop strong coding foundations by exploring loops, conditionals, arrays, and methods to create reliable and scalable software applications.
                            </p>
                            <a href="https://docs.oracle.com/javase/tutorial/" target="_blank" class="btn btn-primary">Explore Java Basics</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Spring Framework</h5>
                            <p class="card-text">
                                The Spring Framework is a powerful platform for building enterprise-grade applications. Master Dependency Injection, Aspect-Oriented Programming, and Spring Boot to simplify application configuration and deployment. Gain expertise in creating RESTful APIs, Microservices, and integrating robust security measures using Spring Security.
                            </p>
                            <a href="https://docs.spring.io/spring-framework/docs/current/reference/html/" target="_blank" class="btn btn-primary">Learn Spring Framework</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Data Structures</h5>
                            <p class="card-text">
                                Data structures are essential for efficient problem-solving and algorithm development. Learn about stacks, queues, hash maps, trees, and graphs, and their real-world applications. Enhance your algorithmic thinking to tackle coding challenges like sorting, searching, and dynamic programming effectively.
                            </p>
                            <a href="https://docs.oracle.com/javase/8/docs/api/java/util/package-summary.html" target="_blank" class="btn btn-primary">Study Data Structures</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Frontend Development</h5>
                            <p class="card-text">
                                Explore the foundations of modern web design by mastering HTML for structure, CSS for styling, and JavaScript for interactivity. Learn how to build responsive layouts using frameworks like Bootstrap and TailwindCSS. Dive into libraries like React or Angular to create dynamic, single-page applications (SPAs).
                            </p>
                            <a href="https://developer.mozilla.org/en-US/docs/Learn" target="_blank" class="btn btn-primary">Learn Frontend Development</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Database Management</h5>
                            <p class="card-text">
                                Effective database management is crucial for handling and organizing data. Understand the differences between relational (SQL) and non-relational (NoSQL) databases. Learn advanced querying techniques, data indexing, normalization, and optimization strategies to ensure high performance in data-intensive applications.
                            </p>
                            <a href="https://dev.mysql.com/doc/" target="_blank" class="btn btn-primary">Explore Databases</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">DevOps Practices</h5>
                            <p class="card-text">
                                DevOps bridges the gap between development and operations. Learn CI/CD pipeline automation with tools like Jenkins and GitHub Actions. Manage containers with Docker and orchestrate services using Kubernetes. Master monitoring with Prometheus and Grafana to ensure reliable and scalable deployments.
                            </p>
                            <a href="https://kubernetes.io/docs/" target="_blank" class="btn btn-primary">Master DevOps</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="common/scriptLinks.jsp"%>
    </body>
</html>