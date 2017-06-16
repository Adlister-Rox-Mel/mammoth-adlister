<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Ad" />
    </jsp:include>
    <style>
        #imgs {
            max-width:450px;
            max-height:400px;
        }

        #price {
            text-align: end;
        }

        #deleteButton {
            float: right;
            margin-right: 15px;
            margin-top: 15px;
            margin-bottom: 0;
            display: none;
        }
        #fakeDeleteButton {
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

        .menu {
            font-size: 15px;
            padding-bottom: 0;
            padding-top: 0;
            background-color: whitesmoke;
        }

        #warningMessage {
            display: none;
            /*float: right;*/
            /*background-color: orangered;*/
            /*font-weight: bold;*/
            /*font-size: 2vw;*/
            /*color: white;*/
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
                        <input name="ad_price" type="text" value="<c:out value="${ad.price}"/>" style="text-align:right">
                    </div>

                </div>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-1"></div>
                    <div class="col-xs-5">
                        <img class="img-responsive" id="imgs" src="../../img/${ad.url}">
                        <input type="hidden" id="ad_url" name="ad_url">
                        <input id="choose-img" class="btn btn-warning" style="background:black; border:white;" value="Replace Image" type="file" onchange="imgchange(event)" />
                    </div>
                    <div class="col-xs-1"></div>
                    <div class="col-xs-4">
                       <textarea name="ad_description" rows="10" cols="55" id="editDesc" style="text-align:justify"> <c:out value="${ad.description}"/></textarea>
                    </div>
                    <div class="col-xs-1"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="well well-sm" style="margin-bottom: 0"><strong>Category:</strong>
                        <input id="editCategory" name="ad_category" type="hidden" value="${ad.category}">
                        <div class="btn-group">
                            <button type="button" class="menu btn btn-lg dropdown-toggle form-control" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="caret"></span> ${ad.category}
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="categ" href="#">Guitar</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a class="categ" href="#">Piano</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a class="categ" href="#">Violin</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a class="categ" href="#">Cello</a></li>
                            </ul>

                        </div>
                    </div>

                </div>
            </div>
            <div class="row info">
                <div class="col-xs-6">
                    <input type="hidden" name="user_id" value="<c:out value="${ad.userId}"/>">
                    <input type="hidden" name="ad_id" value="<c:out value="${ad.id}"/>">
                    <input id="updateButton" type="submit" class="btn btn-info" value="Update Ad">
                </div>

                <div class="col-xs-6">
                    <div id="warningMessage" class="alert alert-danger alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <strong>Do you want to delete this ad? </strong>
                    </div>
                    <div id="fakeDeleteButton" class="btn btn-danger"><div id="warning"></div>
                        <a id="#delete" href="#" style="color: white"> Delete Ad</a>
                    </div>
                    <div id="deleteButton" class="btn btn-danger"><div id="warning"></div>
                        <a id="#delete" href="/delete?ad_id=${ad.id}" style="color: white"> Yes, Delete Ad</a>
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


    $('.menu').click(function () {
        $(this).toggleClass('menu-click');
    });

    $('.categ').click(function (e) {
        e.preventDefault();
        var name = ' <span class="caret"></span> ' + $(this).html();
        $('.menu').html(name);
        $('#editCategory').val($(this).html());
    });

    $('#fakeDeleteButton').click(function () {

        $('#deleteButton').css('display', "inline-block");
        $('#warningMessage').css('display', 'inline-block');
        $('#fakeDeleteButton').css('display', 'none');

    });


</script>
</body>
</html>
