<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to Melody Rox site!" />
    </jsp:include>
    <style>
        .btn-primary {
            background-color: #284967;
            color: #ffffff;
            font-weight: bold;
            font-size: 15px;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h1 style="text-align:center;margin-bottom:35px">Welcome to Melody Rox site!</h1>
        <div class="row">
            <c:forEach var="ad" items="${ads}">
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img class="img-responsive" src="../../img/${ad.url}" style="max-width:250px; height:200px">
                        <div class="caption">
                            <h4 style="text-align:center">${ad.title}</h4>
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
