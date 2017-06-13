<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: roxana
  Date: 6/12/17
  Time: 9:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Ad show page"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>;
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <c:out value="${ad.title}"/>
        </div>
        <div class="panel-body">
            <c:out value="${ad.description}"/>
        </div>
        <table class="table">
            <tr>
                <th>User Id</th>
                <th>Username</th>
                <th>Email</th>
            </tr>
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.username}"/></td>
                <td><c:out value="${user.email}"/></td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
