<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: melodytempleton
  Date: 6/14/17
  Time: 1:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
div class="container">
<div class="panel panel-default">
    <div class="panel-heading">
     <input type="text" value=<c:out value="${ad.title}"/>>
    </div>
    <div class="panel-body">
        <input type="text" value=  <c:out value="${ad.description}"/>>
    </div>
</div>
</div>
<div id="deleteButton" type="submit" class="btn btn-danger">
    <a  href="/delete?ad_id=${ad.id}">
        <h4 id="#delete">Delete Ad</h4>
    </a>
</div>

<jsp:include page="/WEB-INF/partials/bottom.jsp"/>
</body>
</html>
