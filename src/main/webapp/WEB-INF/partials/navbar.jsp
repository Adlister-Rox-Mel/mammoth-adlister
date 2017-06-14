<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
        </div>
        <form class="navbar-form navbar-left" role="search" method="post" action="/ads/search">
            <div class="form-group">
                <input name="search" id="search" type="text" class="form-control" placeholder="Search Ad">
            </div>
            <button type="submit" class="btn btn-default glyphicon glyphicon-search"></button>
        </form>
        <c:choose>
            <c:when test="${user == null}">
            <div id="nav-signin-register" class="nav navbar-nav navbar-right">
                <span>Hi! <a href="/login">Sing in</a> or <a href="/register">Register</a></span>
            </div>
            </c:when>
            <c:otherwise>
                <div id="nav-signin-register" class="nav navbar-nav navbar-right">
                    <span>Hi ${user.username}!</span>
                </div>
            </c:otherwise>
        </c:choose>
        <%--<ul class="nav navbar-nav navbar-right">--%>
            <%--<li><a href="/register">Register</a></li>--%>
            <%--<li><a href="/login">Login</a></li>--%>
            <%--<li><a href="/logout">Logout</a></li>--%>
        <%--</ul>--%>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
