<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
    <style>
        .btn-default {
            background-color: #284967;
            color: #ffffff;
            font-weight: bold;
            font-size: 15px;
        }

        label {
            font-size: 17px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>
        <c:if test="${inputIsEmpty}">
            <div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <strong>Empty input! </strong> Fill in all and try submitting again.
            </div>
        </c:if>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" value="${invalidUser.username}">
            </div>
            <c:if test="${usernameExists}">
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>Username already exists! </strong> Choose a different username and try submitting again.
                </div>
            </c:if>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text" value="${invalidUser.email}">
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input id="phone" name="phone" class="form-control" type="text" value="${invalidUser.phone}">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <c:if test="${!passwordMatch}">
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>Password doesn't match! </strong> Please enter your password and try submitting again.
                </div>
            </c:if>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <input type="hidden" id="url" name="url" value="user1.png">
            <input type="submit" class="btn btn-default btn-block">
        </form>
    </div>
    <jsp:include page="/WEB-INF/partials/bottom.jsp"/>
</body>
</html>
