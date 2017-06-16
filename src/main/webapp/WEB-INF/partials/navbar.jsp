<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default" style="background-color: #EBF4F9">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads"><strong style="color: #284967">Find your jam</strong></a>
        </div>
        <form class="navbar-form navbar-left" role="search" method="post" action="/ads/search">
            <div class="form-group">
                <input name="search" id="search" type="text" class="form-control" placeholder="Search Ad">
            </div>
            <button type="submit" style="background-color: #284967" class="btn btn-primary glyphicon glyphicon-search"></button>
        </form>
        <c:choose>
            <c:when test="${user == null}">
            <div id="nav-signin-register" class="nav navbar-nav navbar-right">
                <span>Hi! <a href="/login">Sign in</a> or <a href="/register">Register</a></span>
            </div>
            </c:when>
            <c:otherwise>
                <div id="nav-signin-register" class="dropdown nav navbar-nav navbar-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        Hi ${user.username}! <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/profile">My Ads</a></li>
                        <li><a href="/ads/create">Create Ad</a></li>
                        <li><a href="/profile/update">Update Profile</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="/logout">Log out</a></li>
                    </ul>
                </div>
            </c:otherwise>
        </c:choose>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>



