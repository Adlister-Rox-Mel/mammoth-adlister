<%--
  Created by IntelliJ IDEA.
  User: roxana
  Date: 6/8/17
  Time: 9:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Index</title>
</head>
<body>
<ul>
    <c:forEach var="ad" items="${ads}">
        <li>${ad.title}</li>
    </c:forEach>
</ul>

</body>
</html>
