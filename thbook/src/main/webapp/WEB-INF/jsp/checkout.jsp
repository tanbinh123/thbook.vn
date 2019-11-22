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
        <div class="phanhai">
            <div class="container">
                <div class="row">
                    <div class="col-xs-7">
                        <br>
                        <br>
                        <div class="modal-body">
                            <div class="container"> 
                                <c:if test="${sessionScope.order != null}" >
                                    <form method="POST" action="/thbook/updateBookOnCart/">
                                        <h3>Thông tin đơn hàng</h3>
                                        <br>
                                        <table id="cart" class="table table-hover table-condensed"> 
                                            <thead> 
                                                <tr> 
                                                    <th style="width:50%">Tên sản phẩm</th> 
                                                    <th style="width:10%">Giá</th> 
                                                    <th style="width:8%">Số lượng</th> 
                                                    <th style="width:22%" class="text-center">Thành tiền</th> 
                                                    <th style="width:10%"> </th> 
                                                </tr> 
                                            </thead> 
                                            <tbody>
                                                <c:forEach var="orderDetail" items="${sessionScope.order.orderDetails}"> 
                                                    <tr> 
                                                        <td data-th="Product"> 
                                                            <div class="row"> 

                                                                <div class="col-sm-10"> 

                                                                    <p>${orderDetail.product.name}</p> 
                                                                </div> 
                                                            </div> 
                                                        </td> 
                                                        <td data-th="Price">
                                                            <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${orderDetail.product.price}" /> đ
                                                        </td> 
                                                        <td data-th="Quantity">
                                                            <input class=" text-center" name="quantity" value="${orderDetail.quantity}" type="number">
                                                        </td> 
                                                        <td data-th="Subtotal" class="text-center"> 
                                                            <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${orderDetail.total}" /> đ
                                                        </td> 
                                                        <td class="actions" data-th="">
                                                            <button class="btn btn-warning">
                                                                <a href="/thbook/deteteBookOnCart/${orderDetail.product.id}"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                                            </button>
                                                        </td> 
                                                    </tr> 
                                                </c:forEach>
                                            </tbody>
                                            <tfoot> 
                                                <tr> 

                                                    <td colspan="2" class="hidden-xs"></td> 
                                                    <td>
                                                        <button type="submit" class="btn btn-success btn-block">update</button>
                                                    </td> 
                                                    <td class="hidden-xs text-center">
                                                        <strong>

                                                            Tổng tiền <fmt:formatNumber type = "number" maxFractionDigits  = "3" value = "${sessionScope.order.total}" /> đ
                                                        </strong>
                                                    </td> 

                                                </tr> 
                                            </tfoot> 
                                        </table>
                                    </c:if>
                                </form>
                            </div>
                        </div>

                    </div>
                    <div class="col-xs-5">
                        <form action="/thbook/checkout/" method="POST">
                            <br>
                            <br>
                            <h3>Thông tin thanh toán</h3>
                            <br>
                            <table border="0" class="table">
                                <thead>
                                    <tr>
                                        <td><span>Tên Đầy Đủ</span></td>
                                        <td><input type="text" name="fullName" class="form-control" placeholder="Full name"></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><span>Email</span></td>
                                        <td><span><input type="email" name="email" class="form-control" placeholder="Email"></span></td>
                                    </tr>
                                    <tr>
                                        <td><span>Địa Chỉ</span></td>
                                        <td>  <input type="text" name="address" class="form-control" placeholder="Address">
                                    </tr>
                                    <tr>
                                        <td><span>Số ĐIện Thoại</span></td>
                                        <td><input type="number" name="phone" class="form-control" placeholder="Tetephonenumer"</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>  
                                            <button type="submit" class="btn btn-primary btn-block btn-flat">Xác Nhận Thông Tin</button>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>








                        </form>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="include/cart.jsp"/>
        <jsp:include page="include/footer_index.jsp"/>


    </body>
</html>


