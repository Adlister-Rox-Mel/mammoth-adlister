<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Update your profile!" />
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

        #choose-img {
            margin-bottom: 15px;
            margin-top: 20px;
        }

        #imgs {
            height: 125px;
            border: 1px solid black;
            margin-top: 0;
            margin-bottom: 15px;
            display: none;
        }
    </style>
</head>
<body>
<jsp:include page="partials/navbar.jsp" />
<div class="container">
    <h1>Update your information.</h1>
    <form action="/profile/update" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text" value="${user.username}">
        </div>

        <input type="hidden" id="user_id" name="user_id" value="${user.id}">
        <input type="hidden" id="url" name="url" value="${user.url}">
        <input id="choose-img" type="file" onchange="imgchange(event)" />
        <img id="imgs" src="../../img/${user.url}" />

        <div class="form-group">
            <label for="email">Email</label>
            <input id="email" name="email" class="form-control" type="text" value="${user.email}">
        </div>
        <div class="form-group">
            <label for="phone">Phone Number</label>
            <input id="phone" name="phone" class="form-control" type="text" value="${user.phone}">
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
        <input type="submit" class="btn btn-default btn-block">
    </form>
</div>
<jsp:include page="/WEB-INF/partials/bottom.jsp"/>
<script>
    function imgchange(event){
        $("#imgs").attr('src',URL.createObjectURL(event.target.files[0])).fadeIn();
        $('#url').val(event.target.files[0].name);
    }
</script>
</body>
</html>
