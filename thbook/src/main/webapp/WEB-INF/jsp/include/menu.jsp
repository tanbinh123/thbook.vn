<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="menutren">
    <nav class="navbar navbar-dark bg-success">
        <div class="container">
            <a class="navbar-brand" href="/thbook">THBOOK</a>
            <button class="navbar-toggler hidden-sm-up float-xs-right" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar2">
            </button>
            <div class="collapse navbar-toggleable-xs" id="exCollapsingNavbar2">
                <ul class="nav navbar-nav float-xs-right">
                    <li class="nav-item">
                        <form class="form-inline" action="<c:url value="/search"/>" method="GET">
                            <input class="form-control" name="keyword" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-info mr-3" type="submit">Search</button>
                        </form>
                    </li>
                    <li class="nav-item ">
                        <button id="cartclick"  type="submit" class="btn btn-info" data-toggle="modal" data-target="#exampleModalLong">
                            <span style="font-weight:bold;" class="icon"><img  src="<c:url value="/resources/images/cart.png" />">Giỏ Hàng</span>
                        </button>
                    </li>
                    <li class="nav-item">
                        <a href="/thbook/register" class="btn btn-info" type="submit">Đăng ký</a>
                    </li>
                    <li class="nav-item">
                        <a href="/thbook/login" class="btn btn-info" type="submit">Đăng nhập</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>