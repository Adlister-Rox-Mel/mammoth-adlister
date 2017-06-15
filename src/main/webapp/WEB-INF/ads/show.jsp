<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: roxana
  Date: 6/12/17
  Time: 9:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Ad show page"/>
    </jsp:include>
    <style>
        #imgs {
            width: 100%;
            height: 450px;
        }

        .info {
            padding-bottom: 15px;
        }

        #price {
            text-align: end;
        }

        .btn-info {
            float: right;
            margin-right: 15px;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>;
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-8">
                    <c:out value="${ad.title}"/>
                </div>
                <div id="price" class="col-xs-4">
                    <c:out value="$${ad.price}"/>
                </div>

            </div>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-1"></div>
                <div class="col-xs-5">
                    <img id="imgs" src="../../img/${ad.url}">
                </div>
                <div class="col-xs-1"></div>
                <div class="col-xs-4">
                    <p><c:out value="${ad.description}"/></p>
                </div>
                <div class="col-xs-1"></div>
            </div>
        </div>

        <div class="row info">
            <div class="col-xs-12">
                <button type="button" class="btn btn-info">Show contact info</button>
            </div>
        </div>
    </div> <!-- end panel -->



    <%--<table class="table">--%>
        <%--<tr>--%>
            <%--<th>User Id</th>--%>
            <%--<th>Username</th>--%>
            <%--<th>Email</th>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td><c:out value="${user.id}"/></td>--%>
            <%--<td><c:out value="${user.username}"/></td>--%>
            <%--<td><c:out value="${user.email}"/></td>--%>
        <%--</tr>--%>
    <%--</table>--%>

</div>
<jsp:include page="/WEB-INF/partials/bottom.jsp"/>
<script>
    $('.btn-info').click(function () {
        $(this).html("${user.email}");
    })
</script>
</body>
</html>
