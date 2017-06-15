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
                    <input name="ad_title" type="text" size="50" value="<c:out value="${ad.title}"/>">
                </div>
                <div id="price" class="col-xs-4">
                    <input type="text" name="ad_price" value="<c:out value="${ad.price}"/>">
                </div>

            </div>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-1"></div>
                <div class="col-xs-5">
                    <img id="imgs" src="../../img/${ad.url}">
                    <input type="hidden" id="url" name="url">
                    <input id="choose-img" type="file" onchange="imgchange(event)" />
                    <img id="imgs" />
                </div>
                <div class="col-xs-1"></div>
                <div class="col-xs-4">
                   <textarea name="ad_description" rows="10" cols="55" id="editDesc"> <c:out value="${ad.description}"/></textarea>
                </div>
                <div class="col-xs-1"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div class="well well-sm" style="margin-bottom: 0"><strong>Category:</strong> <input name="ad_category" id="editCategory" type="text" size="65" value="<c:out value="${ad.category}"/>"></div>
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
<script>
    function imgchange(event){
        $("#imgs").attr('src',URL.createObjectURL(event.target.files[0])).fadeIn();
        $('#url').val(event.target.files[0].name);
    }
</script>
</body>
</html>
