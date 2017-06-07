<%--
  Created by IntelliJ IDEA.
  User: roxana
  Date: 6/7/17
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="partials/style.jsp">
</head>
<body>
    <%@include file="partials/navbar.jsp"%>
    <div class="container">
    <form method="post" action="login.jsp">
        <div class="form-group">
            <label for="user">username</label>
            <input type="text" class="form-control" name="user" id="user" placeholder="username">
        </div>
        <div class="form-group">
            <label for="pass">Password</label>
            <input type="password" class="form-control" name="pass" id="pass" placeholder="Password">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
    </form>
    </div>

    <c:if test="${param.user == 'admin' && param.pass == 'password'}">
        <c:redirect url="profile.jsp"/>
    </c:if>

</body>
</html>
