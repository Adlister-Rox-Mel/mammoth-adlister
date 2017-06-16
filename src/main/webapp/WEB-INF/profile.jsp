<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <style>
        #user-img {
            width: 100px;
            height: 100px;
            margin-left: 10%;
        }

        .jumbotron {
            display: flex;
            justify-content: space-around;
            background-color: #ebf4f9;
        }

        .well {
            background-color: white;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />


    <div class="container">
        <div class="jumbotron">
            <h1>Welcome, <c:out value="${sessionScope.user.getUsername()}"/>!</h1>
            <img src="../../img/${user.url}" id="user-img">
            <div>
                <div class="well well-sm">
                    <strong>P: </strong><c:out value="${user.phone}"/>
                </div>
                <div class="well well-sm">
                    <strong>E: </strong><c:out value="${user.email}"/>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" style="text-align:center; font-size:30px; color:#337ab7;">My ads!</div>
            <div class="panel-body">
            <table class="table table-striped">
                <c:forEach var="ad" items="${myAds}">
                    <tr>
                        <td class="panel-body ads-edit-wrapper">
                            <a href="/ads/show?ad_id=${ad.id}">
                                <c:out value="${ad.title}"/>
                            </a>
                            <a href="/ads/edit?ad_id=${ad.id}" role="button" class="glyphicon glyphicon-pencil ads-edit"></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            </div>
        </div> <!-- end panel -->
    </div>
    <jsp:include page="/WEB-INF/partials/bottom.jsp"/>
</body>
</html>
