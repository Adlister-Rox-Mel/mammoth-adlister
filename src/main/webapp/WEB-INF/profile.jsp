<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, <c:out value="${sessionScope.user.getUsername()}"/>!</h1>
        <div class="list-group">
            <h3 class="list-group-item active">
                Here are yours ads!
            </h3>
            <c:forEach var="ad" items="${myAds}">
                <a href="/ads/show?ad_id=${ad.id}">
                    <h3><c:out value="${ad.title}"/></h3>
                </a>

                <form action="/delete" method="POST">
                    <input type="submit" class="btn btn-primary btn-block" value="Delete">
                </form>
            </c:forEach>
        </div>
    </div>
    <jsp:include page="/WEB-INF/partials/bottom.jsp"/>
</body>
</html>
