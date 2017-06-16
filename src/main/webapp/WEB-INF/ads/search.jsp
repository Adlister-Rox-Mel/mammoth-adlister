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

        .btn-primary {
            background-color: #284967;
            color: #ffffff;
            font-weight: bold;
            font-size: 15px;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
    <div class="container">
        <div class="list-group">
            <h3 style="text-align:center;margin-bottom:35px" class="list-group-item">
                Here are the ads!
            </h3>
            <div class="row">
                <c:forEach var="ad" items="${searchedAds}">
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
    </div>
    <jsp:include page="/WEB-INF/partials/bottom.jsp"/>
</body>
</html>
