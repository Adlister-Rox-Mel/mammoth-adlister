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
            margin-top: 0px;
            margin-bottom: 15px;
            display: none;
        }

        /*#categ {*/
            /*width: 100%;*/
        /*}*/
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
            <input id="category" name="category" type="text" class="form-control">
            <%--<!-- Split button -->--%>
            <%--<div class="btn-group">--%>
                <%--<button id="categ" type="button" class="btn btn-info">Category</button>--%>
                <%--<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                    <%--<span class="caret"></span>--%>
                    <%--<span class="sr-only">Toggle Dropdown</span>--%>
                <%--</button>--%>
                <%--<ul class="dropdown-menu">--%>
                    <%--<li class="categ">Furniture</li>--%>
                    <%--<li class="categ">Cars & Trucks</li>--%>
                    <%--<li class="categ">Beauty & Health</li>--%>
                    <%--<li class="categ">Computers</li>--%>
                    <%--<li class="categ">Cell Phones</li>--%>
                <%--</ul>--%>
            <%--</div>--%>
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text"></textarea>
        </div>

        <input type="hidden" id="url" name="url">
        <input id="choose-img" type="file" onchange="imgchange(event)" />
        <img id="imgs" />


        <input type="submit" class="btn btn-block btn-primary">
    </form>


</div>

<jsp:include page="/WEB-INF/partials/bottom.jsp"/>

<script>
function imgchange(event){
    $("#imgs").attr('src',URL.createObjectURL(event.target.files[0])).fadeIn();
    $('#url').val(event.target.files[0].name);

//    $('.categ').click(function () {
//        $('#category').val($(this).html());
//        console.log("test");
//    });
}
</script>
</body>
</html>
