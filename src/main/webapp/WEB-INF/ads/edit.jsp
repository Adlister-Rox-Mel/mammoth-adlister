<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">

    <form action="/ads/edit" method="post">
        <div class="panel panel-primary">
            <div class="panel-heading">TITLE</div>
            <div class="panel-body">
                <input class="col-sm-12" type="text" value="<c:out value="${ad.title}"/>">
            </div>
        </div> <!-- end title panel -->

        <div class="panel panel-primary">
            <div class="panel-heading">DESCRIPTION</div>
            <div class="panel-body">
                <input class="col-sm-12" type="text" value="<c:out value="${ad.description}"/>">
            </div>
        </div> <!-- end description panel -->


        <%--<div class="panel panel-primary">--%>
            <%--<div class="panel-heading">--%>
             <%--<input name="ad_title" type="text" size="100" value="<c:out value="${ad.title}"/>">--%>
        <%--</div>--%>
            <%--<div class="panel-body">--%>
                <%--<input name="ad_description" type="text"  size="300" value= "<c:out value="${ad.description}"/>">--%>
            <%--</div>--%>
        <%--</div>--%>
        <input type="hidden" name="ad_id" value="<c:out value="${ad.id}"/>">
        <input type="submit" class="btn btn-primary btn-block" value="Update Ad">

    </form>



<div id="deleteButton" type="submit" class="btn btn-danger btn-block">
    <a  id="#delete" href="/delete?ad_id=${ad.id}">
        <h4 style="color: white">Delete Ad</h4>
    </a>
</div>

</div>

<jsp:include page="/WEB-INF/partials/bottom.jsp"/>
</body>
</html>
