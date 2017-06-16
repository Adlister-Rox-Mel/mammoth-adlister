<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Melody Rox" />
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
</body>
</html>
