<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h1 style="text-align: center">WELCOME!</h1>
        <div class="row">
            <c:forEach var="ad" items="${ads}">
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img src="../../img/${ad.url}" style="width: 250px; height: 200px">
                        <div class="caption">
                            <h4>${ad.title}</h4>
                            <p><a href="/ads/show?ad_id=${ad.id}" class="btn btn-primary btn-block" role="button">Go</a></p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
</div>
<jsp:include page="/WEB-INF/partials/bottom.jsp"/>
</body>
</html>
