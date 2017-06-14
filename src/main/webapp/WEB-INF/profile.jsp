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
        <div class="panel panel-primary">
            <div class="panel-heading"><h3>Here are yours ads!</h3></div>
            <div class="panel-body">
            <table class="table table-striped">
                <c:forEach var="ad" items="${myAds}">
                    <tr>
                        <td class="panel-body ads-edit-wrapper">
                            <a href="/ads/show?ad_id=${ad.id}">
                                <c:out value="${ad.title}"/>
                            </a>
                            <span class="caret ads-edit"></span>
                        </td>
                    </tr>



                    <div id="editButton" type="submit" class="btn btn-danger">
                        <a  href="/ads/edit?ad_id=${ad.id}">
                            <h4 id="#edit">Edit/Delete Ad</h4>
                        </a>
                    </div>
                    <%--<div id="deleteButton" type="submit" class="btn btn-danger">--%>
                        <%--<a  href="/delete?ad_id=${ad.id}">--%>
                            <%--<h4 id="#delete">Delete Ad</h4>--%>
                        <%--</a>--%>
                    <%--</div>--%>

                </c:forEach>
            </table>
            </div>
        </div> <!-- end panel -->
    </div>
    <jsp:include page="/WEB-INF/partials/bottom.jsp"/>
</body>
</html>
