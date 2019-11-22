<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
    <head>
        <title> Nhà sách THBOOK </title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">  
        <link rel="stylesheet" href="<c:url value="/resources/styles/css.css"></c:url>"> 
        <link rel="stylesheet" href="<c:url value="/resources/styles/bootstrap.css"></c:url>">
        <link rel="stylesheet" href="<c:url value="/resources/styles/font-awesome.css"></c:url>">
        <script src="<c:url value="/resources/styles/bootstrap.js"></c:url>"></script>
            <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v4.0"></script>
        </head>
        <body>
            <div id="fb-root"></div>

        <jsp:include page="include/menu.jsp"/>

        <div class="row pt-3">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tìm Kiếm</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="phanhai">
            <div class="container">
                <div class="row">
                    <div class="col-xs-3">
                        <img src="<c:url value="/resources/images/banner.png" />">
                    </div> 
                    <div class="col-xs-9">
                        <div class="row">
                           
                           
                            <c:forEach var="product" items="${products}">
                                <div class="col-md-3">                           
                                    <a href=" <c:url value="/book/${product.id}" />">
                                        <div class="card">
                                            <img  style="height:200px; width:180px;" src="${product.images}">
                                            <div class="card-body">
                                                <h6 class="card-title">${product.name}</h6>
                                                <p class="card-text">
                                                    <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${product.price}" /> VNĐ
                                                </p>
                                            </div>
                                        </div>
                                </div>


                            </c:forEach>
                        </div>
                        <div class="row">
                            <div class="container text-xs-center">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="1">1</a></li>
                                        <li class="page-item"><a class="page-link" href="2">2</a></li>
                                        <li class="page-item"><a class="page-link" href="3">3</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                    <br>

        <jsp:include page="include/cart.jsp"/>
        <jsp:include page="include/footer_index.jsp"/>


    </body>
</html>


