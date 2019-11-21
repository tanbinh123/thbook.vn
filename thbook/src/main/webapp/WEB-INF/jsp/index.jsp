<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v4.0"></script>
        <script src="<c:url value="/resources/styles/bootstrap.js" />"></script>
    </head>
    <body>
        <jsp:include page="include/menu.jsp" />
   
                                
         <div  class="phan2 pt-3 mt-2">
            <div class="container">
            <div class="row">
            <div class="col-12 col-sm-4">
            <div class="card bg-light mb-4">
                <div class="card-header bg-success text-white text-uppercase"><i class="fa fa-list"></i> DANH MỤC CHÍNH</div>
                <ul class="list-group category_block">
                    <li class="list-group-item"> <a href="category/Sách Toán/1" class="list-group-item list-group-item-action "><i class="fa fa-book" aria-hidden="true"></i> Sách Toán</a> </li>
                            <li class="list-group-item"> <a href="category/Sách Lý/1" class="list-group-item list-group-item-action"><i class="fa fa-book" aria-hidden="true"></i> Sách Lý</a> </li>
                            <li class="list-group-item"> <a href="category/Sách Hóa/1" class="list-group-item list-group-item-action"><i class="fa fa-book" aria-hidden="true"></i> Sách Hóa</a> </li>
                           <li class="list-group-item">  <a href="category/Sách Ngữ Văn/1" class="list-group-item list-group-item-action"><i class="fa fa-book" aria-hidden="true"></i> Sách Văn</a> </li>
                            <li class="list-group-item"> <a href="category/Sách Anh/1" class="list-group-item list-group-item-action"><i class="fa fa-book" aria-hidden="true"></i> Sách Anh Văn</a> </li>
                </ul>
            </div>            
                 </div> 
                
                  <div class="col-12 col-sm-8">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active">
                                    <img src="<c:url value="/resources/images/slide1.png" />">
                                </div>
                                <div class="carousel-item">
                                    <img src="<c:url value="/resources/images/slide2.png" />">
                                </div>
                                <div class="carousel-item">
                                    <img src="<c:url value="/resources/images/slide3.png" />">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                <span class="icon-prev" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                <span class="icon-next" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                
                
             </div>                  
        </div>
             
             </div>
                                
        <div class="phan3 mt-2 pb-1">
            <div class="container">
                <div class="row bg-white sp">
                    <div class="col-md-12">
                        <h3 class="pt-1 pb-1"><i class="fa fa-book" aria-hidden="true"></i>
  SÁCH TOÁN </h3>
                        <div class="card-deck-wrapper">
                            <div class="card-deck">
                                <c:forEach var="product" items="${mathProduct}">
                                     <div class="col-md-3">
                                    <a href="./book/${product.id}">
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
        <div class="phan3 mt-2 pb-1">
            <div class="container">
                <div class="row bg-white sp">
                    <div class="col-sm-12">
                        <h3 class="pt-1 pb-1"><i class="fa fa-book" aria-hidden="true"></i>
  SÁCH LÝ </h3>
                        <div class="card-deck-wrapper">
                            <div class="card-deck">
                                <c:forEach var="product" items="${physicalProduct}">
                                    <div class="col-md-3">
                                    <a href="./book/${product.id}">
                                        <div class="card">
                                            <img  class="img-responsive" src="${product.images}">
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
        <div class="phan3 mt-2 pb-1">
            <div class="container">
                <div class="row bg-white sp">
                    <div class="col-sm-12">
                        <h3 class="pt-1 pb-1"><i class="fa fa-book" aria-hidden="true"></i>
  SÁCH HÓA </h3>
                        <div class="card-deck-wrapper">
                            <div class="card-deck">
                                <c:forEach var="product" items="${chemistryProduct}">
                                      <div class="col-md-3">
                                    <a href="./book/${product.id}">
                                        <div class="card">
                                            <img  class="img-responsive" src="${product.images}">
                                            <div class="card-block">
                                                <h6 class="card-title">${product.name}</h6>
                                                <p class="card-text text-info"><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${product.price}" /> VNĐ</p>
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
        <div class="phan3 mt-2 pb-1">
            <div class="container">
                <div class="row bg-white sp">
                    <div class="col-sm-12">
                        <h3 class="pt-1 pb-1"><i class="fa fa-book" aria-hidden="true"></i>
  SÁCH NGỮ VĂN </h3>
                        <div class="card-deck-wrapper">
                            <div class="card-deck">
                                    <c:forEach var="product" items="${literatureProduct}">
                                      <div class="col-md-3">
                                    <a href="./book/${product.id}">
                                        <div class="card">
                                            <img  class="img-responsive" src="${product.images}">
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
                                        <div class="phan3 mt-2 pb-1">
            <div class="container">
                <div class="row bg-white sp">
                    <div class="col-sm-12">
                        <h3 class="pt-1 pb-1"><i class="fa fa-book" aria-hidden="true"></i>
  SÁCH ANH </h3>
                        <div class="card-deck-wrapper">
                            <div class="card-deck">
                                <c:forEach var="product" items="${englishProduct}">
                                      <div class="col-md-3">
                                    <a href="./book/${product.id}">
                                        <div class="card">
                                            <img  class="img-responsive" src="${product.images}">
                                            <div class="card-block">
                                                <h6 class="card-title">${product.name}</h6>
                                                <p class="card-text text-info"><fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${product.price}" /> VNĐ</p>
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
        <jsp:include page="include/cart.jsp"/>
        <jsp:include page="include/footer_index.jsp" />
        <script>
            $(function () {
                $(".lentren").click(function () {
                    $("html, body").animate({scrollTop: 0});
                });
            });
        </script>
    </body>
</html>


