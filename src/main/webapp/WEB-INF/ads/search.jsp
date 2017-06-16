<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: roxana
  Date: 6/13/17
  Time: 9:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Here are the Ads!" />
    </jsp:include>
    <style>
    .list-group-item {
    background-color: #284967;
    color: #ffffff;
    }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
    <div class="container">
        <div class="list-group">
            <h3 class="list-group-item">
                Here are the ads!
            </h3>
            <c:forEach var="searchedAd" items="${searchedAds}">
                <a href="/ads/show?ad_id=${searchedAd.id}">
                    <h3><c:out value="${searchedAd.title}"/></h3>
                </a>
            </c:forEach>
        </div>
    </div>
    <jsp:include page="/WEB-INF/partials/bottom.jsp"/>
</body>
</html>
