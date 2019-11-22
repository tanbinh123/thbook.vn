<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
    <head>
        <title> Nhà sách THBOOK </title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">  
        <link rel="stylesheet" href="<c:url value="/resources/styles/css.css" />"> 
        <link rel="stylesheet" href="<c:url value="/resources/styles/bootstrap.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/styles/font-awesome.css" />">
        <script src="<c:url value="/resources/styles/bootstrap.js" />"></script>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v4.0"></script>
    </head>
    <body>
        <jsp:include page="include/menu.jsp" />
        <br>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="../../thbook">Trang Chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">${product.name}</li>
            </ol>
        </nav>
                          
        <div id="book">
            <div class="container">
                <div class="row">
                    <div  class="col-md-3 img-hover">			
                        <div class="card">

                            <img src="${product.images}" class="img-responsive" >
                        </div>
                         <div class="card-block">                                            
                                              
                                            </div>
                    </div>
                        
                     
                    <div  class="col-md-9">
                        <div class="information">
                            <div class="title">
                                <h2>${product.name}</h2>
                                <hr>
                            </div>
                            <div class="order">
                                <span class="price">
                                    <span class="sale">GIÁ : 
                                        <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${product.price}" /> VNĐ
                                    </span>
                                </span>
                                <button id="cartclick" style="padding: 10px; margin-bottom: -left: 210px; margin0px;" type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModalLong">
                                    <a href="/thbook/addToCart/${product.id}"><i aria-hidden="true" class="fa fa-cart-plus"></i><span> Thêm vào giỏ hàng</span></a>
                                </button>
                            </div>
                            <hr>
                        </div>
                        <div class="reccomendation">
                            <p> 
                            ${product.description}
                            </p>
                          
                     
                        </div>
                    </div>
                </div>
            </div>	   
        </div>
        <br>
        <div id="more">
                  <div class="container">
            <div class="row blog">
                <div class="col-md-12">
                     <h3 class="pt-1 pb-1"><i class="fa fa-book" aria-hidden="true"></i>CÓ THỂ BẠN QUAN TÂM </h3>
                    <div id="blogCarousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#blogCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#blogCarousel" data-slide-to="1"></li>
                        </ol>
                        <div class="carousel-inner">

                            <div class="carousel-item active">
                                <div class="row">
                                <div class="card-deck-wrapper">
                            <div class="card-deck">
                                <c:forEach var="product" items="${products}">
                                     <div class="col-md-3">
                                    <a href="./${product.id}">
                                        <div class="card">
                                            <img class="img-responsive" src="${product.images}">
                                            <div class="card-block">
                                                <h6 class="card-title">${product.name}</h6>
                                                <p class="card-text text-info"> <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${product.price}" /> VNĐ</p>
                                            </div>
                                        </div>
                                    </a>
                                         </div>    
                                </c:forEach>				
                            </div>                                  
                        </div>
                                </div>
                                <!--.row-->
                            </div>
                            <!--.item-->

                            <div class="carousel-item">
                                <div class="row">
                                    <div class="card-deck-wrapper">
                            <div class="card-deck">
                                <c:forEach var="product" items="${products1}">
                                     <div class="col-md-3">
                                    <a href="./${product.id}">
                                        <div class="card">
                                            <img class="img-responsive" src="${product.images}">
                                            <div class="card-block">
                                                <h6 class="card-title">${product.name}</h6>
                                                <p class="card-text text-info"> <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${product.price}" /> VNĐ</p>
                                            </div>
                                        </div>
                                    </a>
                                         </div>    
                                </c:forEach>				
                            </div>                                   
                        </div>
                                </div>                        
                            </div>      
                        </div>
                    </div>
                </div>
            </div>
         </div>
        </div>  
        
         
        <br>
        <jsp:include page="include/cart.jsp" />
        <jsp:include page="include/footer_index.jsp" />
    </body>
</html>