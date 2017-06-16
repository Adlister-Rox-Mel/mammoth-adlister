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

        #price {
            text-align: end;
        }

        #deleteButton {
            float: right;
            margin-right: 15px;
            margin-top: 15px;
            margin-bottom: 0;
        }

        #updateButton {
            float: left;
            margin-left: 15px;
            margin-top: 15px;
            margin-bottom: 0;
        }


    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <div class="panel panel-default">
        <form action="/ads/edit" method="post">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-8">
                        <input  name="ad_title" type="text" size="50" value="<c:out value="${ad.title}"/>">
                    </div>
                    <div id="price" class="col-xs-4">
                        <input name="ad_price" type="text" value="<c:out value="${ad.price}"/>">
                    </div>

                </div>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-1"></div>
                    <div class="col-xs-5">
                        <img id="imgs" src="../../img/${ad.url}">
                        <input type="hidden" id="ad_url" name="ad_url">
                        <input id="choose-img" class="btn btn-warning" style="background:black; border:white;" value="Replace Image" type="file" onchange="imgchange(event)" />
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
            <div class="row info">
                <div class="col-xs-6">
                    <input type="hidden" name="user_id" value="<c:out value="${ad.userId}"/>">
                    <input type="hidden" name="ad_id" value="<c:out value="${ad.id}"/>">
                    <input id="updateButton" type="submit" class="btn btn-info" value="Update Ad">
                </div>

                <div class="col-xs-6">
                    <div id="deleteButton" class="btn btn-danger">
                        <a id="#delete" href="/delete?ad_id=${ad.id}" style="color: white"> Delete Ad</a>
                    </div>
                </div>
            </div>
        </form>
    </div> <!-- end panel -->
</div>

<jsp:include page="/WEB-INF/partials/bottom.jsp"/>
<script>
    function imgchange(event){
        $("#imgs").attr('src',URL.createObjectURL(event.target.files[0])).fadeIn();
        $('#ad_url').val(event.target.files[0].name);
    }
</script>
</body>
</html>
