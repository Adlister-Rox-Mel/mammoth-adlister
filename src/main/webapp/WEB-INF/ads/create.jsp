<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>

    <style>
        #choose-img {
            margin-bottom: 15px;
        }
        #imgs {
            height: 125px;
            border: 1px solid black;
            margin-top: 0;
            margin-bottom: 15px;
            display: none;
        }

        .menu {
            font-size: 15px;
            padding-bottom: 0;
            padding-top: 0;
            border:1px solid #cccccc;
            text-align: left;
            margin-bottom: 13px;
            border-radius: 5px;
        }

        .btn-default {
            background-color: #284967;
            color: #ffffff;
            font-weight: bold;
            font-size: 15px;
        }

        label {
            font-size: 17px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>;
<div class="container">

    <h1>Create a new Ad</h1>
    <form action="/ads/create" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <input id="price" name="price" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="category">Category</label>
            <br>
            <input id="category" name="category" type="hidden">
            <div class="btn-group" style="display: block">
                <button type="button" class="menu btn btn-lg dropdown-toggle form-control" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a class="categ" href="#">Guitar</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a class="categ" href="#">Piano</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a class="categ" href="#">Violin</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a class="categ" href="#">Cello</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a class="categ" href="#">Drums</a></li>
                </ul>
            </div>
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text"></textarea>
        </div>

        <input type="hidden" id="url" name="url" value="empty_img.png">
        <input id="choose-img" type="file" onchange="imgchange(event)" />
        <img id="imgs" />


        <input type="submit" class="btn btn-block btn-default">
    </form>


</div>

<jsp:include page="/WEB-INF/partials/bottom.jsp"/>

<script>
    function imgchange(event){
        $("#imgs").attr('src',URL.createObjectURL(event.target.files[0])).fadeIn();
        $('#url').val(event.target.files[0].name);
    }

    $('.menu').click(function () {
        $(this).toggleClass('menu-click');
    });

    $('.categ').click(function (e) {
        e.preventDefault();
        var name = ' <span class="caret"></span> ' + $(this).html();
        $('.menu').html(name);
        $('#category').val($(this).html());
    });
</script>
</body>
</html>
