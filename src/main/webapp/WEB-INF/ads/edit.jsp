<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Ad" />
    </jsp:include>
    <style>
        #imgs {
            width: 100%;
        }

        .info {
            padding-bottom: 15px;
        }

        #price {
            text-align: end;
        }

        #editDesc {
            width: 30em;
        }

        #deleteButton {
            margin-top: 10em;
            float: right;
            margin-right: 35vw
        }

        #updateButton {
            float: right;
            margin-right: 36vw
        }


    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">


        <%--<div class="panel panel-primary">--%>
            <%--<div class="panel-heading">--%>
             <%--<input name="ad_title" type="text" size="100" value="<c:out value="${ad.title}"/>">--%>
        <%--</div>--%>
            <%--<div class="panel-body">--%>
                <%--<input name="ad_description" type="text"  size="300" value= "<c:out value="${ad.description}"/>">--%>
            <%--</div>--%>
        <%--</div>--%>




    <form action="/ads/edit" method="post">

    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-8">
                    <input  type="text" value="<c:out value="${ad.title}"/>">
                </div>
                <div id="price" class="col-xs-4">
                    <input type="text" value="<c:out value="$${ad.price}"/>">
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
                    <input id="editDesc" type="text" size="500" value="<c:out value="${ad.description}"/>">
                </div>
                <div class="col-xs-1"></div>
            </div>
        </div>
        <input type="hidden" name="ad_id" value="<c:out value="${ad.id}"/>">
        <input id="updateButton" type="submit" class="btn btn-info" value="Update Ad">

    </form>

        <div class="row info">
            <div class="col-xs-12">
                <div id="deleteButton" type="submit" class="btn btn-danger">
                    <a  id="#delete" href="/delete?ad_id=${ad.id}">
                        <h4 style="color: white">Delete Ad</h4>
                    </a>
                </div>
            </div>
        </div>
    </div> <!-- end panel -->


</div>

<jsp:include page="/WEB-INF/partials/bottom.jsp"/>
</body>
</html>
