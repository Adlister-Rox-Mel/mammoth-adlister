<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
    <style>
        #landingPage {
            background-image: url("/img/musicWallpaper.jpg");
        }
        h1{
            font-family: Trebuchet MS;
            font-size: 700%;
            font-weight: bold;

        }
    </style>
</head>
<body id="landingPage">
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Melody Rox!</h1>
    </div>
    <jsp:include page="/WEB-INF/partials/bottom.jsp"/>
<script>
    setInterval(function(){
        $("h1").fadeIn("slow", function () {
        $(this).html("Melody Rocks!");
        });
    },2000);
    setInterval(function(){
        $("h1").fadeIn("slow", function () {
            $(this).html("Melody Rox!");
        });
    },4000);



</script>
</body>
</html>
