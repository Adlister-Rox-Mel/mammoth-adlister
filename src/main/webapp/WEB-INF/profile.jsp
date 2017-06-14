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


                    <div id="deleteButton" type="submit" class="btn btn-danger">
                        <a  href="/delete?ad_id=${ad.id}">
                            <h4 id="#delete">Delete Ad</h4>
                        </a>
                        </div>

            </c:forEach>
        </div>
    </div>
    <jsp:include page="/WEB-INF/partials/bottom.jsp"/>
</body>
</html>
