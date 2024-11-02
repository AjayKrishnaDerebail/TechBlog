<%@ page contentType="text/html;charset=UTF-8"%>
<html>
    <head>
        <title>Registration Page</title>
        <%@include file="common/headerLinks.jsp"%>
    </head>
    <body>
        <%@include file="common/navbar.jsp"%>
        <main class="d-flex align-items-center justify-content-center p-5 primary-background container-background">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-header primary-background text-white">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <p>Login here</p>
                            </div>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/registerServlet" method="post" id="registrationForm">
                                <div class="form-group">
                                    <label for="userName">User Name</label>
                                    <input type="text" name="userName" class="form-control" id="userName" aria-describedby="emailHelp" placeholder="Enter user name">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input type="email" name="userEmail" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" name="userPassword" class="form-control" id="password" placeholder="Password">
                                </div>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label" for="male">
                                        <input type="radio" class="form-check-input" id="male" name="userGender" value="male"> Male
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label" for="female">
                                        <input type="radio" class="form-check-input" id="female" name="userGender" value="female"/> Female
                                    </label>
                                </div>
                                <br>
                                <br>
                                <div class="form-group">
                                    <label>
                                        Tell us about yourself
                                    </label>
                                    <textarea id="kyc" name="userAbout" rows="4" cols="65"></textarea>
                                </div>
                                <br>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" name="userCheck"
                                           id="termsAndConditions">
                                    <label class="form-check-label" for="termsAndConditions">
                                        Terms and conditions
                                    </label>
                                </div>
                                <div class="container text-center display-none" id="loader">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>please wait</h4>
                                </div>
                                <br>
                                <button type="submit" id="submit-btn" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                        <div class="card-footer"></div>
                    </div>
                </div>
            </div>
        </main>
        <script>
            const contextPath = "${pageContext.request.contextPath}";
        </script>
        <%@include file="common/scriptLinks.jsp"%>
    </body>
</html>
